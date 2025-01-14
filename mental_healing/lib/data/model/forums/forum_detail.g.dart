// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForumDetailImpl _$$ForumDetailImplFromJson(Map<String, dynamic> json) =>
    _$ForumDetailImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      cover_image: json['cover_image'] as String?,
      created_user_id: (json['created_user_id'] as num?)?.toInt(),
      created_user_name: json['created_user_name'] as String?,
      member_count: (json['member_count'] as num?)?.toInt(),
      post_count: (json['post_count'] as num?)?.toInt(),
      created_at: json['created_at'] as String?,
      posts: (json['posts'] as List<dynamic>?)
          ?.map((e) => PostInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ForumDetailImplToJson(_$ForumDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'cover_image': instance.cover_image,
      'created_user_id': instance.created_user_id,
      'created_user_name': instance.created_user_name,
      'member_count': instance.member_count,
      'post_count': instance.post_count,
      'created_at': instance.created_at,
      'posts': instance.posts,
    };
