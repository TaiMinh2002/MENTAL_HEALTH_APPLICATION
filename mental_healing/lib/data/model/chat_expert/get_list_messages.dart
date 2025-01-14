// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mental_healing/data/model/chat_expert/chat_expert_info.dart';

part 'get_list_messages.freezed.dart';
part 'get_list_messages.g.dart';

@freezed
class GetListMessages with _$GetListMessages {
  const factory GetListMessages(
      {List<ChatExpertInfo>? data,
      int? total,
      int? per_page,
      int? current_page,
      int? last_page,
      bool? has_more_pages}) = _GetListMessages;
  factory GetListMessages.fromJson(Map<String, dynamic> json) =>
      _$GetListMessagesFromJson(json);
}
