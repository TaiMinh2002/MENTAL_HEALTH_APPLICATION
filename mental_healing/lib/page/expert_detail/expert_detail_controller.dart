import 'package:mental_healing/common/helpers/snack_bar_helper.dart';
import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_controller.dart';
import 'package:mental_healing/data/model/expert_detail.dart';
import 'package:mental_healing/data/model/room_create_params.dart';
import 'package:mental_healing/data/model/room_create_result.dart';
import 'package:mental_healing/data/use_case/expert_use_case.dart';
import 'package:mental_healing/data/use_case/room_use_case.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/message/message_controller.dart';

class ExpertDetailController extends BaseController
    with SmartLoadListController<ExpertDetail> {
  final _useCase = ExpertUseCase();
  final RoomUseCase _roomUseCase = RoomUseCase();
  Rx<ExpertDetail> expertDetail = ExpertDetail().obs;
  RoomCreateParams _params = const RoomCreateParams();
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
    await _useCase
        .getExpertDetail(
          id: id,
          onSuccess: (data) {
            error.value = null;
            expertDetail.value = data;
            dataList.value = [data];
            dataList.refresh();
          },
          onFailure: (err) {
            error.value = err;
          },
        )
        .whenComplete(() => isLoadingPage.value = false);
  }

  void handleCreateRoom() {
    _params = _params.copyWith(
      expert_id: expertDetail.value.id,
    );
    showLoading();
    _roomUseCase
        .createRoom(
          params: _params,
          onSuccess: (RoomCreateResult result) async {
            Get.toNamed(
              AppRouter.routerChatExpert,
              arguments: {
                'chatId': result.id,
                'expertId': result.expertId,
                'userId': result.userId,
              },
            );
            Get.find<MessageController>().onRefresh();
          },
          onFailure: (err) {
            SnackBarHelper.showError("Failed to create room: ${err.message}");
          },
        )
        .whenComplete(() => hideLoading());
  }

  @override
  void onLoadMore() {
    refreshController.loadComplete();
  }

  @override
  Future<void> onRefresh() async {
    await _getDetailData();
    refreshController.refreshCompleted();
  }

  @override
  void onClose() {
    _useCase.cancelTokenDetail.cancel();
    super.onClose();
  }
}
