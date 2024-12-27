// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_mood_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SetMoodParams _$SetMoodParamsFromJson(Map<String, dynamic> json) {
  return _SetMoodParams.fromJson(json);
}

/// @nodoc
mixin _$SetMoodParams {
  String? get mood => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetMoodParamsCopyWith<SetMoodParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetMoodParamsCopyWith<$Res> {
  factory $SetMoodParamsCopyWith(
          SetMoodParams value, $Res Function(SetMoodParams) then) =
      _$SetMoodParamsCopyWithImpl<$Res, SetMoodParams>;
  @useResult
  $Res call({String? mood});
}

/// @nodoc
class _$SetMoodParamsCopyWithImpl<$Res, $Val extends SetMoodParams>
    implements $SetMoodParamsCopyWith<$Res> {
  _$SetMoodParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mood = freezed,
  }) {
    return _then(_value.copyWith(
      mood: freezed == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SetMoodParamsImplCopyWith<$Res>
    implements $SetMoodParamsCopyWith<$Res> {
  factory _$$SetMoodParamsImplCopyWith(
          _$SetMoodParamsImpl value, $Res Function(_$SetMoodParamsImpl) then) =
      __$$SetMoodParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? mood});
}

/// @nodoc
class __$$SetMoodParamsImplCopyWithImpl<$Res>
    extends _$SetMoodParamsCopyWithImpl<$Res, _$SetMoodParamsImpl>
    implements _$$SetMoodParamsImplCopyWith<$Res> {
  __$$SetMoodParamsImplCopyWithImpl(
      _$SetMoodParamsImpl _value, $Res Function(_$SetMoodParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mood = freezed,
  }) {
    return _then(_$SetMoodParamsImpl(
      mood: freezed == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SetMoodParamsImpl implements _SetMoodParams {
  const _$SetMoodParamsImpl({this.mood});

  factory _$SetMoodParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SetMoodParamsImplFromJson(json);

  @override
  final String? mood;

  @override
  String toString() {
    return 'SetMoodParams(mood: $mood)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetMoodParamsImpl &&
            (identical(other.mood, mood) || other.mood == mood));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mood);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetMoodParamsImplCopyWith<_$SetMoodParamsImpl> get copyWith =>
      __$$SetMoodParamsImplCopyWithImpl<_$SetMoodParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SetMoodParamsImplToJson(
      this,
    );
  }
}

abstract class _SetMoodParams implements SetMoodParams {
  const factory _SetMoodParams({final String? mood}) = _$SetMoodParamsImpl;

  factory _SetMoodParams.fromJson(Map<String, dynamic> json) =
      _$SetMoodParamsImpl.fromJson;

  @override
  String? get mood;
  @override
  @JsonKey(ignore: true)
  _$$SetMoodParamsImplCopyWith<_$SetMoodParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
