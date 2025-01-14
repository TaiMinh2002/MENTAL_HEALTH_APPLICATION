import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/data/model/chat_expert/chat_expert_info.dart';
import 'package:mental_healing/data/model/chat_expert/get_list_messages.dart';
import 'package:mental_healing/data/model/chat_expert/chat_experts.dart';
import 'package:mental_healing/data/model/chat_expert/chat_message_param.dart';
import 'package:mental_healing/data/model/forums/forum_params.dart';
import 'package:mental_healing/data/model/chat_expert/send_message_expert_params.dart';
import 'package:mental_healing/data/repository/chat_expert_repository.dart';
import 'package:mental_healing/data/repository_impl/chat_expert_repository_impl.dart';

class ChatExpertUseCase {
  final ChatExpertRepository _repository = ChatExpertRepositoryImpl();

  Future<void> getListMessage({
    required ChatMessageParam params,
    required Function(GetListMessages data) onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      final data = await _repository.getListMessage(param: params);
      onSuccess(data);
    } catch (exception) {
      onFailure(ApiError(message: exception.toString()));
    }
  }

  Future<void> sendMessage({
    required SendMessageExpertParams params,
    required Function(ChatExpertInfo data) onSuccess,
    required Function(dynamic err) onFailure,
  }) async {
    try {
      final data = await _repository.sendMessage(params: params);
      onSuccess(data);
    } catch (exception) {
      if (exception is ApiError) {
        onFailure(exception);
      } else {
        onFailure(exception);
      }
    }
  }

  Future<void> getListChats({
    required ForumParams params,
    required Function(ChatExperts data) onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      final data = await _repository.getListChats(param: params);
      onSuccess(data);
    } catch (exception) {
      onFailure(ApiError(message: exception.toString()));
    }
  }
}
