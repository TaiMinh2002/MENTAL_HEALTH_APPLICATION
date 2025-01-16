import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/common/helpers/snack_bar_helper.dart';
import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_controller.dart';
import 'package:mental_healing/controller/global_data_manager.dart';
import 'package:mental_healing/data/model/chat_expert/chat_expert_info.dart';
import 'package:mental_healing/data/model/chat_expert/chat_message_param.dart';
import 'package:mental_healing/data/model/chat_expert/send_message_expert_params.dart';
import 'package:mental_healing/data/use_case/chat_expert_use_case.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/message/message_controller.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatExpertController extends BaseController
    with SmartLoadListController<ChatExpertInfo> {
  final TextEditingController messageController = TextEditingController();
  final ChatExpertUseCase _useCase = ChatExpertUseCase();
  late int chatId;
  late int expertId;
  late int userId;
  IO.Socket? socket;
  RxBool hasMorePage = false.obs;
  late ChatMessageParam param;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments as Map<String, dynamic>;
    chatId = arguments['chatId'];
    expertId = arguments['expertId'];
    userId = arguments['userId'];
    param = ChatMessageParam(page: 1, limit: 20, chatId: chatId);
    _initSocket();
    _initData();
  }

  void _initSocket() {
    socket = IO.io(
      'http://192.168.1.91:6868',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build(),
    );

    socket?.connect();

    socket?.onConnect((_) {
      print('Connected to socket server');
      socket?.emit('joinConversation', {'chatId': chatId});
    });

    socket?.on('newMessage', (data) {
      final newMessage = ChatExpertInfo.fromJson(data);
      dataList.add(newMessage);
    });

    socket?.onDisconnect((_) {
      print('Disconnected from socket server');
    });
  }

  Future<void> _initData() async {
    isLoadingPage.value = true;
    _getListMessage();
  }

  Future<void> _getListMessage() async {
    await _useCase
        .getListMessage(
            params: param,
            onSuccess: (data) {
              if (param.page == 1) {
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
    if (userMessage.isEmpty) return;

    messageController.clear();

    final params = SendMessageExpertParams(
      chatId: chatId,
      message: userMessage,
      receiverId:
          GlobalDataManager().userInfo.value.role == 2 ? expertId : userId,
    );

    final socketMessage = {
      'chat_id': chatId,
      'receiver_id': params.receiverId,
      'sender_id': GlobalDataManager().userInfo.value.id,
      'message': userMessage,
    };

    socket?.emit('sendMessage', socketMessage);

    await _useCase.sendMessage(
      params: params,
      onSuccess: (data) {
        _getListMessage();
        dataList.add(data);
        Get.find<MessageController>().onRefresh();
      },
      onFailure: (err) {
        if (err is ApiError) {
          SnackBarHelper.showError(err.message);
        } else {
          SnackBarHelper.showError(err);
        }
      },
    );
  }

  @override
  void onLoadMore() {}

  @override
  Future<void> onRefresh() async {
    _getListMessage();
    refreshController.refreshCompleted();
  }

  @override
  void onClose() {
    socket?.dispose();
    messageController.dispose();
    super.onClose();
  }
}
