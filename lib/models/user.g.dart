// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      avatar: Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
      banner: json['banner'],
      friends: (json['friends'] as num?)?.toInt() ?? 0,
      isFriend: json['isFriend'],
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'banner': instance.banner,
      'friends': instance.friends,
      'isFriend': instance.isFriend,
    };
