// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_expert_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendMessageExpertParamsImpl _$$SendMessageExpertParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$SendMessageExpertParamsImpl(
      chatId: (json['chatId'] as num?)?.toInt(),
      receiverId: (json['receiverId'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$SendMessageExpertParamsImplToJson(
        _$SendMessageExpertParamsImpl instance) =>
    <String, dynamic>{
      'chatId': instance.chatId,
      'receiverId': instance.receiverId,
      'message': instance.message,
    };
