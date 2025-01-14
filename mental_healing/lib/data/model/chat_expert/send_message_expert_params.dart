import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_message_expert_params.freezed.dart';
part 'send_message_expert_params.g.dart';

@freezed
abstract class SendMessageExpertParams implements _$SendMessageExpertParams {
  factory SendMessageExpertParams({
    int? chatId,
    int? receiverId,
    String? message,
  }) = _SendMessageExpertParams;
  const SendMessageExpertParams._();
  factory SendMessageExpertParams.fromJson(Map<String, dynamic> json) =>
      _$SendMessageExpertParamsFromJson(json);
}
