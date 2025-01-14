import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_controller.dart';
import 'package:mental_healing/data/model/expert/expert_info.dart';
import 'package:mental_healing/data/model/expert/expert_params.dart';
import 'package:mental_healing/data/use_case/expert_use_case.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/import.dart';

class ExpertListController extends BaseController
    with SmartLoadListController<ExpertInfo> {
  final ExpertUseCase _useCase = ExpertUseCase();
  late int specialization;
  RxBool hasMorePage = false.obs;
  late ExpertParams param;

  @override
  void onInit() {
    super.onInit();
    specialization = Get.arguments;
    param = ExpertParams(page: 1, limit: 20, specialization: specialization);
    _initData();
  }

  Future<void> _initData() async {
    isLoadingPage.value = true;
    await _getListExperts();
  }

  Future<void> _getListExperts() async {
    await _useCase
        .getListExperts(
            params: param,
            onSuccess: (data) {
              error.value = null;
              if (param.page == 1) {
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

  Future<void> moveToExpertDetail(int expertId) async {
    Get.toNamed(
      AppRouter.routerExpertDetailPage,
      arguments: expertId,
    );
  }

  @override
  void onLoadMore() {
    if (hasMorePage.value) {
      param = param.copyWith(page: param.page + 1);
      _getListExperts().whenComplete(refreshController.loadComplete);
    }
  }

  @override
  Future<void> onRefresh() async {
    param = param.copyWith(page: 1);
    await _getListExperts();
    refreshController.refreshCompleted();
  }
}
