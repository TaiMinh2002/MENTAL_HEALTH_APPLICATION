import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_param.freezed.dart';
part 'chat_message_param.g.dart';

@freezed
abstract class ChatMessageParam implements _$ChatMessageParam {
  factory ChatMessageParam({
    @Default(1) int page,
    @Default(10) int limit,
    int? chatId,
  }) = _ChatMessageParam;
  const ChatMessageParam._();
  factory ChatMessageParam.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageParamFromJson(json);

  Map<String, dynamic> toParamsJson() => <String, dynamic>{
        'page': page,
        'limit': limit,
        'type': chatId,
      };
}
