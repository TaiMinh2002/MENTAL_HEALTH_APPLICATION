import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_controller.dart';
import 'package:mental_healing/data/model/chatbot/chatbot_info.dart';
import 'package:mental_healing/data/model/forums/forum_params.dart';
import 'package:mental_healing/data/use_case/chatbot_use_case.dart';
import 'package:mental_healing/import.dart';

class ChatbotController extends BaseController
    with SmartLoadListController<ChatbotInfo> {
  final TextEditingController messageController = TextEditingController();
  final ChatbotUseCase _useCase = ChatbotUseCase();
  ForumParams _params = const ForumParams();
  RxBool hasMorePage = false.obs;

  @override
  void onInit() {
    _initData();
    super.onInit();
  }

  Future<void> _initData() async {
    isLoadingPage.value = true;
    _getListConversions();
  }

  Future<void> _getListConversions() async {
    await _useCase
        .getListConversions(
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

  Future<void> sendMessage(String userMessage) async {
    final userMessage = messageController.text.trim();
    if (userMessage.isEmpty) return;
    final userMessageInfo = ChatbotInfo(
      user_message: userMessage,
      bot_reply: null,
    );

    await _useCase.sendMessage(
      message: userMessage,
      onSuccess: (data) {
        messageController.clear();
        data = userMessageInfo;
        dataList.add(data);
        onRefresh();
      },
      onFailure: (err) {},
    );
  }

  @override
  void onLoadMore() {
    if (hasMorePage.value) {
      _params = _params.copyWith(page: _params.page + 1);
      _getListConversions().whenComplete(refreshController.loadComplete);
    }
  }

  @override
  Future<void> onRefresh() async {
    _params = _params.copyWith(page: 1);
    await _getListConversions();
    refreshController.refreshCompleted();
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}
