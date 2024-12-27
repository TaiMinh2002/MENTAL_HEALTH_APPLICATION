import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_controller.dart';
import 'package:mental_healing/data/model/expert_info.dart';
import 'package:mental_healing/data/model/expert_params.dart';
import 'package:mental_healing/data/use_case/expert_use_case.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/import.dart';

class ExpertListController extends BaseController
    with SmartLoadListController<Widget> {
  final ExpertUseCase _useCase = ExpertUseCase();
  late int specialization;

  late ExpertParams param;

  RxList<ExpertInfo> listExpertsWidget = <ExpertInfo>[].obs;

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
          onSuccess: (List<ExpertInfo> data) {
            if (data.isNotEmpty) {
              // Gán dữ liệu vào danh sách
              listExpertsWidget.value = data;
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
      AppRouter.routerExpertDetailPage,
      arguments: expertId,
    );
  }

  @override
  void onLoadMore() {
    // Nếu cần load thêm dữ liệu, hãy tăng page và gọi lại API
    // param.page += 1;
    _getListExperts();
  }

  @override
  Future<void> onRefresh() async {
    // Reset lại page về 1 và gọi lại API
    // param.page = 1;
    await _getListExperts();
    refreshController.refreshCompleted();
  }
}
