import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/data/model/chatbot_info.dart';
import 'package:mental_healing/data/repository/chatbot_repository.dart';
import 'package:mental_healing/api_manager/rest_client_base.dart';
import 'package:mental_healing/global/app_url.dart';

class ChatbotRepositoryImpl extends ChatbotRepository {
  final RestClientBase _client = RestClientBase();

  @override
  Future<List<ChatbotInfo>> getListConversions() async {
    final response = await _client.get(AppUrl.getConversations);

    // Xử lý danh sách từ response
    if (response is List) {
      return response.map((item) => ChatbotInfo.fromJson(item)).toList();
    } else {
      throw ApiError(message: 'Unexpected response format');
    }
  }

  @override
  Future<ChatbotInfo> sendMessage(String message) async {
    final response = await _client.post(
      AppUrl.sendMessageChatbot,
      data: {"message": message},
    );

    return ChatbotInfo.fromJson(response);
  }
}
