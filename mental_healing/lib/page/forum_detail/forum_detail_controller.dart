import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_controller.dart';
import 'package:mental_healing/data/model/forum_detail.dart';
import 'package:mental_healing/data/use_case/forum_use_case.dart';
import 'package:mental_healing/import.dart';

class ForumDetailController extends BaseController
    with SmartLoadListController<ForumDetail> {
  final ForumUseCase _forumUseCase = ForumUseCase();
  Rx<ForumDetail> forumDetail = ForumDetail().obs;
  late int id;

  @override
  void onInit() {
    id = Get.arguments;
    _initData();
    super.onInit();
  }

  Future<void> _initData() async {
    isLoadingPage.value = true;
    await _getDetailData();
  }

  Future<void> _getDetailData() async {
    await _forumUseCase
        .getForumDetail(
          id: id,
          onSuccess: (data) {
            error.value = null;
            forumDetail.value = data;
            dataList.value = [data];
            dataList.refresh();
          },
          onFailure: (err) {
            error.value = err;
          },
        )
        .whenComplete(() => isLoadingPage.value = false);
  }

  @override
  void onLoadMore() {
    refreshController.loadComplete();
  }

  @override
  Future<void> onRefresh() async {
    await _initData();
    refreshController.refreshCompleted();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
