// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseParamsImpl _$$ExerciseParamsImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseParamsImpl(
      page: (json['page'] as num?)?.toInt() ?? 1,
      limit: (json['limit'] as num?)?.toInt() ?? 10,
      type: (json['type'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ExerciseParamsImplToJson(
        _$ExerciseParamsImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'type': instance.type,
    };
