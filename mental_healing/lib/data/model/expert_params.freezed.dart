// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expert_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExpertParams _$ExpertParamsFromJson(Map<String, dynamic> json) {
  return _ExpertParams.fromJson(json);
}

/// @nodoc
mixin _$ExpertParams {
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int? get specialization => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpertParamsCopyWith<ExpertParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpertParamsCopyWith<$Res> {
  factory $ExpertParamsCopyWith(
          ExpertParams value, $Res Function(ExpertParams) then) =
      _$ExpertParamsCopyWithImpl<$Res, ExpertParams>;
  @useResult
  $Res call({int page, int limit, int? specialization});
}

/// @nodoc
class _$ExpertParamsCopyWithImpl<$Res, $Val extends ExpertParams>
    implements $ExpertParamsCopyWith<$Res> {
  _$ExpertParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? specialization = freezed,
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
      specialization: freezed == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpertParamsImplCopyWith<$Res>
    implements $ExpertParamsCopyWith<$Res> {
  factory _$$ExpertParamsImplCopyWith(
          _$ExpertParamsImpl value, $Res Function(_$ExpertParamsImpl) then) =
      __$$ExpertParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int limit, int? specialization});
}

/// @nodoc
class __$$ExpertParamsImplCopyWithImpl<$Res>
    extends _$ExpertParamsCopyWithImpl<$Res, _$ExpertParamsImpl>
    implements _$$ExpertParamsImplCopyWith<$Res> {
  __$$ExpertParamsImplCopyWithImpl(
      _$ExpertParamsImpl _value, $Res Function(_$ExpertParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? specialization = freezed,
  }) {
    return _then(_$ExpertParamsImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      specialization: freezed == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpertParamsImpl extends _ExpertParams {
  _$ExpertParamsImpl({this.page = 1, this.limit = 20, this.specialization})
      : super._();

  factory _$ExpertParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpertParamsImplFromJson(json);

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;
  @override
  final int? specialization;

  @override
  String toString() {
    return 'ExpertParams(page: $page, limit: $limit, specialization: $specialization)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpertParamsImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, limit, specialization);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpertParamsImplCopyWith<_$ExpertParamsImpl> get copyWith =>
      __$$ExpertParamsImplCopyWithImpl<_$ExpertParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpertParamsImplToJson(
      this,
    );
  }
}

abstract class _ExpertParams extends ExpertParams {
  factory _ExpertParams(
      {final int page,
      final int limit,
      final int? specialization}) = _$ExpertParamsImpl;
  _ExpertParams._() : super._();

  factory _ExpertParams.fromJson(Map<String, dynamic> json) =
      _$ExpertParamsImpl.fromJson;

  @override
  int get page;
  @override
  int get limit;
  @override
  int? get specialization;
  @override
  @JsonKey(ignore: true)
  _$$ExpertParamsImplCopyWith<_$ExpertParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
