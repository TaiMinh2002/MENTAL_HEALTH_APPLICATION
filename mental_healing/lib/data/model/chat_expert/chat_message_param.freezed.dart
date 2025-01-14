// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatMessageParam _$ChatMessageParamFromJson(Map<String, dynamic> json) {
  return _ChatMessageParam.fromJson(json);
}

/// @nodoc
mixin _$ChatMessageParam {
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int? get chatId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMessageParamCopyWith<ChatMessageParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageParamCopyWith<$Res> {
  factory $ChatMessageParamCopyWith(
          ChatMessageParam value, $Res Function(ChatMessageParam) then) =
      _$ChatMessageParamCopyWithImpl<$Res, ChatMessageParam>;
  @useResult
  $Res call({int page, int limit, int? chatId});
}

/// @nodoc
class _$ChatMessageParamCopyWithImpl<$Res, $Val extends ChatMessageParam>
    implements $ChatMessageParamCopyWith<$Res> {
  _$ChatMessageParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? chatId = freezed,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      chatId: freezed == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatMessageParamImplCopyWith<$Res>
    implements $ChatMessageParamCopyWith<$Res> {
  factory _$$ChatMessageParamImplCopyWith(_$ChatMessageParamImpl value,
          $Res Function(_$ChatMessageParamImpl) then) =
      __$$ChatMessageParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int limit, int? chatId});
}

/// @nodoc
class __$$ChatMessageParamImplCopyWithImpl<$Res>
    extends _$ChatMessageParamCopyWithImpl<$Res, _$ChatMessageParamImpl>
    implements _$$ChatMessageParamImplCopyWith<$Res> {
  __$$ChatMessageParamImplCopyWithImpl(_$ChatMessageParamImpl _value,
      $Res Function(_$ChatMessageParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? chatId = freezed,
  }) {
    return _then(_$ChatMessageParamImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      chatId: freezed == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageParamImpl extends _ChatMessageParam {
  _$ChatMessageParamImpl({this.page = 1, this.limit = 10, this.chatId})
      : super._();

  factory _$ChatMessageParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageParamImplFromJson(json);

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;
  @override
  final int? chatId;

  @override
  String toString() {
    return 'ChatMessageParam(page: $page, limit: $limit, chatId: $chatId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageParamImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.chatId, chatId) || other.chatId == chatId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, limit, chatId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageParamImplCopyWith<_$ChatMessageParamImpl> get copyWith =>
      __$$ChatMessageParamImplCopyWithImpl<_$ChatMessageParamImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageParamImplToJson(
      this,
    );
  }
}

abstract class _ChatMessageParam extends ChatMessageParam {
  factory _ChatMessageParam(
      {final int page,
      final int limit,
      final int? chatId}) = _$ChatMessageParamImpl;
  _ChatMessageParam._() : super._();

  factory _ChatMessageParam.fromJson(Map<String, dynamic> json) =
      _$ChatMessageParamImpl.fromJson;

  @override
  int get page;
  @override
  int get limit;
  @override
  int? get chatId;
  @override
  @JsonKey(ignore: true)
  _$$ChatMessageParamImplCopyWith<_$ChatMessageParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
