import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_controller.dart';
import 'package:mental_healing/controller/global_data_manager.dart';
import 'package:mental_healing/data/model/chat_expert_info.dart';
import 'package:mental_healing/data/model/send_message_expert_params.dart';
import 'package:mental_healing/data/use_case/chat_expert_use_case.dart';
import 'package:mental_healing/import.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatExpertController extends BaseController
    with SmartLoadListController<Widget> {
  final TextEditingController messageController = TextEditingController();
  final ChatExpertUseCase _useCase = ChatExpertUseCase();
  late int chatId;
  late int expertId;
  late int userId;
  IO.Socket? socket;

  RxList<ChatExpertInfo> listConversions = <ChatExpertInfo>[].obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments as Map<String, dynamic>;
    chatId = arguments['chatId'];
    expertId = arguments['expertId'];
    userId = arguments['userId'];

    _initSocket();
    _initData();
  }

  void _initSocket() {
    // Kết nối tới server Socket.IO
    socket = IO.io(
      'http://192.168.0.102:3000', // Thay URL thành địa chỉ server của bạn
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build(),
    );

    socket?.connect();

    // Khi socket kết nối thành công
    socket?.onConnect((_) {
      print('Connected to socket server');
      socket?.emit('joinConversation', {'chatId': chatId});
    });

    // Khi nhận tin nhắn mới từ server
    socket?.on('newMessage', (data) {
      final newMessage = ChatExpertInfo.fromJson(data);
      listConversions.add(newMessage);
    });

    // Khi socket ngắt kết nối
    socket?.onDisconnect((_) {
      print('Disconnected from socket server');
    });
  }

  Future<void> _initData() async {
    isLoadingPage.value = true;
    _getListMessage();
  }

  Future<void> _getListMessage() async {
    try {
      await _useCase.getListMessage(
        chatId: chatId,
        onSuccess: (data) {
          listConversions.value = data;
        },
        onFailure: (err) {
          print("Error fetching messages: ${err.message}");
          listConversions.clear();
        },
      );
    } catch (e) {
      print("Unexpected error: $e");
      listConversions.clear();
    }
  }

  Future<void> sendMessage(String userMessage) async {
    if (userMessage.isEmpty) return;

    // Xóa nội dung của TextField ngay lập tức
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
      'message': userMessage,
    };

    socket?.emit('sendMessage', socketMessage);

    // Gửi tin nhắn qua API
    await _useCase.sendMessage(
      params: params,
      onSuccess: (data) {
        print("Message saved to DB: ${data.message}");
        _getListMessage();
        listConversions.add(data);
      },
      onFailure: (err) {
        if (err is ApiError) {
          print("Failed to save message to DB: ${err.message}");
        } else {
          print("Unexpected error: $err");
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
