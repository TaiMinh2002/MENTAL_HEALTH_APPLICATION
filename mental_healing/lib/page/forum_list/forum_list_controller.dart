import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_controller.dart';
import 'package:mental_healing/data/model/forums/forum_info.dart';
import 'package:mental_healing/data/model/forums/forum_params.dart';
import 'package:mental_healing/data/use_case/forum_use_case.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/import.dart';

class ForumListController extends BaseController
    with SmartLoadListController<ForumInfo> {
  final ForumUseCase _forumUseCase = ForumUseCase();
  ForumParams _params = const ForumParams(limit: 20, page: 1, is_joined: false);
  RxBool hasMorePage = false.obs;
  RxBool isJoinedTab = true.obs;

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
    await _forumUseCase
        .getListForum(
            params: _params,
            onSuccess: (data) {
              error.value = null;
              if (_params.page == 1) {
                dataList.clear();
              }
              if (isNotNullOrEmpty(data.data)) {
                dataList.addAll(data.data ?? []);
                hasMorePage.value = data.has_more_pages ?? false;
              }
              dataList.refresh();
            },
            onFailure: (err) {
              error.value = err;
            })
        .whenComplete(() => isLoadingPage.value = false);
  }

  void switchTab(bool isJoined) {
    isJoinedTab.value = isJoined;
    _params = _params.copyWith(page: 1, is_joined: isJoined);
    _getListForums();
  }

  Future<void> moveToDetail(int forumId) async {
    Get.toNamed(
      AppRouter.routerForumDetailPage,
      arguments: forumId,
    );
  }

  void moveToIntroForumCreate() {
    Get.offNamed(AppRouter.routerIntroForumCreate);
  }

  @override
  void onLoadMore() {
    if (hasMorePage.value) {
      _params = _params.copyWith(page: _params.page + 1);
      _getListForums().whenComplete(refreshController.loadComplete);
    }
  }

  @override
  Future<void> onRefresh() async {
    _params = _params.copyWith(page: 1);
    await _getListForums();
    refreshController.refreshCompleted();
  }
}
