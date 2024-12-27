// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_create_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ForumCreateParams _$ForumCreateParamsFromJson(Map<String, dynamic> json) {
  return _ForumCreateParams.fromJson(json);
}

/// @nodoc
mixin _$ForumCreateParams {
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  dynamic get cover_image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForumCreateParamsCopyWith<ForumCreateParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumCreateParamsCopyWith<$Res> {
  factory $ForumCreateParamsCopyWith(
          ForumCreateParams value, $Res Function(ForumCreateParams) then) =
      _$ForumCreateParamsCopyWithImpl<$Res, ForumCreateParams>;
  @useResult
  $Res call({String? title, String? description, dynamic cover_image});
}

/// @nodoc
class _$ForumCreateParamsCopyWithImpl<$Res, $Val extends ForumCreateParams>
    implements $ForumCreateParamsCopyWith<$Res> {
  _$ForumCreateParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? cover_image = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      cover_image: freezed == cover_image
          ? _value.cover_image
          : cover_image // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForumCreateParamsImplCopyWith<$Res>
    implements $ForumCreateParamsCopyWith<$Res> {
  factory _$$ForumCreateParamsImplCopyWith(_$ForumCreateParamsImpl value,
          $Res Function(_$ForumCreateParamsImpl) then) =
      __$$ForumCreateParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? description, dynamic cover_image});
}

/// @nodoc
class __$$ForumCreateParamsImplCopyWithImpl<$Res>
    extends _$ForumCreateParamsCopyWithImpl<$Res, _$ForumCreateParamsImpl>
    implements _$$ForumCreateParamsImplCopyWith<$Res> {
  __$$ForumCreateParamsImplCopyWithImpl(_$ForumCreateParamsImpl _value,
      $Res Function(_$ForumCreateParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? cover_image = freezed,
  }) {
    return _then(_$ForumCreateParamsImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      cover_image: freezed == cover_image
          ? _value.cover_image
          : cover_image // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForumCreateParamsImpl implements _ForumCreateParams {
  _$ForumCreateParamsImpl({this.title, this.description, this.cover_image});

  factory _$ForumCreateParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForumCreateParamsImplFromJson(json);

  @override
  final String? title;
  @override
  final String? description;
  @override
  final dynamic cover_image;

  @override
  String toString() {
    return 'ForumCreateParams(title: $title, description: $description, cover_image: $cover_image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForumCreateParamsImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.cover_image, cover_image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description,
      const DeepCollectionEquality().hash(cover_image));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForumCreateParamsImplCopyWith<_$ForumCreateParamsImpl> get copyWith =>
      __$$ForumCreateParamsImplCopyWithImpl<_$ForumCreateParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForumCreateParamsImplToJson(
      this,
    );
  }
}

abstract class _ForumCreateParams implements ForumCreateParams {
  factory _ForumCreateParams(
      {final String? title,
      final String? description,
      final dynamic cover_image}) = _$ForumCreateParamsImpl;

  factory _ForumCreateParams.fromJson(Map<String, dynamic> json) =
      _$ForumCreateParamsImpl.fromJson;

  @override
  String? get title;
  @override
  String? get description;
  @override
  dynamic get cover_image;
  @override
  @JsonKey(ignore: true)
  _$$ForumCreateParamsImplCopyWith<_$ForumCreateParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
