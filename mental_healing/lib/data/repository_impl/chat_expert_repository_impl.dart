import 'package:mental_healing/controller/global_data_manager.dart';
import 'package:mental_healing/data/model/chat_expert/chat_expert_info.dart';
import 'package:mental_healing/data/model/chat_expert/get_list_messages.dart';
import 'package:mental_healing/data/model/chat_expert/chat_experts.dart';
import 'package:mental_healing/data/model/chat_expert/chat_message_param.dart';
import 'package:mental_healing/data/model/forums/forum_params.dart';
import 'package:mental_healing/data/model/chat_expert/send_message_expert_params.dart';
import 'package:mental_healing/data/repository/chat_expert_repository.dart';
import 'package:mental_healing/api_manager/rest_client_base.dart';
import 'package:mental_healing/global/app_url.dart';

class ChatExpertRepositoryImpl extends ChatExpertRepository {
  final RestClientBase _client = RestClientBase();

  @override
  Future<GetListMessages> getListMessage(
      {required ChatMessageParam param}) async {
    final response = await _client.get(
      AppUrl.getMessages,
      queryParameters: param.toJson(),
    );
    return GetListMessages.fromJson(response['messages']);
  }

  @override
  Future<ChatExpertInfo> sendMessage({
    required SendMessageExpertParams params,
  }) async {
    final response = await _client.post(
      AppUrl.sendMessageExpert,
      queryParameters: {
        'chat_id': params.chatId,
        'receiver_id': params.receiverId,
        'message': params.message,
        'sender_id': GlobalDataManager().userInfo.value.id
      },
    );

    return ChatExpertInfo.fromJson(response);
  }

  @override
  Future<ChatExperts> getListChats({required ForumParams param}) async {
    final response = await _client.get(
      AppUrl.listChats,
      queryParameters: param.toJson(),
    );
    return ChatExperts.fromJson(response['expert_chats']);
  }
}
