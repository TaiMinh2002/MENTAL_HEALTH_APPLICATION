// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mental_healing/data/model/post/post_info.dart';

part 'forum_detail.freezed.dart';
part 'forum_detail.g.dart';

@freezed
class ForumDetail with _$ForumDetail {
  factory ForumDetail({
    int? id,
    String? title,
    String? description,
    String? cover_image,
    int? created_user_id,
    String? created_user_name,
    int? member_count,
    int? post_count,
    String? created_at,
    List<PostInfo>? posts,
  }) = _ForumDetail;

  factory ForumDetail.fromJson(Map<String, dynamic> json) =>
      _$ForumDetailFromJson(json);
}
