// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_list_messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetListMessages _$GetListMessagesFromJson(Map<String, dynamic> json) {
  return _GetListMessages.fromJson(json);
}

/// @nodoc
mixin _$GetListMessages {
  List<ChatExpertInfo>? get data => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  int? get per_page => throw _privateConstructorUsedError;
  int? get current_page => throw _privateConstructorUsedError;
  int? get last_page => throw _privateConstructorUsedError;
  bool? get has_more_pages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetListMessagesCopyWith<GetListMessages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetListMessagesCopyWith<$Res> {
  factory $GetListMessagesCopyWith(
          GetListMessages value, $Res Function(GetListMessages) then) =
      _$GetListMessagesCopyWithImpl<$Res, GetListMessages>;
  @useResult
  $Res call(
      {List<ChatExpertInfo>? data,
      int? total,
      int? per_page,
      int? current_page,
      int? last_page,
      bool? has_more_pages});
}

/// @nodoc
class _$GetListMessagesCopyWithImpl<$Res, $Val extends GetListMessages>
    implements $GetListMessagesCopyWith<$Res> {
  _$GetListMessagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? total = freezed,
    Object? per_page = freezed,
    Object? current_page = freezed,
    Object? last_page = freezed,
    Object? has_more_pages = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ChatExpertInfo>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      per_page: freezed == per_page
          ? _value.per_page
          : per_page // ignore: cast_nullable_to_non_nullable
              as int?,
      current_page: freezed == current_page
          ? _value.current_page
          : current_page // ignore: cast_nullable_to_non_nullable
              as int?,
      last_page: freezed == last_page
          ? _value.last_page
          : last_page // ignore: cast_nullable_to_non_nullable
              as int?,
      has_more_pages: freezed == has_more_pages
          ? _value.has_more_pages
          : has_more_pages // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetListMessagesImplCopyWith<$Res>
    implements $GetListMessagesCopyWith<$Res> {
  factory _$$GetListMessagesImplCopyWith(_$GetListMessagesImpl value,
          $Res Function(_$GetListMessagesImpl) then) =
      __$$GetListMessagesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ChatExpertInfo>? data,
      int? total,
      int? per_page,
      int? current_page,
      int? last_page,
      bool? has_more_pages});
}

/// @nodoc
class __$$GetListMessagesImplCopyWithImpl<$Res>
    extends _$GetListMessagesCopyWithImpl<$Res, _$GetListMessagesImpl>
    implements _$$GetListMessagesImplCopyWith<$Res> {
  __$$GetListMessagesImplCopyWithImpl(
      _$GetListMessagesImpl _value, $Res Function(_$GetListMessagesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? total = freezed,
    Object? per_page = freezed,
    Object? current_page = freezed,
    Object? last_page = freezed,
    Object? has_more_pages = freezed,
  }) {
    return _then(_$GetListMessagesImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ChatExpertInfo>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      per_page: freezed == per_page
          ? _value.per_page
          : per_page // ignore: cast_nullable_to_non_nullable
              as int?,
      current_page: freezed == current_page
          ? _value.current_page
          : current_page // ignore: cast_nullable_to_non_nullable
              as int?,
      last_page: freezed == last_page
          ? _value.last_page
          : last_page // ignore: cast_nullable_to_non_nullable
              as int?,
      has_more_pages: freezed == has_more_pages
          ? _value.has_more_pages
          : has_more_pages // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetListMessagesImpl implements _GetListMessages {
  const _$GetListMessagesImpl(
      {final List<ChatExpertInfo>? data,
      this.total,
      this.per_page,
      this.current_page,
      this.last_page,
      this.has_more_pages})
      : _data = data;

  factory _$GetListMessagesImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetListMessagesImplFromJson(json);

  final List<ChatExpertInfo>? _data;
  @override
  List<ChatExpertInfo>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? total;
  @override
  final int? per_page;
  @override
  final int? current_page;
  @override
  final int? last_page;
  @override
  final bool? has_more_pages;

  @override
  String toString() {
    return 'GetListMessages(data: $data, total: $total, per_page: $per_page, current_page: $current_page, last_page: $last_page, has_more_pages: $has_more_pages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetListMessagesImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.per_page, per_page) ||
                other.per_page == per_page) &&
            (identical(other.current_page, current_page) ||
                other.current_page == current_page) &&
            (identical(other.last_page, last_page) ||
                other.last_page == last_page) &&
            (identical(other.has_more_pages, has_more_pages) ||
                other.has_more_pages == has_more_pages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      total,
      per_page,
      current_page,
      last_page,
      has_more_pages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetListMessagesImplCopyWith<_$GetListMessagesImpl> get copyWith =>
      __$$GetListMessagesImplCopyWithImpl<_$GetListMessagesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetListMessagesImplToJson(
      this,
    );
  }
}

abstract class _GetListMessages implements GetListMessages {
  const factory _GetListMessages(
      {final List<ChatExpertInfo>? data,
      final int? total,
      final int? per_page,
      final int? current_page,
      final int? last_page,
      final bool? has_more_pages}) = _$GetListMessagesImpl;

  factory _GetListMessages.fromJson(Map<String, dynamic> json) =
      _$GetListMessagesImpl.fromJson;

  @override
  List<ChatExpertInfo>? get data;
  @override
  int? get total;
  @override
  int? get per_page;
  @override
  int? get current_page;
  @override
  int? get last_page;
  @override
  bool? get has_more_pages;
  @override
  @JsonKey(ignore: true)
  _$$GetListMessagesImplCopyWith<_$GetListMessagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
