import 'package:mental_healing/data/model/exercise_info.dart';
import 'package:mental_healing/data/model/exercise_params.dart';

abstract class ExerciseRepository {
  Future<List<ExerciseInfo>> getListExercises({required ExerciseParams param});
  Future<ExerciseInfo> getExerciseDetail({required int id});
}
