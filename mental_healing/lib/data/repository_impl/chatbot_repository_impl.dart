import 'package:mental_healing/data/model/chatbot/chatbot_info.dart';
import 'package:mental_healing/data/model/chatbot/chatbots.dart';
import 'package:mental_healing/data/model/forums/forum_params.dart';
import 'package:mental_healing/data/repository/chatbot_repository.dart';
import 'package:mental_healing/api_manager/rest_client_base.dart';
import 'package:mental_healing/global/app_url.dart';

class ChatbotRepositoryImpl extends ChatbotRepository {
  final RestClientBase _client = RestClientBase();

  @override
  Future<Chatbots> getListConversions({required ForumParams param}) async {
    final response = await _client.get(
      AppUrl.getConversations,
      queryParameters: param.toJson(),
    );
    return Chatbots.fromJson(response['conversations']);
  }

  @override
  Future<ChatbotInfo> sendMessage({required String message}) async {
    final response = await _client
        .post(AppUrl.sendMessageChatbot, data: {'message': message});

    return ChatbotInfo.fromJson(response['sendMessage']);
  }
}
