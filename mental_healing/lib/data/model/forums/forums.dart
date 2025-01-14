// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mental_healing/data/model/forums/forum_info.dart';

part 'forums.freezed.dart';
part 'forums.g.dart';

@freezed
class Forums with _$Forums {
  const factory Forums(
      {List<ForumInfo>? data,
      int? total,
      int? per_page,
      int? current_page,
      int? last_page,
      bool? has_more_pages}) = _Forums;
  factory Forums.fromJson(Map<String, dynamic> json) => _$ForumsFromJson(json);
}
