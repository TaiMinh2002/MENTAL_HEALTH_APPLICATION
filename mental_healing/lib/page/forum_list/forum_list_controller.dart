import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_controller.dart';
import 'package:mental_healing/data/model/forum_info.dart';
import 'package:mental_healing/data/model/forum_params.dart';
import 'package:mental_healing/data/use_case/forum_use_case.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/import.dart';

class ForumListController extends BaseController
    with SmartLoadListController<Widget> {
  final ForumUseCase _useCase = ForumUseCase();

  ForumParams param = ForumParams(page: 1, limit: 20);

  RxList<ForumInfo> listForums = <ForumInfo>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  Future<void> _initData() async {
    isLoadingPage.value = true;
    await _getListForums();
  }

  Future<void> _getListForums() async {
    await _useCase
        .getListExperts(
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

  void moveToIntroForumCreate() {
    Get.offNamed(AppRouter.routerIntroForumCreate);
  }

  @override
  void onLoadMore() {
    // Nếu cần load thêm dữ liệu, hãy tăng page và gọi lại API
    // param.page += 1;
    _getListForums();
  }

  @override
  Future<void> onRefresh() async {
    // Reset lại page về 1 và gọi lại API
    // param.page = 1;
    await _initData();
    refreshController.refreshCompleted();
  }
}
