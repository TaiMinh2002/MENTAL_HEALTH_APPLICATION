import 'package:freezed_annotation/freezed_annotation.dart';

part 'forum_params.freezed.dart';
part 'forum_params.g.dart';

@freezed
class ForumParams with _$ForumParams {
  const factory ForumParams({
    @Default(1) int page,
    @Default(10) int limit,
    bool? is_joined,
  }) = _ForumParams;
  factory ForumParams.fromJson(Map<String, Object?> json) =>
      _$ForumParamsFromJson(json);
}
