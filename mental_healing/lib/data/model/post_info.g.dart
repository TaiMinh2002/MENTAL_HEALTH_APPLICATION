// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostInfoImpl _$$PostInfoImplFromJson(Map<String, dynamic> json) =>
    _$PostInfoImpl(
      id: (json['id'] as num?)?.toInt(),
      forum_id: (json['forum_id'] as num?)?.toInt(),
      user_id: (json['user_id'] as num?)?.toInt(),
      username: json['username'] as String?,
      like_count: (json['like_count'] as num?)?.toInt(),
      comment_count: (json['comment_count'] as num?)?.toInt(),
      content: json['content'] as String?,
      title: json['title'] as String?,
      created_at: json['created_at'] as String?,
    );

Map<String, dynamic> _$$PostInfoImplToJson(_$PostInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'forum_id': instance.forum_id,
      'user_id': instance.user_id,
      'username': instance.username,
      'like_count': instance.like_count,
      'comment_count': instance.comment_count,
      'content': instance.content,
      'title': instance.title,
      'created_at': instance.created_at,
    };
