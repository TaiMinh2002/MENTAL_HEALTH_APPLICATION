import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/data/model/chatbot_info.dart';
import 'package:mental_healing/data/repository/chatbot_repository.dart';
import 'package:mental_healing/data/repository_impl/chatbot_repository_impl.dart';

class ChatbotUseCase {
  final ChatbotRepository _repository = ChatbotRepositoryImpl();

  Future<void> getListConversions({
    required Function(List<ChatbotInfo> data) onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      final data = await _repository.getListConversions();
      onSuccess(data);
    } catch (exception) {
      if (exception is ApiError) {
        onFailure(exception);
      } else {
        onFailure(ApiError(message: exception.toString()));
      }
    }
  }

  Future<void> sendMessage({
    required String message,
    required Function(ChatbotInfo data) onSuccess,
    required Function(Exception err) onFailure,
  }) async {
    try {
      final data = await _repository.sendMessage(message);
      onSuccess(data);
    } catch (exception) {
      onFailure(ApiError(message: exception.toString()) as Exception);
    }
  }
}
