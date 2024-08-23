// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return _PostModel.fromJson(json);
}

/// @nodoc
mixin _$PostModel {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<dynamic> get images => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  List<dynamic> get likes => throw _privateConstructorUsedError;
  int get comments => throw _privateConstructorUsedError;
  bool get isShare => throw _privateConstructorUsedError;
  PostModel? get share => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostModelCopyWith<PostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostModelCopyWith<$Res> {
  factory $PostModelCopyWith(PostModel value, $Res Function(PostModel) then) =
      _$PostModelCopyWithImpl<$Res, PostModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String? description,
      List<dynamic> images,
      User user,
      List<dynamic> likes,
      int comments,
      bool isShare,
      PostModel? share,
      String createdAt,
      String updatedAt});

  $UserCopyWith<$Res> get user;
  $PostModelCopyWith<$Res>? get share;
}

/// @nodoc
class _$PostModelCopyWithImpl<$Res, $Val extends PostModel>
    implements $PostModelCopyWith<$Res> {
  _$PostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = freezed,
    Object? images = null,
    Object? user = null,
    Object? likes = null,
    Object? comments = null,
    Object? isShare = null,
    Object? share = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      isShare: null == isShare
          ? _value.isShare
          : isShare // ignore: cast_nullable_to_non_nullable
              as bool,
      share: freezed == share
          ? _value.share
          : share // ignore: cast_nullable_to_non_nullable
              as PostModel?,
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

  @override
  @pragma('vm:prefer-inline')
  $PostModelCopyWith<$Res>? get share {
    if (_value.share == null) {
      return null;
    }

    return $PostModelCopyWith<$Res>(_value.share!, (value) {
      return _then(_value.copyWith(share: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostModelImplCopyWith<$Res>
    implements $PostModelCopyWith<$Res> {
  factory _$$PostModelImplCopyWith(
          _$PostModelImpl value, $Res Function(_$PostModelImpl) then) =
      __$$PostModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String? description,
      List<dynamic> images,
      User user,
      List<dynamic> likes,
      int comments,
      bool isShare,
      PostModel? share,
      String createdAt,
      String updatedAt});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $PostModelCopyWith<$Res>? get share;
}

/// @nodoc
class __$$PostModelImplCopyWithImpl<$Res>
    extends _$PostModelCopyWithImpl<$Res, _$PostModelImpl>
    implements _$$PostModelImplCopyWith<$Res> {
  __$$PostModelImplCopyWithImpl(
      _$PostModelImpl _value, $Res Function(_$PostModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = freezed,
    Object? images = null,
    Object? user = null,
    Object? likes = null,
    Object? comments = null,
    Object? isShare = null,
    Object? share = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$PostModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      likes: null == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      isShare: null == isShare
          ? _value.isShare
          : isShare // ignore: cast_nullable_to_non_nullable
              as bool,
      share: freezed == share
          ? _value.share
          : share // ignore: cast_nullable_to_non_nullable
              as PostModel?,
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
final class _$PostModelImpl implements _PostModel {
  _$PostModelImpl(
      {@JsonKey(name: "_id") required this.id,
      this.description,
      required final List<dynamic> images,
      required this.user,
      final List<dynamic> likes = const [],
      this.comments = 0,
      this.isShare = false,
      required this.share,
      required this.createdAt,
      required this.updatedAt})
      : _images = images,
        _likes = likes;

  factory _$PostModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostModelImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String? description;
  final List<dynamic> _images;
  @override
  List<dynamic> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final User user;
  final List<dynamic> _likes;
  @override
  @JsonKey()
  List<dynamic> get likes {
    if (_likes is EqualUnmodifiableListView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likes);
  }

  @override
  @JsonKey()
  final int comments;
  @override
  @JsonKey()
  final bool isShare;
  @override
  final PostModel? share;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'PostModel(id: $id, description: $description, images: $images, user: $user, likes: $likes, comments: $comments, isShare: $isShare, share: $share, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._likes, _likes) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.isShare, isShare) || other.isShare == isShare) &&
            (identical(other.share, share) || other.share == share) &&
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
      description,
      const DeepCollectionEquality().hash(_images),
      user,
      const DeepCollectionEquality().hash(_likes),
      comments,
      isShare,
      share,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostModelImplCopyWith<_$PostModelImpl> get copyWith =>
      __$$PostModelImplCopyWithImpl<_$PostModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostModelImplToJson(
      this,
    );
  }
}

abstract final class _PostModel implements PostModel {
  factory _PostModel(
      {@JsonKey(name: "_id") required final String id,
      final String? description,
      required final List<dynamic> images,
      required final User user,
      final List<dynamic> likes,
      final int comments,
      final bool isShare,
      required final PostModel? share,
      required final String createdAt,
      required final String updatedAt}) = _$PostModelImpl;

  factory _PostModel.fromJson(Map<String, dynamic> json) =
      _$PostModelImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String? get description;
  @override
  List<dynamic> get images;
  @override
  User get user;
  @override
  List<dynamic> get likes;
  @override
  int get comments;
  @override
  bool get isShare;
  @override
  PostModel? get share;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$PostModelImplCopyWith<_$PostModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
