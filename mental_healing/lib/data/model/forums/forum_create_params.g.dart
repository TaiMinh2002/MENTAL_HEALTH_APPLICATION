// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_create_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForumCreateParamsImpl _$$ForumCreateParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$ForumCreateParamsImpl(
      title: json['title'] as String?,
      description: json['description'] as String?,
      cover_image: json['cover_image'],
    );

Map<String, dynamic> _$$ForumCreateParamsImplToJson(
        _$ForumCreateParamsImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'cover_image': instance.cover_image,
    };
