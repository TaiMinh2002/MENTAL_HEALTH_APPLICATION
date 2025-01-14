import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/data/model/forums/forum_params.dart';
import 'package:mental_healing/data/model/mood/mood_entries.dart';
import 'package:mental_healing/data/model/mood/mood_info.dart';
import 'package:mental_healing/data/repository/mood_repository.dart';
import 'package:mental_healing/data/repository_impl/mood_repository_imp.dart';

class MoodUseCase {
  final MoodRepository _repository = MoodRepositoryImpl();

  Future<void> setMood({
    required String note,
    required Function(MoodInfo data) onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      final data = await _repository.setMood(note);
      onSuccess(data);
    } catch (exception) {
      if (exception is ApiError) {
        onFailure(exception);
      } else {
        onFailure(ApiError(message: exception.toString()));
      }
    }
  }

  Future<void> getListMoods({
    required ForumParams params,
    required Function(MoodEntries data) onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      final data = await _repository.getListMoods(param: params);
      onSuccess(data);
    } catch (exception) {
      onFailure(ApiError(message: exception.toString()));
    }
  }
}
