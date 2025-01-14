// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mental_healing/data/model/exercise/exercise_info.dart';

part 'exercises.freezed.dart';
part 'exercises.g.dart';

@freezed
class Exercises with _$Exercises {
  const factory Exercises(
      {List<ExerciseInfo>? data,
      int? total,
      int? per_page,
      int? current_page,
      int? last_page,
      bool? has_more_pages}) = _Exercises;
  factory Exercises.fromJson(Map<String, dynamic> json) =>
      _$ExercisesFromJson(json);
}
