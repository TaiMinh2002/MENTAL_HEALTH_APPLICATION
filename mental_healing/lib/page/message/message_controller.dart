import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_controller.dart';
import 'package:mental_healing/data/model/forums/forum_params.dart';
import 'package:mental_healing/data/model/chat_expert/room_chat_result.dart';
import 'package:mental_healing/data/use_case/chat_expert_use_case.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/import.dart';

class MessageController extends BaseController
    with SmartLoadListController<RoomChatResult> {
  final ChatExpertUseCase _useCase = ChatExpertUseCase();
  ForumParams _params = const ForumParams(limit: 20, page: 1);
  RxBool hasMorePage = false.obs;

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
    if (hasMorePage.value) {
      _params = _params.copyWith(page: _params.page + 1);
      _getListChats().whenComplete(refreshController.loadComplete);
    }
  }

  @override
  Future<void> onRefresh() async {
    _params = _params.copyWith(page: 1);
    await _getListChats();
    refreshController.refreshCompleted();
  }
}
