// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_post_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreatePostParams _$CreatePostParamsFromJson(Map<String, dynamic> json) {
  return _CreatePostParams.fromJson(json);
}

/// @nodoc
mixin _$CreatePostParams {
  String? get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  int? get forum_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreatePostParamsCopyWith<CreatePostParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePostParamsCopyWith<$Res> {
  factory $CreatePostParamsCopyWith(
          CreatePostParams value, $Res Function(CreatePostParams) then) =
      _$CreatePostParamsCopyWithImpl<$Res, CreatePostParams>;
  @useResult
  $Res call({String? title, String? content, int? forum_id});
}

/// @nodoc
class _$CreatePostParamsCopyWithImpl<$Res, $Val extends CreatePostParams>
    implements $CreatePostParamsCopyWith<$Res> {
  _$CreatePostParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
    Object? forum_id = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      forum_id: freezed == forum_id
          ? _value.forum_id
          : forum_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatePostParamsImplCopyWith<$Res>
    implements $CreatePostParamsCopyWith<$Res> {
  factory _$$CreatePostParamsImplCopyWith(_$CreatePostParamsImpl value,
          $Res Function(_$CreatePostParamsImpl) then) =
      __$$CreatePostParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? content, int? forum_id});
}

/// @nodoc
class __$$CreatePostParamsImplCopyWithImpl<$Res>
    extends _$CreatePostParamsCopyWithImpl<$Res, _$CreatePostParamsImpl>
    implements _$$CreatePostParamsImplCopyWith<$Res> {
  __$$CreatePostParamsImplCopyWithImpl(_$CreatePostParamsImpl _value,
      $Res Function(_$CreatePostParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
    Object? forum_id = freezed,
  }) {
    return _then(_$CreatePostParamsImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      forum_id: freezed == forum_id
          ? _value.forum_id
          : forum_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatePostParamsImpl implements _CreatePostParams {
  const _$CreatePostParamsImpl({this.title, this.content, this.forum_id});

  factory _$CreatePostParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatePostParamsImplFromJson(json);

  @override
  final String? title;
  @override
  final String? content;
  @override
  final int? forum_id;

  @override
  String toString() {
    return 'CreatePostParams(title: $title, content: $content, forum_id: $forum_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePostParamsImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.forum_id, forum_id) ||
                other.forum_id == forum_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, content, forum_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePostParamsImplCopyWith<_$CreatePostParamsImpl> get copyWith =>
      __$$CreatePostParamsImplCopyWithImpl<_$CreatePostParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatePostParamsImplToJson(
      this,
    );
  }
}

abstract class _CreatePostParams implements CreatePostParams {
  const factory _CreatePostParams(
      {final String? title,
      final String? content,
      final int? forum_id}) = _$CreatePostParamsImpl;

  factory _CreatePostParams.fromJson(Map<String, dynamic> json) =
      _$CreatePostParamsImpl.fromJson;

  @override
  String? get title;
  @override
  String? get content;
  @override
  int? get forum_id;
  @override
  @JsonKey(ignore: true)
  _$$CreatePostParamsImplCopyWith<_$CreatePostParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
