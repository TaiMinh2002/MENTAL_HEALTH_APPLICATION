// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_post_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreatePostResult _$CreatePostResultFromJson(Map<String, dynamic> json) {
  return _CreatePostResult.fromJson(json);
}

/// @nodoc
mixin _$CreatePostResult {
  String? get message => throw _privateConstructorUsedError;
  int? get post_id => throw _privateConstructorUsedError;
  int? get forum_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreatePostResultCopyWith<CreatePostResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePostResultCopyWith<$Res> {
  factory $CreatePostResultCopyWith(
          CreatePostResult value, $Res Function(CreatePostResult) then) =
      _$CreatePostResultCopyWithImpl<$Res, CreatePostResult>;
  @useResult
  $Res call({String? message, int? post_id, int? forum_id});
}

/// @nodoc
class _$CreatePostResultCopyWithImpl<$Res, $Val extends CreatePostResult>
    implements $CreatePostResultCopyWith<$Res> {
  _$CreatePostResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? post_id = freezed,
    Object? forum_id = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      post_id: freezed == post_id
          ? _value.post_id
          : post_id // ignore: cast_nullable_to_non_nullable
              as int?,
      forum_id: freezed == forum_id
          ? _value.forum_id
          : forum_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatePostResultImplCopyWith<$Res>
    implements $CreatePostResultCopyWith<$Res> {
  factory _$$CreatePostResultImplCopyWith(_$CreatePostResultImpl value,
          $Res Function(_$CreatePostResultImpl) then) =
      __$$CreatePostResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, int? post_id, int? forum_id});
}

/// @nodoc
class __$$CreatePostResultImplCopyWithImpl<$Res>
    extends _$CreatePostResultCopyWithImpl<$Res, _$CreatePostResultImpl>
    implements _$$CreatePostResultImplCopyWith<$Res> {
  __$$CreatePostResultImplCopyWithImpl(_$CreatePostResultImpl _value,
      $Res Function(_$CreatePostResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? post_id = freezed,
    Object? forum_id = freezed,
  }) {
    return _then(_$CreatePostResultImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      post_id: freezed == post_id
          ? _value.post_id
          : post_id // ignore: cast_nullable_to_non_nullable
              as int?,
      forum_id: freezed == forum_id
          ? _value.forum_id
          : forum_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatePostResultImpl implements _CreatePostResult {
  const _$CreatePostResultImpl({this.message, this.post_id, this.forum_id});

  factory _$CreatePostResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatePostResultImplFromJson(json);

  @override
  final String? message;
  @override
  final int? post_id;
  @override
  final int? forum_id;

  @override
  String toString() {
    return 'CreatePostResult(message: $message, post_id: $post_id, forum_id: $forum_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePostResultImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.post_id, post_id) || other.post_id == post_id) &&
            (identical(other.forum_id, forum_id) ||
                other.forum_id == forum_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, post_id, forum_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePostResultImplCopyWith<_$CreatePostResultImpl> get copyWith =>
      __$$CreatePostResultImplCopyWithImpl<_$CreatePostResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatePostResultImplToJson(
      this,
    );
  }
}

abstract class _CreatePostResult implements CreatePostResult {
  const factory _CreatePostResult(
      {final String? message,
      final int? post_id,
      final int? forum_id}) = _$CreatePostResultImpl;

  factory _CreatePostResult.fromJson(Map<String, dynamic> json) =
      _$CreatePostResultImpl.fromJson;

  @override
  String? get message;
  @override
  int? get post_id;
  @override
  int? get forum_id;
  @override
  @JsonKey(ignore: true)
  _$$CreatePostResultImplCopyWith<_$CreatePostResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
