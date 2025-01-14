// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expert_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpertDetailImpl _$$ExpertDetailImplFromJson(Map<String, dynamic> json) =>
    _$ExpertDetailImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      specialization: (json['specialization'] as num?)?.toInt(),
      user_id: (json['user_id'] as num?)?.toInt(),
      bio: json['bio'] as String?,
      contact_info: json['contact_info'] as String?,
      phone_number: json['phone_number'] as String?,
      avatar: json['avatar'] as String?,
      specialization_string: json['specialization_string'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$ExpertDetailImplToJson(_$ExpertDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'specialization': instance.specialization,
      'user_id': instance.user_id,
      'bio': instance.bio,
      'contact_info': instance.contact_info,
      'phone_number': instance.phone_number,
      'avatar': instance.avatar,
      'specialization_string': instance.specialization_string,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
