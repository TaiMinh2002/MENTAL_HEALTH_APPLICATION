import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/data/model/chat_expert_info.dart';
import 'package:mental_healing/data/model/forum_params.dart';
import 'package:mental_healing/data/model/room_chat_result.dart';
import 'package:mental_healing/data/model/send_message_expert_params.dart';
import 'package:mental_healing/data/repository/chat_expert_repository.dart';
import 'package:mental_healing/data/repository_impl/chat_expert_repository_impl.dart';

class ChatExpertUseCase {
  final ChatExpertRepository _repository = ChatExpertRepositoryImpl();

  Future<void> getListMessage({
    required int chatId,
    required Function(List<ChatExpertInfo> data) onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      final data = await _repository.getListMessage(chatId: chatId);
      onSuccess(data); // Thành công, trả về dữ liệu
    } catch (exception) {
      if (exception is ApiError) {
        onFailure(exception); // Nếu lỗi là ApiError
      } else {
        onFailure(ApiError(message: exception.toString())); // Các lỗi khác
      }
    }
  }

  Future<void> sendMessage({
    required SendMessageExpertParams params,
    required Function(ChatExpertInfo data) onSuccess,
    required Function(dynamic err) onFailure, // Đổi kiểu err thành dynamic
  }) async {
    try {
      final data = await _repository.sendMessage(params: params);
      onSuccess(data);
    } catch (exception) {
      if (exception is ApiError) {
        onFailure(exception);
      } else {
        onFailure(exception); // Truyền bất kỳ lỗi nào khác
      }
    }
  }

  Future<void> getListChats({
    required ForumParams params,
    required Function(List<RoomChatResult> data) onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      final data = await _repository.getListChats(param: params);
      onSuccess(data);
    } catch (e) {
      onFailure(ApiError(message: e.toString()));
    }
  }
}
