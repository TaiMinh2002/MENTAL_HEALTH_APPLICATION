// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mental_healing/data/model/expert/expert_info.dart';

part 'experts.freezed.dart';
part 'experts.g.dart';

@freezed
class Experts with _$Experts {
  const factory Experts(
      {List<ExpertInfo>? data,
      int? total,
      int? per_page,
      int? current_page,
      int? last_page,
      bool? has_more_pages}) = _Experts;
  factory Experts.fromJson(Map<String, dynamic> json) =>
      _$ExpertsFromJson(json);
}
