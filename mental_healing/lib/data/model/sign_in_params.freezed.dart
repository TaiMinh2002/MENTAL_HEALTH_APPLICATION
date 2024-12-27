// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignInParams _$SignInParamsFromJson(Map<String, dynamic> json) {
  return _SignInParams.fromJson(json);
}

/// @nodoc
mixin _$SignInParams {
  String? get identifier => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  int? get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInParamsCopyWith<SignInParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInParamsCopyWith<$Res> {
  factory $SignInParamsCopyWith(
          SignInParams value, $Res Function(SignInParams) then) =
      _$SignInParamsCopyWithImpl<$Res, SignInParams>;
  @useResult
  $Res call({String? identifier, String? password, int? role});
}

/// @nodoc
class _$SignInParamsCopyWithImpl<$Res, $Val extends SignInParams>
    implements $SignInParamsCopyWith<$Res> {
  _$SignInParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = freezed,
    Object? password = freezed,
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInParamsImplCopyWith<$Res>
    implements $SignInParamsCopyWith<$Res> {
  factory _$$SignInParamsImplCopyWith(
          _$SignInParamsImpl value, $Res Function(_$SignInParamsImpl) then) =
      __$$SignInParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? identifier, String? password, int? role});
}

/// @nodoc
class __$$SignInParamsImplCopyWithImpl<$Res>
    extends _$SignInParamsCopyWithImpl<$Res, _$SignInParamsImpl>
    implements _$$SignInParamsImplCopyWith<$Res> {
  __$$SignInParamsImplCopyWithImpl(
      _$SignInParamsImpl _value, $Res Function(_$SignInParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = freezed,
    Object? password = freezed,
    Object? role = freezed,
  }) {
    return _then(_$SignInParamsImpl(
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInParamsImpl implements _SignInParams {
  const _$SignInParamsImpl({this.identifier, this.password, this.role});

  factory _$SignInParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInParamsImplFromJson(json);

  @override
  final String? identifier;
  @override
  final String? password;
  @override
  final int? role;

  @override
  String toString() {
    return 'SignInParams(identifier: $identifier, password: $password, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInParamsImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, identifier, password, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInParamsImplCopyWith<_$SignInParamsImpl> get copyWith =>
      __$$SignInParamsImplCopyWithImpl<_$SignInParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInParamsImplToJson(
      this,
    );
  }
}

abstract class _SignInParams implements SignInParams {
  const factory _SignInParams(
      {final String? identifier,
      final String? password,
      final int? role}) = _$SignInParamsImpl;

  factory _SignInParams.fromJson(Map<String, dynamic> json) =
      _$SignInParamsImpl.fromJson;

  @override
  String? get identifier;
  @override
  String? get password;
  @override
  int? get role;
  @override
  @JsonKey(ignore: true)
  _$$SignInParamsImplCopyWith<_$SignInParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
