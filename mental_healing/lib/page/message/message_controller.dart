import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_controller.dart';
import 'package:mental_healing/data/model/forum_params.dart';
import 'package:mental_healing/data/model/room_chat_result.dart';
import 'package:mental_healing/data/use_case/chat_expert_use_case.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/import.dart';

class MessageController extends BaseController
    with SmartLoadListController<Widget> {
  final ChatExpertUseCase _useCase = ChatExpertUseCase();

  ForumParams param = ForumParams(page: 1, limit: 20);

  RxList<RoomChatResult> listChats = <RoomChatResult>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  Future<void> _initData() async {
    isLoadingPage.value = true;
    await _getListChats();
  }

  Future<void> _getListChats() async {
    await _useCase
        .getListChats(
          params: param,
          onSuccess: (data) {
            if (data.isNotEmpty) {
              listChats.value = data;
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

  Future<void> moveToChat(RoomChatResult result) async {
    Get.toNamed(
      AppRouter.routerChatExpert,
      arguments: {
        'chatId': result.chat_id,
        'expertId': result.expert_id,
        'userId': result.user_id,
      },
    );
  }

  @override
  void onLoadMore() {
    // Nếu cần load thêm dữ liệu, hãy tăng page và gọi lại API
    // param.page += 1;
    _initData();
  }

  @override
  Future<void> onRefresh() async {
    // Reset lại page về 1 và gọi lại API
    // param.page = 1;
    await _initData();
    refreshController.refreshCompleted();
  }
}
