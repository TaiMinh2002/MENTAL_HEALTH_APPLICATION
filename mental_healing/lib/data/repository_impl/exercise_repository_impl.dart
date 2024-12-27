import 'package:mental_healing/api_manager/rest_client_base.dart';
import 'package:mental_healing/data/model/exercise_info.dart';
import 'package:mental_healing/data/model/exercise_params.dart';
import 'package:mental_healing/data/repository/exercise_repository.dart';
import 'package:mental_healing/global/app_url.dart';

class ExerciseRepositoryImpl extends ExerciseRepository {
  final RestClientBase _client = RestClientBase();

  @override
  @override
  Future<List<ExerciseInfo>> getListExercises({
    required ExerciseParams param,
  }) async {
    final response = await _client.get(
      AppUrl.listExercises,
      queryParameters: param.toParamsJson(),
    );
    final List<dynamic> data = response['exercises'];
    return data.map((json) => ExerciseInfo.fromJson(json)).toList();
  }

  @override
  Future<ExerciseInfo> getExerciseDetail({required int id}) async {
    final response = await _client.get('${AppUrl.listExercises}/$id/detail');
    return ExerciseInfo.fromJson(response);
  }
}
