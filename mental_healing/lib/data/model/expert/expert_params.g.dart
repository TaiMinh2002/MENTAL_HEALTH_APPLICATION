// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expert_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpertParamsImpl _$$ExpertParamsImplFromJson(Map<String, dynamic> json) =>
    _$ExpertParamsImpl(
      page: (json['page'] as num?)?.toInt() ?? 1,
      limit: (json['limit'] as num?)?.toInt() ?? 10,
      specialization: (json['specialization'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ExpertParamsImplToJson(_$ExpertParamsImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'specialization': instance.specialization,
    };
