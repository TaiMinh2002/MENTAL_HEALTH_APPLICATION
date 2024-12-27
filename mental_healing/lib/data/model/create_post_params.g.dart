// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreatePostParamsImpl _$$CreatePostParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$CreatePostParamsImpl(
      title: json['title'] as String?,
      content: json['content'] as String?,
      forum_id: (json['forum_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CreatePostParamsImplToJson(
        _$CreatePostParamsImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'forum_id': instance.forum_id,
    };
