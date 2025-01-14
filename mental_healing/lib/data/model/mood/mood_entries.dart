// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mental_healing/data/model/mood/mood_info.dart';

part 'mood_entries.freezed.dart';
part 'mood_entries.g.dart';

@freezed
class MoodEntries with _$MoodEntries {
  const factory MoodEntries(
      {List<MoodInfo>? data,
      int? total,
      int? per_page,
      int? current_page,
      int? last_page,
      bool? has_more_pages}) = _MoodEntries;
  factory MoodEntries.fromJson(Map<String, dynamic> json) =>
      _$MoodEntriesFromJson(json);
}
