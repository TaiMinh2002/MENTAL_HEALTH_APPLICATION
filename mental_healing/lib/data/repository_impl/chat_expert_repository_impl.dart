import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/controller/global_data_manager.dart';
import 'package:mental_healing/data/model/chat_expert_info.dart';
import 'package:mental_healing/data/model/forum_params.dart';
import 'package:mental_healing/data/model/room_chat_result.dart';
import 'package:mental_healing/data/model/send_message_expert_params.dart';
import 'package:mental_healing/data/repository/chat_expert_repository.dart';
import 'package:mental_healing/api_manager/rest_client_base.dart';
import 'package:mental_healing/global/app_url.dart';

class ChatExpertRepositoryImpl extends ChatExpertRepository {
  final RestClientBase _client = RestClientBase();

  @override
  Future<List<ChatExpertInfo>> getListMessage({required int chatId}) async {
    final response = await _client
        .get(AppUrl.getMessages, queryParameters: {"chatId": chatId});

    if (response is List) {
      // Chuyển đổi từng object JSON trong danh sách thành ChatExpertInfo
      return response.map((item) => ChatExpertInfo.fromJson(item)).toList();
    } else {
      throw ApiError(
          message:
              'Unexpected response format. Expected a list, got ${response.runtimeType}');
    }
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
  Future<List<RoomChatResult>> getListChats({
    required ForumParams param,
  }) async {
    final response = await _client.get(
      AppUrl.listChats,
      queryParameters: param.toParamsJson(),
    );
    final List<dynamic> data = response;
    return data.map((json) => RoomChatResult.fromJson(json)).toList();
  }
}
