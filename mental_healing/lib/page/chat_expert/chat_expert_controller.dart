// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:mental_healing/base_widget/snack_bar_helper.dart';
// import 'package:mental_healing/import.dart';
// import 'package:mental_healing/model/expert_model.dart';
// import 'package:mental_healing/model/message_model.dart';
// import 'package:mental_healing/utils/cache_manager.dart';
// import 'package:mental_healing/utils/config.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// class ChatExpertController extends GetxController {
//   final Rx<ExpertModel?> expert = Rx<ExpertModel?>(null);
//   final RxInt conversationId = 0.obs;
//   final RxList<MessageModel> messages = <MessageModel>[].obs;
//   final TextEditingController messageController = TextEditingController();
//   late IO.Socket socket;
//   final isLoading = true.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     handleCreateChat();
//   }

//   Future<void> handleCreateChat() async {
//     final String? token = CacheManager.getStoredToken();

//     if (token == null || token.isEmpty) {
//       SnackBarHelper.showError(LocaleKeys.token_missing.tr);
//       return;
//     }

//     final int expertId =
//         expert.value?.id ?? 0; // Thay bằng ID thực tế của chuyên gia
//     const String url = '${Config.apiUrl}/users/conversations/create';

//     try {
//       final response = await http.post(
//         Uri.parse(url),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//         body: jsonEncode({"user2_id": expertId}),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         conversationId.value = data['conversationId'];
//         connectSocket();
//       } else {
//         final errorResponse = jsonDecode(response.body);
//         SnackBarHelper.showError(errorResponse['error']);
//       }
//     } catch (e) {
//       SnackBarHelper.showError(e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   void connectSocket() {
//     socket = IO.io(Config.socketUrl, <String, dynamic>{
//       'transports': ['websocket'],
//       'autoConnect': false,
//     });

//     socket.connect();

//     socket.on('connect', (_) {
//       print('Connected to socket');
//       socket.emit('joinConversation', conversationId.value);
//     });

//     socket.on('newMessage', (data) {
//       messages.add(MessageModel.fromJson(data));
//     });

//     socket.on('disconnect', (_) => print('Disconnected from socket'));
//   }

//   void sendMessage(String text) {
//     if (text.isEmpty) return;

//     final message = {
//       "conversation_id": conversationId.value,
//       "sender_id": CacheManager.getUserId(), // Giả sử có hàm lấy userId
//       "message": text,
//     };

//     socket.emit('sendMessage', message);
//     messages.add(MessageModel(
//       senderId: CacheManager.getUserId(),
//       message: text,
//       isMine: true,
//     ));
//     messageController.clear();
//   }

//   @override
//   void onClose() {
//     socket.disconnect();
//     messageController.dispose();
//     super.onClose();
//   }
// }
