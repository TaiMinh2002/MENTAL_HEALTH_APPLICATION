// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForumParamsImpl _$$ForumParamsImplFromJson(Map<String, dynamic> json) =>
    _$ForumParamsImpl(
      page: (json['page'] as num?)?.toInt() ?? 1,
      limit: (json['limit'] as num?)?.toInt() ?? 10,
      is_joined: json['is_joined'] as bool?,
    );

Map<String, dynamic> _$$ForumParamsImplToJson(_$ForumParamsImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'is_joined': instance.is_joined,
    };
