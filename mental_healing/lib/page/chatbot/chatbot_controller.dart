import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_controller.dart';
import 'package:mental_healing/data/model/chatbot_info.dart';
import 'package:mental_healing/data/use_case/chatbot_use_case.dart';
import 'package:mental_healing/import.dart';

class ChatbotController extends BaseController
    with SmartLoadListController<Widget> {
  final TextEditingController messageController = TextEditingController();
  final ChatbotUseCase _useCase = ChatbotUseCase();

  RxList<ChatbotInfo> listConversions = <ChatbotInfo>[].obs;

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
    await _useCase.getListConversions(
      onSuccess: (data) {
        listConversions.value = data;
      },
      onFailure: (err) {
        error.value = err.message as ApiError?;
      },
    ).whenComplete(() => isLoadingPage.value = false);
  }

  Future<void> sendMessage(String userMessage) async {
    final userMessage = messageController.text.trim();
    if (userMessage.isEmpty) return;
    final userMessageInfo = ChatbotInfo(
      user_message: userMessage,
      bot_reply: null,
    );
    listConversions.add(userMessageInfo);
    messageController.clear();

    try {
      await _useCase.sendMessage(
        message: userMessage,
        onSuccess: (data) {
          listConversions.add(data);
          onRefresh();
        },
        onFailure: (err) {
          error.value = err.toString() as ApiError?;
        },
      );
    } catch (err) {
      error.value = err.toString() as ApiError?;
    }
  }

  @override
  void onLoadMore() {}

  @override
  Future<void> onRefresh() async {
    await _getListConversions();
    refreshController.refreshCompleted();
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}
