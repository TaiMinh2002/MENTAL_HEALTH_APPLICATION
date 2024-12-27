import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_controller.dart';
import 'package:mental_healing/data/model/forum_params.dart';
import 'package:mental_healing/data/model/mood_info.dart';
import 'package:mental_healing/data/use_case/mood_use_case.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/import.dart';

class MoodListController extends BaseController
    with SmartLoadListController<Widget> {
  final MoodUseCase _useCase = MoodUseCase();
  final TextEditingController noteController = TextEditingController();

  ForumParams param = ForumParams(page: 1, limit: 20);

  RxList<MoodInfo> listForums = <MoodInfo>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  Future<void> _initData() async {
    isLoadingPage.value = true;
    await _getListMoods();
  }

  Future<void> _getListMoods() async {
    await _useCase
        .getListMoods(
          params: param,
          onSuccess: (data) {
            if (data.isNotEmpty) {
              listForums.value = data;
              error.value = null;
            } else {
              error.value = "No data available" as ApiError?;
            }
          },
          onFailure: (err) {
            error.value = err;
          },
        )
        .whenComplete(() => isLoadingPage.value = false);
  }

  Future<void> moveToExpertDetail(int expertId) async {
    Get.toNamed(
      AppRouter.routerForumDetailPage,
      arguments: expertId,
    );
  }

  void moveToSetMood() {
    Get.toNamed(AppRouter.routerSetMoodPage);
  }

  Future<void> sendMessage(String userMessage) async {
    final userMessage = noteController.text.trim();
    if (userMessage.isEmpty) return;

    try {
      await _useCase.setMood(
        message: userMessage,
        onSuccess: (data) {
          _getListMoods();
          Get.back();
        },
        onFailure: (err) {
          error.value = err.toString() as ApiError?;
        },
      );
    } catch (err) {
      error.value = err.toString() as ApiError?;
    }
  }

  @override
  void onLoadMore() {
    // Nếu cần load thêm dữ liệu, hãy tăng page và gọi lại API
    // param.page += 1;
    _getListMoods();
  }

  @override
  Future<void> onRefresh() async {
    // Reset lại page về 1 và gọi lại API
    // param.page = 1;
    await _initData();
    refreshController.refreshCompleted();
  }
}
