// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_chat_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomChatResultImpl _$$RoomChatResultImplFromJson(Map<String, dynamic> json) =>
    _$RoomChatResultImpl(
      chat_id: (json['chat_id'] as num?)?.toInt(),
      user_name: json['user_name'] as String?,
      expert_name: json['expert_name'] as String?,
      user_avatar: json['user_avatar'] as String?,
      expert_avatar: json['expert_avatar'] as String?,
      user_id: (json['user_id'] as num?)?.toInt(),
      expert_id: (json['expert_id'] as num?)?.toInt(),
      latest_message: json['latest_message'] as String?,
      created_at: json['created_at'] as String?,
    );

Map<String, dynamic> _$$RoomChatResultImplToJson(
        _$RoomChatResultImpl instance) =>
    <String, dynamic>{
      'chat_id': instance.chat_id,
      'user_name': instance.user_name,
      'expert_name': instance.expert_name,
      'user_avatar': instance.user_avatar,
      'expert_avatar': instance.expert_avatar,
      'user_id': instance.user_id,
      'expert_id': instance.expert_id,
      'latest_message': instance.latest_message,
      'created_at': instance.created_at,
    };
