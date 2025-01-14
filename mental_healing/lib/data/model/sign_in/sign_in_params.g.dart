// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignInParamsImpl _$$SignInParamsImplFromJson(Map<String, dynamic> json) =>
    _$SignInParamsImpl(
      identifier: json['identifier'] as String?,
      password: json['password'] as String?,
      role: (json['role'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SignInParamsImplToJson(_$SignInParamsImpl instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'password': instance.password,
      'role': instance.role,
    };
