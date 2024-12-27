// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForumParamsImpl _$$ForumParamsImplFromJson(Map<String, dynamic> json) =>
    _$ForumParamsImpl(
      page: (json['page'] as num?)?.toInt() ?? 1,
      limit: (json['limit'] as num?)?.toInt() ?? 20,
    );

Map<String, dynamic> _$$ForumParamsImplToJson(_$ForumParamsImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
    };
