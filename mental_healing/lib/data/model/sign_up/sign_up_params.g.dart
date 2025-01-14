// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpParamsImpl _$$SignUpParamsImplFromJson(Map<String, dynamic> json) =>
    _$SignUpParamsImpl(
      identifier: json['identifier'] as String?,
      password: json['password'] as String?,
      confirm_password: json['confirm_password'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$$SignUpParamsImplToJson(_$SignUpParamsImpl instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'password': instance.password,
      'confirm_password': instance.confirm_password,
      'username': instance.username,
    };
