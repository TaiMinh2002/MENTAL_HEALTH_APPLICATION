import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_params.freezed.dart';
part 'exercise_params.g.dart';

@freezed
abstract class ExerciseParams implements _$ExerciseParams {
  factory ExerciseParams({
    @Default(1) int page,
    @Default(20) int limit,
    int? type,
  }) = _ExerciseParams;
  const ExerciseParams._();
  factory ExerciseParams.fromJson(Map<String, dynamic> json) =>
      _$ExerciseParamsFromJson(json);

  Map<String, dynamic> toParamsJson() => <String, dynamic>{
        'page': page,
        'limit': limit,
        'type': type,
      };
}
