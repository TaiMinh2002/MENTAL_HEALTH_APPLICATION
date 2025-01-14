// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expert_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpertInfoImpl _$$ExpertInfoImplFromJson(Map<String, dynamic> json) =>
    _$ExpertInfoImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      specialization: (json['specialization'] as num?)?.toInt(),
      bio: json['bio'] as String?,
      contact_info: json['contact_info'] as String?,
      phone_number: json['phone_number'] as String?,
      avatar: json['avatar'] as String?,
      specialization_string: json['specialization_string'] as String?,
    );

Map<String, dynamic> _$$ExpertInfoImplToJson(_$ExpertInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'specialization': instance.specialization,
      'bio': instance.bio,
      'contact_info': instance.contact_info,
      'phone_number': instance.phone_number,
      'avatar': instance.avatar,
      'specialization_string': instance.specialization_string,
    };
