// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forums.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForumsImpl _$$ForumsImplFromJson(Map<String, dynamic> json) => _$ForumsImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ForumInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      per_page: (json['per_page'] as num?)?.toInt(),
      current_page: (json['current_page'] as num?)?.toInt(),
      last_page: (json['last_page'] as num?)?.toInt(),
      has_more_pages: json['has_more_pages'] as bool?,
    );

Map<String, dynamic> _$$ForumsImplToJson(_$ForumsImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
      'per_page': instance.per_page,
      'current_page': instance.current_page,
      'last_page': instance.last_page,
      'has_more_pages': instance.has_more_pages,
    };
