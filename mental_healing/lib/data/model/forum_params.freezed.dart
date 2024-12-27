// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ForumParams _$ForumParamsFromJson(Map<String, dynamic> json) {
  return _ForumParams.fromJson(json);
}

/// @nodoc
mixin _$ForumParams {
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForumParamsCopyWith<ForumParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumParamsCopyWith<$Res> {
  factory $ForumParamsCopyWith(
          ForumParams value, $Res Function(ForumParams) then) =
      _$ForumParamsCopyWithImpl<$Res, ForumParams>;
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class _$ForumParamsCopyWithImpl<$Res, $Val extends ForumParams>
    implements $ForumParamsCopyWith<$Res> {
  _$ForumParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForumParamsImplCopyWith<$Res>
    implements $ForumParamsCopyWith<$Res> {
  factory _$$ForumParamsImplCopyWith(
          _$ForumParamsImpl value, $Res Function(_$ForumParamsImpl) then) =
      __$$ForumParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class __$$ForumParamsImplCopyWithImpl<$Res>
    extends _$ForumParamsCopyWithImpl<$Res, _$ForumParamsImpl>
    implements _$$ForumParamsImplCopyWith<$Res> {
  __$$ForumParamsImplCopyWithImpl(
      _$ForumParamsImpl _value, $Res Function(_$ForumParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$ForumParamsImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForumParamsImpl extends _ForumParams {
  _$ForumParamsImpl({this.page = 1, this.limit = 20}) : super._();

  factory _$ForumParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForumParamsImplFromJson(json);

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'ForumParams(page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForumParamsImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForumParamsImplCopyWith<_$ForumParamsImpl> get copyWith =>
      __$$ForumParamsImplCopyWithImpl<_$ForumParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForumParamsImplToJson(
      this,
    );
  }
}

abstract class _ForumParams extends ForumParams {
  factory _ForumParams({final int page, final int limit}) = _$ForumParamsImpl;
  _ForumParams._() : super._();

  factory _ForumParams.fromJson(Map<String, dynamic> json) =
      _$ForumParamsImpl.fromJson;

  @override
  int get page;
  @override
  int get limit;
  @override
  @JsonKey(ignore: true)
  _$$ForumParamsImplCopyWith<_$ForumParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
