import 'package:mental_healing/data/model/chatbot/chatbot_info.dart';
import 'package:mental_healing/data/model/chatbot/chatbots.dart';
import 'package:mental_healing/data/model/forums/forum_params.dart';

abstract class ChatbotRepository {
  Future<Chatbots> getListConversions({required ForumParams param});
  Future<ChatbotInfo> sendMessage({required String message});
}
