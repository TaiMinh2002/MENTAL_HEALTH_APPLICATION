// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MoodInfoImpl _$$MoodInfoImplFromJson(Map<String, dynamic> json) =>
    _$MoodInfoImpl(
      id: (json['id'] as num?)?.toInt(),
      user_id: (json['user_id'] as num?)?.toInt(),
      username: json['username'] as String?,
      note: json['note'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$$MoodInfoImplToJson(_$MoodInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'username': instance.username,
      'note': instance.note,
      'date': instance.date,
    };
