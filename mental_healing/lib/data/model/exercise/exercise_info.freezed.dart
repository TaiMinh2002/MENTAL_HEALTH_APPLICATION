// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExerciseInfo _$ExerciseInfoFromJson(Map<String, dynamic> json) {
  return _ExerciseInfo.fromJson(json);
}

/// @nodoc
mixin _$ExerciseInfo {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get type => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get media_url => throw _privateConstructorUsedError;
  String? get thumbnail_url => throw _privateConstructorUsedError;
  String? get type_string => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseInfoCopyWith<ExerciseInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseInfoCopyWith<$Res> {
  factory $ExerciseInfoCopyWith(
          ExerciseInfo value, $Res Function(ExerciseInfo) then) =
      _$ExerciseInfoCopyWithImpl<$Res, ExerciseInfo>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? description,
      int? type,
      String? content,
      String? media_url,
      String? thumbnail_url,
      String? type_string});
}

/// @nodoc
class _$ExerciseInfoCopyWithImpl<$Res, $Val extends ExerciseInfo>
    implements $ExerciseInfoCopyWith<$Res> {
  _$ExerciseInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? content = freezed,
    Object? media_url = freezed,
    Object? thumbnail_url = freezed,
    Object? type_string = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      media_url: freezed == media_url
          ? _value.media_url
          : media_url // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail_url: freezed == thumbnail_url
          ? _value.thumbnail_url
          : thumbnail_url // ignore: cast_nullable_to_non_nullable
              as String?,
      type_string: freezed == type_string
          ? _value.type_string
          : type_string // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseInfoImplCopyWith<$Res>
    implements $ExerciseInfoCopyWith<$Res> {
  factory _$$ExerciseInfoImplCopyWith(
          _$ExerciseInfoImpl value, $Res Function(_$ExerciseInfoImpl) then) =
      __$$ExerciseInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? description,
      int? type,
      String? content,
      String? media_url,
      String? thumbnail_url,
      String? type_string});
}

/// @nodoc
class __$$ExerciseInfoImplCopyWithImpl<$Res>
    extends _$ExerciseInfoCopyWithImpl<$Res, _$ExerciseInfoImpl>
    implements _$$ExerciseInfoImplCopyWith<$Res> {
  __$$ExerciseInfoImplCopyWithImpl(
      _$ExerciseInfoImpl _value, $Res Function(_$ExerciseInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? content = freezed,
    Object? media_url = freezed,
    Object? thumbnail_url = freezed,
    Object? type_string = freezed,
  }) {
    return _then(_$ExerciseInfoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      media_url: freezed == media_url
          ? _value.media_url
          : media_url // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail_url: freezed == thumbnail_url
          ? _value.thumbnail_url
          : thumbnail_url // ignore: cast_nullable_to_non_nullable
              as String?,
      type_string: freezed == type_string
          ? _value.type_string
          : type_string // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseInfoImpl implements _ExerciseInfo {
  const _$ExerciseInfoImpl(
      {this.id,
      this.title,
      this.description,
      this.type,
      this.content,
      this.media_url,
      this.thumbnail_url,
      this.type_string});

  factory _$ExerciseInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseInfoImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final int? type;
  @override
  final String? content;
  @override
  final String? media_url;
  @override
  final String? thumbnail_url;
  @override
  final String? type_string;

  @override
  String toString() {
    return 'ExerciseInfo(id: $id, title: $title, description: $description, type: $type, content: $content, media_url: $media_url, thumbnail_url: $thumbnail_url, type_string: $type_string)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.media_url, media_url) ||
                other.media_url == media_url) &&
            (identical(other.thumbnail_url, thumbnail_url) ||
                other.thumbnail_url == thumbnail_url) &&
            (identical(other.type_string, type_string) ||
                other.type_string == type_string));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, type,
      content, media_url, thumbnail_url, type_string);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseInfoImplCopyWith<_$ExerciseInfoImpl> get copyWith =>
      __$$ExerciseInfoImplCopyWithImpl<_$ExerciseInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseInfoImplToJson(
      this,
    );
  }
}

abstract class _ExerciseInfo implements ExerciseInfo {
  const factory _ExerciseInfo(
      {final int? id,
      final String? title,
      final String? description,
      final int? type,
      final String? content,
      final String? media_url,
      final String? thumbnail_url,
      final String? type_string}) = _$ExerciseInfoImpl;

  factory _ExerciseInfo.fromJson(Map<String, dynamic> json) =
      _$ExerciseInfoImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  int? get type;
  @override
  String? get content;
  @override
  String? get media_url;
  @override
  String? get thumbnail_url;
  @override
  String? get type_string;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseInfoImplCopyWith<_$ExerciseInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
