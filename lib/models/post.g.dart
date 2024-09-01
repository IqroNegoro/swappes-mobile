// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostModelImpl _$$PostModelImplFromJson(Map<String, dynamic> json) =>
    _$PostModelImpl(
      id: json['_id'] as String,
      description: json['description'] as String?,
      images: json['images'] as List<dynamic>? ?? const [],
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      likes: json['likes'] as List<dynamic>? ?? const [],
      comments: (json['comments'] as num?)?.toInt() ?? 0,
      bookmark: json['bookmark'],
      isShare: json['isShare'] as bool? ?? false,
      share: json['share'] == null
          ? null
          : PostModel.fromJson(json['share'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$PostModelImplToJson(_$PostModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'description': instance.description,
      'images': instance.images,
      'user': instance.user,
      'likes': instance.likes,
      'comments': instance.comments,
      'bookmark': instance.bookmark,
      'isShare': instance.isShare,
      'share': instance.share,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
