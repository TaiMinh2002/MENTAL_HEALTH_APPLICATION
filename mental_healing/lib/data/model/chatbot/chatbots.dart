// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mental_healing/data/model/chatbot/chatbot_info.dart';

part 'chatbots.freezed.dart';
part 'chatbots.g.dart';

@freezed
class Chatbots with _$Chatbots {
  const factory Chatbots(
      {List<ChatbotInfo>? data,
      int? total,
      int? per_page,
      int? current_page,
      int? last_page,
      bool? has_more_pages}) = _Chatbots;
  factory Chatbots.fromJson(Map<String, dynamic> json) =>
      _$ChatbotsFromJson(json);
}
