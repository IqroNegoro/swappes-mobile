// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return _CommentModel.fromJson(json);
}

/// @nodoc
mixin _$CommentModel {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  dynamic get image => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  String get post => throw _privateConstructorUsedError;
  List<CommentModel> get reply => throw _privateConstructorUsedError;
  String? get replyId => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentModelCopyWith<CommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentModelCopyWith<$Res> {
  factory $CommentModelCopyWith(
          CommentModel value, $Res Function(CommentModel) then) =
      _$CommentModelCopyWithImpl<$Res, CommentModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String? comment,
      dynamic image,
      User user,
      String post,
      List<CommentModel> reply,
      String? replyId,
      String createdAt,
      String updatedAt});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$CommentModelCopyWithImpl<$Res, $Val extends CommentModel>
    implements $CommentModelCopyWith<$Res> {
  _$CommentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? comment = freezed,
    Object? image = freezed,
    Object? user = null,
    Object? post = null,
    Object? reply = null,
    Object? replyId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as dynamic,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as String,
      reply: null == reply
          ? _value.reply
          : reply // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>,
      replyId: freezed == replyId
          ? _value.replyId
          : replyId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommentModelImplCopyWith<$Res>
    implements $CommentModelCopyWith<$Res> {
  factory _$$CommentModelImplCopyWith(
          _$CommentModelImpl value, $Res Function(_$CommentModelImpl) then) =
      __$$CommentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String? comment,
      dynamic image,
      User user,
      String post,
      List<CommentModel> reply,
      String? replyId,
      String createdAt,
      String updatedAt});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$CommentModelImplCopyWithImpl<$Res>
    extends _$CommentModelCopyWithImpl<$Res, _$CommentModelImpl>
    implements _$$CommentModelImplCopyWith<$Res> {
  __$$CommentModelImplCopyWithImpl(
      _$CommentModelImpl _value, $Res Function(_$CommentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? comment = freezed,
    Object? image = freezed,
    Object? user = null,
    Object? post = null,
    Object? reply = null,
    Object? replyId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$CommentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as dynamic,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as String,
      reply: null == reply
          ? _value.reply
          : reply // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>,
      replyId: freezed == replyId
          ? _value.replyId
          : replyId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
final class _$CommentModelImpl implements _CommentModel {
  _$CommentModelImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.comment,
      required this.image,
      required this.user,
      required this.post,
      this.reply = const [],
      required this.replyId,
      required this.createdAt,
      required this.updatedAt});

  factory _$CommentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentModelImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String? comment;
  @override
  final dynamic image;
  @override
  final User user;
  @override
  final String post;
  @override
  @JsonKey()
  final List<CommentModel> reply;
  @override
  final String? replyId;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'CommentModel(id: $id, comment: $comment, image: $image, user: $user, post: $post, reply: $reply, replyId: $replyId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.post, post) || other.post == post) &&
            const DeepCollectionEquality().equals(other.reply, reply) &&
            (identical(other.replyId, replyId) || other.replyId == replyId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      comment,
      const DeepCollectionEquality().hash(image),
      user,
      post,
      const DeepCollectionEquality().hash(reply),
      replyId,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentModelImplCopyWith<_$CommentModelImpl> get copyWith =>
      __$$CommentModelImplCopyWithImpl<_$CommentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentModelImplToJson(
      this,
    );
  }
}

abstract final class _CommentModel implements CommentModel {
  factory _CommentModel(
      {@JsonKey(name: "_id") required final String id,
      required final String? comment,
      required final dynamic image,
      required final User user,
      required final String post,
      final List<CommentModel> reply,
      required final String? replyId,
      required final String createdAt,
      required final String updatedAt}) = _$CommentModelImpl;

  factory _CommentModel.fromJson(Map<String, dynamic> json) =
      _$CommentModelImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String? get comment;
  @override
  dynamic get image;
  @override
  User get user;
  @override
  String get post;
  @override
  List<CommentModel> get reply;
  @override
  String? get replyId;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$CommentModelImplCopyWith<_$CommentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
