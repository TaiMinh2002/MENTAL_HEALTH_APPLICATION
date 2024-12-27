import 'package:freezed_annotation/freezed_annotation.dart';

part 'forum_create_params.freezed.dart';
part 'forum_create_params.g.dart';

@freezed
class ForumCreateParams with _$ForumCreateParams {
  factory ForumCreateParams({
    String? title,
    String? description,
    dynamic cover_image,
  }) = _ForumCreateParams;

  factory ForumCreateParams.fromJson(Map<String, dynamic> json) =>
      _$ForumCreateParamsFromJson(json);
}
