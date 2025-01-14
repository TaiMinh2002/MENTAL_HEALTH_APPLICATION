// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageParamImpl _$$ChatMessageParamImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatMessageParamImpl(
      page: (json['page'] as num?)?.toInt() ?? 1,
      limit: (json['limit'] as num?)?.toInt() ?? 10,
      chatId: (json['chatId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ChatMessageParamImplToJson(
        _$ChatMessageParamImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'chatId': instance.chatId,
    };
