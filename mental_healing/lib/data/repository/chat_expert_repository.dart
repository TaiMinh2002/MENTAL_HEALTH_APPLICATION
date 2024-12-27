import 'package:mental_healing/data/model/chat_expert_info.dart';
import 'package:mental_healing/data/model/forum_params.dart';
import 'package:mental_healing/data/model/room_chat_result.dart';
import 'package:mental_healing/data/model/send_message_expert_params.dart';

abstract class ChatExpertRepository {
  Future<List<ChatExpertInfo>> getListMessage({required int chatId});
  Future<ChatExpertInfo> sendMessage({required SendMessageExpertParams params});
  Future<List<RoomChatResult>> getListChats({required ForumParams param});
}
