// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expert_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExpertInfo _$ExpertInfoFromJson(Map<String, dynamic> json) {
  return _ExpertInfo.fromJson(json);
}

/// @nodoc
mixin _$ExpertInfo {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get specialization => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get contact_info => throw _privateConstructorUsedError;
  String? get phone_number => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get specialization_string => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpertInfoCopyWith<ExpertInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpertInfoCopyWith<$Res> {
  factory $ExpertInfoCopyWith(
          ExpertInfo value, $Res Function(ExpertInfo) then) =
      _$ExpertInfoCopyWithImpl<$Res, ExpertInfo>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      int? specialization,
      String? bio,
      String? contact_info,
      String? phone_number,
      String? avatar,
      String? specialization_string});
}

/// @nodoc
class _$ExpertInfoCopyWithImpl<$Res, $Val extends ExpertInfo>
    implements $ExpertInfoCopyWith<$Res> {
  _$ExpertInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? specialization = freezed,
    Object? bio = freezed,
    Object? contact_info = freezed,
    Object? phone_number = freezed,
    Object? avatar = freezed,
    Object? specialization_string = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      specialization: freezed == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as int?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_info: freezed == contact_info
          ? _value.contact_info
          : contact_info // ignore: cast_nullable_to_non_nullable
              as String?,
      phone_number: freezed == phone_number
          ? _value.phone_number
          : phone_number // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      specialization_string: freezed == specialization_string
          ? _value.specialization_string
          : specialization_string // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpertInfoImplCopyWith<$Res>
    implements $ExpertInfoCopyWith<$Res> {
  factory _$$ExpertInfoImplCopyWith(
          _$ExpertInfoImpl value, $Res Function(_$ExpertInfoImpl) then) =
      __$$ExpertInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      int? specialization,
      String? bio,
      String? contact_info,
      String? phone_number,
      String? avatar,
      String? specialization_string});
}

/// @nodoc
class __$$ExpertInfoImplCopyWithImpl<$Res>
    extends _$ExpertInfoCopyWithImpl<$Res, _$ExpertInfoImpl>
    implements _$$ExpertInfoImplCopyWith<$Res> {
  __$$ExpertInfoImplCopyWithImpl(
      _$ExpertInfoImpl _value, $Res Function(_$ExpertInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? specialization = freezed,
    Object? bio = freezed,
    Object? contact_info = freezed,
    Object? phone_number = freezed,
    Object? avatar = freezed,
    Object? specialization_string = freezed,
  }) {
    return _then(_$ExpertInfoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      specialization: freezed == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as int?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_info: freezed == contact_info
          ? _value.contact_info
          : contact_info // ignore: cast_nullable_to_non_nullable
              as String?,
      phone_number: freezed == phone_number
          ? _value.phone_number
          : phone_number // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      specialization_string: freezed == specialization_string
          ? _value.specialization_string
          : specialization_string // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpertInfoImpl implements _ExpertInfo {
  const _$ExpertInfoImpl(
      {this.id,
      this.name,
      this.specialization,
      this.bio,
      this.contact_info,
      this.phone_number,
      this.avatar,
      this.specialization_string});

  factory _$ExpertInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpertInfoImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final int? specialization;
  @override
  final String? bio;
  @override
  final String? contact_info;
  @override
  final String? phone_number;
  @override
  final String? avatar;
  @override
  final String? specialization_string;

  @override
  String toString() {
    return 'ExpertInfo(id: $id, name: $name, specialization: $specialization, bio: $bio, contact_info: $contact_info, phone_number: $phone_number, avatar: $avatar, specialization_string: $specialization_string)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpertInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.contact_info, contact_info) ||
                other.contact_info == contact_info) &&
            (identical(other.phone_number, phone_number) ||
                other.phone_number == phone_number) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.specialization_string, specialization_string) ||
                other.specialization_string == specialization_string));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, specialization, bio,
      contact_info, phone_number, avatar, specialization_string);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpertInfoImplCopyWith<_$ExpertInfoImpl> get copyWith =>
      __$$ExpertInfoImplCopyWithImpl<_$ExpertInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpertInfoImplToJson(
      this,
    );
  }
}

abstract class _ExpertInfo implements ExpertInfo {
  const factory _ExpertInfo(
      {final int? id,
      final String? name,
      final int? specialization,
      final String? bio,
      final String? contact_info,
      final String? phone_number,
      final String? avatar,
      final String? specialization_string}) = _$ExpertInfoImpl;

  factory _ExpertInfo.fromJson(Map<String, dynamic> json) =
      _$ExpertInfoImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  int? get specialization;
  @override
  String? get bio;
  @override
  String? get contact_info;
  @override
  String? get phone_number;
  @override
  String? get avatar;
  @override
  String? get specialization_string;
  @override
  @JsonKey(ignore: true)
  _$$ExpertInfoImplCopyWith<_$ExpertInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
