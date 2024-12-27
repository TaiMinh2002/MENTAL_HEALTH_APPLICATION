import 'package:mental_healing/data/model/chatbot_info.dart';

abstract class ChatbotRepository {
  Future<List<ChatbotInfo>> getListConversions();
  Future<ChatbotInfo> sendMessage(String message);
}
