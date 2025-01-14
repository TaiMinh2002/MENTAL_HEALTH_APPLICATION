// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForumInfoImpl _$$ForumInfoImplFromJson(Map<String, dynamic> json) =>
    _$ForumInfoImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      cover_image: json['cover_image'] as String?,
      member_count: (json['member_count'] as num?)?.toInt(),
      post_count: (json['post_count'] as num?)?.toInt(),
      created_user_id: (json['created_user_id'] as num?)?.toInt(),
      created_user_name: json['created_user_name'] as String?,
      is_joined: (json['is_joined'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ForumInfoImplToJson(_$ForumInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'cover_image': instance.cover_image,
      'member_count': instance.member_count,
      'post_count': instance.post_count,
      'created_user_id': instance.created_user_id,
      'created_user_name': instance.created_user_name,
      'is_joined': instance.is_joined,
    };
