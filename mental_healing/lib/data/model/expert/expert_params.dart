import 'package:freezed_annotation/freezed_annotation.dart';

part 'expert_params.freezed.dart';
part 'expert_params.g.dart';

@freezed
abstract class ExpertParams implements _$ExpertParams {
  factory ExpertParams({
    @Default(1) int page,
    @Default(10) int limit,
    int? specialization,
  }) = _ExpertParams;
  const ExpertParams._();
  factory ExpertParams.fromJson(Map<String, dynamic> json) =>
      _$ExpertParamsFromJson(json);

  Map<String, dynamic> toParamsJson() => <String, dynamic>{
        'page': page,
        'limit': limit,
        'specialization': specialization,
      };
}
