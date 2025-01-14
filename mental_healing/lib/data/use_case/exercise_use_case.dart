import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/data/model/exercise/exercise_info.dart';
import 'package:mental_healing/data/model/exercise/exercise_params.dart';
import 'package:mental_healing/data/model/exercise/exercises.dart';
import 'package:mental_healing/data/repository/exercise_repository.dart';
import 'package:mental_healing/data/repository_impl/exercise_repository_impl.dart';

class ExerciseUseCase {
  final ExerciseRepository _repository = ExerciseRepositoryImpl();

  Future<void> getListExercises({
    required ExerciseParams params,
    required Function(Exercises data) onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      final data = await _repository.getListExercises(param: params);
      onSuccess(data);
    } catch (exception) {
      onFailure(ApiError(message: exception.toString()));
    }
  }

  Future<void> getExerciseDetail({
    required int id,
    required Function(ExerciseInfo data) onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      final data = await _repository.getExerciseDetail(id: id);
      onSuccess(data);
    } catch (exception) {
      onFailure(exception as ApiError);
    }
  }
}
