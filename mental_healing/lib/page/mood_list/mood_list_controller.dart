import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_controller.dart';
import 'package:mental_healing/data/model/forums/forum_params.dart';
import 'package:mental_healing/data/model/mood/mood_info.dart';
import 'package:mental_healing/data/use_case/mood_use_case.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/import.dart';

class MoodListController extends BaseController
    with SmartLoadListController<MoodInfo> {
  final MoodUseCase _useCase = MoodUseCase();
  final TextEditingController noteController = TextEditingController();

  ForumParams _params = const ForumParams(limit: 20, page: 1);
  RxBool hasMorePage = false.obs;

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
            params: _params,
            onSuccess: (data) {
              if (_params.page == 1) {
                error.value = null;
                dataList.clear();
              }
              dataList.addAll(data.data ?? []);
              hasMorePage.value = data.has_more_pages ?? false;
              dataList.refresh();
            },
            onFailure: (err) {
              error.value = err;
            })
        .whenComplete(() {
      isLoadingPage.value = false;
    });
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
