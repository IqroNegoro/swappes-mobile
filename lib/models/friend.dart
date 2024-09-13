import 'package:freezed_annotation/freezed_annotation.dart';

part "friend.freezed.dart";
part "friend.g.dart";

enum FriendStatus { unfriend, friend }

@freezed
class UserFriend with _$UserFriend {
  factory UserFriend(
      {
      @JsonKey(name: "_id") required final String id,
      required final String name,
      required final dynamic avatar}) = _UserFriend;

  factory UserFriend.fromJson(Map<String, dynamic> json) =>
      _$UserFriendFromJson(json);
}

@freezed
class Friend with _$Friend {
  factory Friend({
    @JsonKey(name: "_id") required final String id,
    required final UserFriend user,
    required final String updatedAt,
  }) = _Friend;

  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);
}
