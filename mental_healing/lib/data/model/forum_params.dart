import 'package:freezed_annotation/freezed_annotation.dart';

part 'forum_params.freezed.dart';
part 'forum_params.g.dart';

@freezed
abstract class ForumParams implements _$ForumParams {
  factory ForumParams({
    @Default(1) int page,
    @Default(20) int limit,
  }) = _ForumParams;
  const ForumParams._();
  factory ForumParams.fromJson(Map<String, dynamic> json) =>
      _$ForumParamsFromJson(json);

  Map<String, dynamic> toParamsJson() => <String, dynamic>{
        'page': page,
        'limit': limit,
      };
}
