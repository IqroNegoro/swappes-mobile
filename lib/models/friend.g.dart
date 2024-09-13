// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserFriendImpl _$$UserFriendImplFromJson(Map<String, dynamic> json) =>
    _$UserFriendImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      avatar: json['avatar'],
    );

Map<String, dynamic> _$$UserFriendImplToJson(_$UserFriendImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
    };

_$FriendImpl _$$FriendImplFromJson(Map<String, dynamic> json) => _$FriendImpl(
      id: json['_id'] as String,
      user: UserFriend.fromJson(json['user'] as Map<String, dynamic>),
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$FriendImplToJson(_$FriendImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'updatedAt': instance.updatedAt,
    };
