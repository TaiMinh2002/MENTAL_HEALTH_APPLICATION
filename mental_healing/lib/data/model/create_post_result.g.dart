// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreatePostResultImpl _$$CreatePostResultImplFromJson(
        Map<String, dynamic> json) =>
    _$CreatePostResultImpl(
      message: json['message'] as String?,
      post_id: (json['post_id'] as num?)?.toInt(),
      forum_id: (json['forum_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CreatePostResultImplToJson(
        _$CreatePostResultImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'post_id': instance.post_id,
      'forum_id': instance.forum_id,
    };
