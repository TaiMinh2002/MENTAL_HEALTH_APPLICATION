// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      id: (json['id'] as num?)?.toInt(),
      expert_id: (json['expert_id'] as num?)?.toInt(),
      avatar: json['avatar'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone_number: json['phone_number'] as String?,
      status: (json['status'] as num?)?.toInt(),
      is_professional_request:
          (json['is_professional_request'] as num?)?.toInt(),
      gender: (json['gender'] as num?)?.toInt(),
      age: (json['age'] as num?)?.toInt(),
      mood: (json['mood'] as num?)?.toInt(),
      sleep: (json['sleep'] as num?)?.toInt(),
      stress: (json['stress'] as num?)?.toInt(),
      role: (json['role'] as num?)?.toInt(),
      email_verified_at: json['email_verified_at'] as String?,
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'expert_id': instance.expert_id,
      'avatar': instance.avatar,
      'username': instance.username,
      'email': instance.email,
      'phone_number': instance.phone_number,
      'status': instance.status,
      'is_professional_request': instance.is_professional_request,
      'gender': instance.gender,
      'age': instance.age,
      'mood': instance.mood,
      'sleep': instance.sleep,
      'stress': instance.stress,
      'role': instance.role,
      'email_verified_at': instance.email_verified_at,
    };
