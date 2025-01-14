import 'package:mental_healing/api_manager/rest_client_base.dart';
import 'package:mental_healing/data/model/exercise/exercise_info.dart';
import 'package:mental_healing/data/model/exercise/exercise_params.dart';
import 'package:mental_healing/data/model/exercise/exercises.dart';
import 'package:mental_healing/data/repository/exercise_repository.dart';
import 'package:mental_healing/global/app_url.dart';

class ExerciseRepositoryImpl extends ExerciseRepository {
  final RestClientBase _client = RestClientBase();

  @override
  Future<Exercises> getListExercises({required ExerciseParams param}) async {
    final response = await _client.get(
      AppUrl.listExercises,
      queryParameters: param.toJson(),
    );
    return Exercises.fromJson(response['exercises']);
  }

  @override
  Future<ExerciseInfo> getExerciseDetail({required int id}) async {
    final response = await _client.get('${AppUrl.listExercises}/$id/detail');
    return ExerciseInfo.fromJson(response['exercise']);
  }
}
