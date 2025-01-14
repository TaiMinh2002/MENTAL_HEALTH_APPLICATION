import 'package:mental_healing/data/model/exercise/exercise_info.dart';
import 'package:mental_healing/data/model/exercise/exercise_params.dart';
import 'package:mental_healing/data/model/exercise/exercises.dart';

abstract class ExerciseRepository {
  Future<Exercises> getListExercises({required ExerciseParams param});
  Future<ExerciseInfo> getExerciseDetail({required int id});
}
