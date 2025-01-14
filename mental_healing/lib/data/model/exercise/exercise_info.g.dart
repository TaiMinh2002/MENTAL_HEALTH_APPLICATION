// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseInfoImpl _$$ExerciseInfoImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseInfoImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      type: (json['type'] as num?)?.toInt(),
      content: json['content'] as String?,
      media_url: json['media_url'] as String?,
      thumbnail_url: json['thumbnail_url'] as String?,
      type_string: json['type_string'] as String?,
    );

Map<String, dynamic> _$$ExerciseInfoImplToJson(_$ExerciseInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'content': instance.content,
      'media_url': instance.media_url,
      'thumbnail_url': instance.thumbnail_url,
      'type_string': instance.type_string,
    };
