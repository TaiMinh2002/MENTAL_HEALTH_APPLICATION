// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_create_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoomCreateParams _$RoomCreateParamsFromJson(Map<String, dynamic> json) {
  return _RoomCreateParams.fromJson(json);
}

/// @nodoc
mixin _$RoomCreateParams {
  int? get expert_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomCreateParamsCopyWith<RoomCreateParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomCreateParamsCopyWith<$Res> {
  factory $RoomCreateParamsCopyWith(
          RoomCreateParams value, $Res Function(RoomCreateParams) then) =
      _$RoomCreateParamsCopyWithImpl<$Res, RoomCreateParams>;
  @useResult
  $Res call({int? expert_id});
}

/// @nodoc
class _$RoomCreateParamsCopyWithImpl<$Res, $Val extends RoomCreateParams>
    implements $RoomCreateParamsCopyWith<$Res> {
  _$RoomCreateParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expert_id = freezed,
  }) {
    return _then(_value.copyWith(
      expert_id: freezed == expert_id
          ? _value.expert_id
          : expert_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomCreateParamsImplCopyWith<$Res>
    implements $RoomCreateParamsCopyWith<$Res> {
  factory _$$RoomCreateParamsImplCopyWith(_$RoomCreateParamsImpl value,
          $Res Function(_$RoomCreateParamsImpl) then) =
      __$$RoomCreateParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? expert_id});
}

/// @nodoc
class __$$RoomCreateParamsImplCopyWithImpl<$Res>
    extends _$RoomCreateParamsCopyWithImpl<$Res, _$RoomCreateParamsImpl>
    implements _$$RoomCreateParamsImplCopyWith<$Res> {
  __$$RoomCreateParamsImplCopyWithImpl(_$RoomCreateParamsImpl _value,
      $Res Function(_$RoomCreateParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expert_id = freezed,
  }) {
    return _then(_$RoomCreateParamsImpl(
      expert_id: freezed == expert_id
          ? _value.expert_id
          : expert_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomCreateParamsImpl implements _RoomCreateParams {
  const _$RoomCreateParamsImpl({this.expert_id});

  factory _$RoomCreateParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomCreateParamsImplFromJson(json);

  @override
  final int? expert_id;

  @override
  String toString() {
    return 'RoomCreateParams(expert_id: $expert_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomCreateParamsImpl &&
            (identical(other.expert_id, expert_id) ||
                other.expert_id == expert_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, expert_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomCreateParamsImplCopyWith<_$RoomCreateParamsImpl> get copyWith =>
      __$$RoomCreateParamsImplCopyWithImpl<_$RoomCreateParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomCreateParamsImplToJson(
      this,
    );
  }
}

abstract class _RoomCreateParams implements RoomCreateParams {
  const factory _RoomCreateParams({final int? expert_id}) =
      _$RoomCreateParamsImpl;

  factory _RoomCreateParams.fromJson(Map<String, dynamic> json) =
      _$RoomCreateParamsImpl.fromJson;

  @override
  int? get expert_id;
  @override
  @JsonKey(ignore: true)
  _$$RoomCreateParamsImplCopyWith<_$RoomCreateParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
