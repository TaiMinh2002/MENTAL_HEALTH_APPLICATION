// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_expert_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatExpertInfoImpl _$$ChatExpertInfoImplFromJson(Map<String, dynamic> json) =>
    _$ChatExpertInfoImpl(
      id: (json['id'] as num?)?.toInt(),
      chat_id: (json['chat_id'] as num?)?.toInt(),
      sender_id: (json['sender_id'] as num?)?.toInt(),
      receiver_id: (json['receiver_id'] as num?)?.toInt(),
      message: json['message'] as String?,
      sender: json['sender'] as String?,
      receiver: json['receiver'] as String?,
      created_at: json['created_at'] as String?,
      latest_message: json['latest_message'] as String?,
    );

Map<String, dynamic> _$$ChatExpertInfoImplToJson(
        _$ChatExpertInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chat_id': instance.chat_id,
      'sender_id': instance.sender_id,
      'receiver_id': instance.receiver_id,
      'message': instance.message,
      'sender': instance.sender,
      'receiver': instance.receiver,
      'created_at': instance.created_at,
      'latest_message': instance.latest_message,
    };
