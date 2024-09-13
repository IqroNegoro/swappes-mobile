// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserFriend _$UserFriendFromJson(Map<String, dynamic> json) {
  return _UserFriend.fromJson(json);
}

/// @nodoc
mixin _$UserFriend {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  dynamic get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserFriendCopyWith<UserFriend> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFriendCopyWith<$Res> {
  factory $UserFriendCopyWith(
          UserFriend value, $Res Function(UserFriend) then) =
      _$UserFriendCopyWithImpl<$Res, UserFriend>;
  @useResult
  $Res call({@JsonKey(name: "_id") String id, String name, dynamic avatar});
}

/// @nodoc
class _$UserFriendCopyWithImpl<$Res, $Val extends UserFriend>
    implements $UserFriendCopyWith<$Res> {
  _$UserFriendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserFriendImplCopyWith<$Res>
    implements $UserFriendCopyWith<$Res> {
  factory _$$UserFriendImplCopyWith(
          _$UserFriendImpl value, $Res Function(_$UserFriendImpl) then) =
      __$$UserFriendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "_id") String id, String name, dynamic avatar});
}

/// @nodoc
class __$$UserFriendImplCopyWithImpl<$Res>
    extends _$UserFriendCopyWithImpl<$Res, _$UserFriendImpl>
    implements _$$UserFriendImplCopyWith<$Res> {
  __$$UserFriendImplCopyWithImpl(
      _$UserFriendImpl _value, $Res Function(_$UserFriendImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = freezed,
  }) {
    return _then(_$UserFriendImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserFriendImpl implements _UserFriend {
  _$UserFriendImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.name,
      required this.avatar});

  factory _$UserFriendImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserFriendImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String name;
  @override
  final dynamic avatar;

  @override
  String toString() {
    return 'UserFriend(id: $id, name: $name, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserFriendImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.avatar, avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(avatar));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserFriendImplCopyWith<_$UserFriendImpl> get copyWith =>
      __$$UserFriendImplCopyWithImpl<_$UserFriendImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserFriendImplToJson(
      this,
    );
  }
}

abstract class _UserFriend implements UserFriend {
  factory _UserFriend(
      {@JsonKey(name: "_id") required final String id,
      required final String name,
      required final dynamic avatar}) = _$UserFriendImpl;

  factory _UserFriend.fromJson(Map<String, dynamic> json) =
      _$UserFriendImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get name;
  @override
  dynamic get avatar;
  @override
  @JsonKey(ignore: true)
  _$$UserFriendImplCopyWith<_$UserFriendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Friend _$FriendFromJson(Map<String, dynamic> json) {
  return _Friend.fromJson(json);
}

/// @nodoc
mixin _$Friend {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  UserFriend get user => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendCopyWith<Friend> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendCopyWith<$Res> {
  factory $FriendCopyWith(Friend value, $Res Function(Friend) then) =
      _$FriendCopyWithImpl<$Res, Friend>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id, UserFriend user, String updatedAt});

  $UserFriendCopyWith<$Res> get user;
}

/// @nodoc
class _$FriendCopyWithImpl<$Res, $Val extends Friend>
    implements $FriendCopyWith<$Res> {
  _$FriendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserFriend,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserFriendCopyWith<$Res> get user {
    return $UserFriendCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FriendImplCopyWith<$Res> implements $FriendCopyWith<$Res> {
  factory _$$FriendImplCopyWith(
          _$FriendImpl value, $Res Function(_$FriendImpl) then) =
      __$$FriendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id, UserFriend user, String updatedAt});

  @override
  $UserFriendCopyWith<$Res> get user;
}

/// @nodoc
class __$$FriendImplCopyWithImpl<$Res>
    extends _$FriendCopyWithImpl<$Res, _$FriendImpl>
    implements _$$FriendImplCopyWith<$Res> {
  __$$FriendImplCopyWithImpl(
      _$FriendImpl _value, $Res Function(_$FriendImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? updatedAt = null,
  }) {
    return _then(_$FriendImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserFriend,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendImpl implements _Friend {
  _$FriendImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.user,
      required this.updatedAt});

  factory _$FriendImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final UserFriend user;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'Friend(id: $id, user: $user, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendImplCopyWith<_$FriendImpl> get copyWith =>
      __$$FriendImplCopyWithImpl<_$FriendImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendImplToJson(
      this,
    );
  }
}

abstract class _Friend implements Friend {
  factory _Friend(
      {@JsonKey(name: "_id") required final String id,
      required final UserFriend user,
      required final String updatedAt}) = _$FriendImpl;

  factory _Friend.fromJson(Map<String, dynamic> json) = _$FriendImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  UserFriend get user;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$FriendImplCopyWith<_$FriendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
