// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostInfo _$PostInfoFromJson(Map<String, dynamic> json) {
  return _PostInfo.fromJson(json);
}

/// @nodoc
mixin _$PostInfo {
  int? get id => throw _privateConstructorUsedError;
  int? get forum_id => throw _privateConstructorUsedError;
  int? get user_id => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  int? get like_count => throw _privateConstructorUsedError;
  int? get comment_count => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get created_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostInfoCopyWith<PostInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostInfoCopyWith<$Res> {
  factory $PostInfoCopyWith(PostInfo value, $Res Function(PostInfo) then) =
      _$PostInfoCopyWithImpl<$Res, PostInfo>;
  @useResult
  $Res call(
      {int? id,
      int? forum_id,
      int? user_id,
      String? username,
      int? like_count,
      int? comment_count,
      String? content,
      String? title,
      String? created_at});
}

/// @nodoc
class _$PostInfoCopyWithImpl<$Res, $Val extends PostInfo>
    implements $PostInfoCopyWith<$Res> {
  _$PostInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? forum_id = freezed,
    Object? user_id = freezed,
    Object? username = freezed,
    Object? like_count = freezed,
    Object? comment_count = freezed,
    Object? content = freezed,
    Object? title = freezed,
    Object? created_at = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      forum_id: freezed == forum_id
          ? _value.forum_id
          : forum_id // ignore: cast_nullable_to_non_nullable
              as int?,
      user_id: freezed == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      like_count: freezed == like_count
          ? _value.like_count
          : like_count // ignore: cast_nullable_to_non_nullable
              as int?,
      comment_count: freezed == comment_count
          ? _value.comment_count
          : comment_count // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostInfoImplCopyWith<$Res>
    implements $PostInfoCopyWith<$Res> {
  factory _$$PostInfoImplCopyWith(
          _$PostInfoImpl value, $Res Function(_$PostInfoImpl) then) =
      __$$PostInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? forum_id,
      int? user_id,
      String? username,
      int? like_count,
      int? comment_count,
      String? content,
      String? title,
      String? created_at});
}

/// @nodoc
class __$$PostInfoImplCopyWithImpl<$Res>
    extends _$PostInfoCopyWithImpl<$Res, _$PostInfoImpl>
    implements _$$PostInfoImplCopyWith<$Res> {
  __$$PostInfoImplCopyWithImpl(
      _$PostInfoImpl _value, $Res Function(_$PostInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? forum_id = freezed,
    Object? user_id = freezed,
    Object? username = freezed,
    Object? like_count = freezed,
    Object? comment_count = freezed,
    Object? content = freezed,
    Object? title = freezed,
    Object? created_at = freezed,
  }) {
    return _then(_$PostInfoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      forum_id: freezed == forum_id
          ? _value.forum_id
          : forum_id // ignore: cast_nullable_to_non_nullable
              as int?,
      user_id: freezed == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      like_count: freezed == like_count
          ? _value.like_count
          : like_count // ignore: cast_nullable_to_non_nullable
              as int?,
      comment_count: freezed == comment_count
          ? _value.comment_count
          : comment_count // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostInfoImpl implements _PostInfo {
  const _$PostInfoImpl(
      {this.id,
      this.forum_id,
      this.user_id,
      this.username,
      this.like_count,
      this.comment_count,
      this.content,
      this.title,
      this.created_at});

  factory _$PostInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostInfoImplFromJson(json);

  @override
  final int? id;
  @override
  final int? forum_id;
  @override
  final int? user_id;
  @override
  final String? username;
  @override
  final int? like_count;
  @override
  final int? comment_count;
  @override
  final String? content;
  @override
  final String? title;
  @override
  final String? created_at;

  @override
  String toString() {
    return 'PostInfo(id: $id, forum_id: $forum_id, user_id: $user_id, username: $username, like_count: $like_count, comment_count: $comment_count, content: $content, title: $title, created_at: $created_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.forum_id, forum_id) ||
                other.forum_id == forum_id) &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.like_count, like_count) ||
                other.like_count == like_count) &&
            (identical(other.comment_count, comment_count) ||
                other.comment_count == comment_count) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, forum_id, user_id, username,
      like_count, comment_count, content, title, created_at);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostInfoImplCopyWith<_$PostInfoImpl> get copyWith =>
      __$$PostInfoImplCopyWithImpl<_$PostInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostInfoImplToJson(
      this,
    );
  }
}

abstract class _PostInfo implements PostInfo {
  const factory _PostInfo(
      {final int? id,
      final int? forum_id,
      final int? user_id,
      final String? username,
      final int? like_count,
      final int? comment_count,
      final String? content,
      final String? title,
      final String? created_at}) = _$PostInfoImpl;

  factory _PostInfo.fromJson(Map<String, dynamic> json) =
      _$PostInfoImpl.fromJson;

  @override
  int? get id;
  @override
  int? get forum_id;
  @override
  int? get user_id;
  @override
  String? get username;
  @override
  int? get like_count;
  @override
  int? get comment_count;
  @override
  String? get content;
  @override
  String? get title;
  @override
  String? get created_at;
  @override
  @JsonKey(ignore: true)
  _$$PostInfoImplCopyWith<_$PostInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
