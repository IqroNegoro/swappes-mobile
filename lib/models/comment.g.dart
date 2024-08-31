// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentModelImpl _$$CommentModelImplFromJson(Map<String, dynamic> json) =>
    _$CommentModelImpl(
      id: json['_id'] as String,
      comment: json['comment'] as String?,
      image: json['image'],
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      post: json['post'] as String,
      reply: (json['reply'] as List<dynamic>?)
              ?.map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      replyId: json['replyId'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$CommentModelImplToJson(_$CommentModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'comment': instance.comment,
      'image': instance.image,
      'user': instance.user,
      'post': instance.post,
      'reply': instance.reply,
      'replyId': instance.replyId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
