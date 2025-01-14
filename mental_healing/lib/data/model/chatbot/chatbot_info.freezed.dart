// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatbot_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatbotInfo _$ChatbotInfoFromJson(Map<String, dynamic> json) {
  return _ChatbotInfo.fromJson(json);
}

/// @nodoc
mixin _$ChatbotInfo {
  String? get user_message => throw _privateConstructorUsedError;
  String? get bot_reply => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatbotInfoCopyWith<ChatbotInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatbotInfoCopyWith<$Res> {
  factory $ChatbotInfoCopyWith(
          ChatbotInfo value, $Res Function(ChatbotInfo) then) =
      _$ChatbotInfoCopyWithImpl<$Res, ChatbotInfo>;
  @useResult
  $Res call({String? user_message, String? bot_reply});
}

/// @nodoc
class _$ChatbotInfoCopyWithImpl<$Res, $Val extends ChatbotInfo>
    implements $ChatbotInfoCopyWith<$Res> {
  _$ChatbotInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_message = freezed,
    Object? bot_reply = freezed,
  }) {
    return _then(_value.copyWith(
      user_message: freezed == user_message
          ? _value.user_message
          : user_message // ignore: cast_nullable_to_non_nullable
              as String?,
      bot_reply: freezed == bot_reply
          ? _value.bot_reply
          : bot_reply // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatbotInfoImplCopyWith<$Res>
    implements $ChatbotInfoCopyWith<$Res> {
  factory _$$ChatbotInfoImplCopyWith(
          _$ChatbotInfoImpl value, $Res Function(_$ChatbotInfoImpl) then) =
      __$$ChatbotInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? user_message, String? bot_reply});
}

/// @nodoc
class __$$ChatbotInfoImplCopyWithImpl<$Res>
    extends _$ChatbotInfoCopyWithImpl<$Res, _$ChatbotInfoImpl>
    implements _$$ChatbotInfoImplCopyWith<$Res> {
  __$$ChatbotInfoImplCopyWithImpl(
      _$ChatbotInfoImpl _value, $Res Function(_$ChatbotInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_message = freezed,
    Object? bot_reply = freezed,
  }) {
    return _then(_$ChatbotInfoImpl(
      user_message: freezed == user_message
          ? _value.user_message
          : user_message // ignore: cast_nullable_to_non_nullable
              as String?,
      bot_reply: freezed == bot_reply
          ? _value.bot_reply
          : bot_reply // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatbotInfoImpl implements _ChatbotInfo {
  const _$ChatbotInfoImpl({this.user_message, this.bot_reply});

  factory _$ChatbotInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatbotInfoImplFromJson(json);

  @override
  final String? user_message;
  @override
  final String? bot_reply;

  @override
  String toString() {
    return 'ChatbotInfo(user_message: $user_message, bot_reply: $bot_reply)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatbotInfoImpl &&
            (identical(other.user_message, user_message) ||
                other.user_message == user_message) &&
            (identical(other.bot_reply, bot_reply) ||
                other.bot_reply == bot_reply));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user_message, bot_reply);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatbotInfoImplCopyWith<_$ChatbotInfoImpl> get copyWith =>
      __$$ChatbotInfoImplCopyWithImpl<_$ChatbotInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatbotInfoImplToJson(
      this,
    );
  }
}

abstract class _ChatbotInfo implements ChatbotInfo {
  const factory _ChatbotInfo(
      {final String? user_message,
      final String? bot_reply}) = _$ChatbotInfoImpl;

  factory _ChatbotInfo.fromJson(Map<String, dynamic> json) =
      _$ChatbotInfoImpl.fromJson;

  @override
  String? get user_message;
  @override
  String? get bot_reply;
  @override
  @JsonKey(ignore: true)
  _$$ChatbotInfoImplCopyWith<_$ChatbotInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
