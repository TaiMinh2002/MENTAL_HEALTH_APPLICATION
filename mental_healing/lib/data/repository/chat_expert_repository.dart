import 'package:mental_healing/data/model/chat_expert/chat_expert_info.dart';
import 'package:mental_healing/data/model/chat_expert/get_list_messages.dart';
import 'package:mental_healing/data/model/chat_expert/chat_experts.dart';
import 'package:mental_healing/data/model/chat_expert/chat_message_param.dart';
import 'package:mental_healing/data/model/forums/forum_params.dart';
import 'package:mental_healing/data/model/chat_expert/send_message_expert_params.dart';

abstract class ChatExpertRepository {
  Future<GetListMessages> getListMessage({required ChatMessageParam param});
  Future<ChatExpertInfo> sendMessage({required SendMessageExpertParams params});
  Future<ChatExperts> getListChats({required ForumParams param});
}
