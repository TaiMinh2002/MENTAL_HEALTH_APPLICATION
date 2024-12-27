import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/data/model/forum_params.dart';
import 'package:mental_healing/data/model/mood_info.dart';
import 'package:mental_healing/data/repository/mood_repository.dart';
import 'package:mental_healing/data/repository_impl/mood_repository_imp.dart';

class MoodUseCase {
  final MoodRepository _repository = MoodRepositoryImpl();

  Future<void> setMood({
    required String message,
    required Function(MoodInfo data) onSuccess,
    required Function(Exception err) onFailure,
  }) async {
    try {
      final data = await _repository.setMood(message);
      onSuccess(data);
    } catch (exception) {
      onFailure(ApiError(message: exception.toString()) as Exception);
    }
  }

  Future<void> getListMoods({
    required ForumParams params,
    required Function(List<MoodInfo> data) onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      final data = await _repository.getListMoods(param: params);
      onSuccess(data);
    } catch (e) {
      onFailure(ApiError(message: e.toString()));
    }
  }
}
