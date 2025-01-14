// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'expert_detail.freezed.dart';
part 'expert_detail.g.dart';

@freezed
class ExpertDetail with _$ExpertDetail {
  factory ExpertDetail({
    int? id,
    String? name,
    int? specialization,
    int? user_id,
    String? bio,
    String? contact_info,
    String? phone_number,
    String? avatar,
    String? specialization_string,
    String? created_at,
    String? updated_at,
  }) = _ExpertDetail;

  factory ExpertDetail.fromJson(Map<String, dynamic> json) =>
      _$ExpertDetailFromJson(json);
}
