// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserUpdateParamsImpl _$$UserUpdateParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$UserUpdateParamsImpl(
      id: (json['id'] as num?)?.toInt(),
      username: json['username'] as String?,
      password: json['password'] as String?,
      avatar: json['avatar'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      age: (json['age'] as num?)?.toInt(),
      mood: (json['mood'] as num?)?.toInt(),
      sleep: (json['sleep'] as num?)?.toInt(),
      stress: (json['stress'] as num?)?.toInt(),
      is_professional_request:
          (json['is_professional_request'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserUpdateParamsImplToJson(
        _$UserUpdateParamsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'password': instance.password,
      'avatar': instance.avatar,
      'gender': instance.gender,
      'age': instance.age,
      'mood': instance.mood,
      'sleep': instance.sleep,
      'stress': instance.stress,
      'is_professional_request': instance.is_professional_request,
    };
