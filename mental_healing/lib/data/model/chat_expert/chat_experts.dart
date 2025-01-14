// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mental_healing/data/model/chat_expert/room_chat_result.dart';

part 'chat_experts.freezed.dart';
part 'chat_experts.g.dart';

@freezed
class ChatExperts with _$ChatExperts {
  const factory ChatExperts(
      {List<RoomChatResult>? data,
      int? total,
      int? per_page,
      int? current_page,
      int? last_page,
      bool? has_more_pages}) = _ChatExperts;
  factory ChatExperts.fromJson(Map<String, dynamic> json) =>
      _$ChatExpertsFromJson(json);
}
