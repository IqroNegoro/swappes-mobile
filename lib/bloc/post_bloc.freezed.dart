// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PostEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadPost,
    required TResult Function(String id) likePost,
    required TResult Function(String? description, List<File>? images)
        createPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadPost,
    TResult? Function(String id)? likePost,
    TResult? Function(String? description, List<File>? images)? createPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadPost,
    TResult Function(String id)? likePost,
    TResult Function(String? description, List<File>? images)? createPost,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadPost value) loadPost,
    required TResult Function(_LikePost value) likePost,
    required TResult Function(_CreatePost value) createPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadPost value)? loadPost,
    TResult? Function(_LikePost value)? likePost,
    TResult? Function(_CreatePost value)? createPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadPost value)? loadPost,
    TResult Function(_LikePost value)? likePost,
    TResult Function(_CreatePost value)? createPost,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostEventCopyWith<$Res> {
  factory $PostEventCopyWith(PostEvent value, $Res Function(PostEvent) then) =
      _$PostEventCopyWithImpl<$Res, PostEvent>;
}

/// @nodoc
class _$PostEventCopyWithImpl<$Res, $Val extends PostEvent>
    implements $PostEventCopyWith<$Res> {
  _$PostEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadPostImplCopyWith<$Res> {
  factory _$$LoadPostImplCopyWith(
          _$LoadPostImpl value, $Res Function(_$LoadPostImpl) then) =
      __$$LoadPostImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadPostImplCopyWithImpl<$Res>
    extends _$PostEventCopyWithImpl<$Res, _$LoadPostImpl>
    implements _$$LoadPostImplCopyWith<$Res> {
  __$$LoadPostImplCopyWithImpl(
      _$LoadPostImpl _value, $Res Function(_$LoadPostImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadPostImpl implements _LoadPost {
  const _$LoadPostImpl();

  @override
  String toString() {
    return 'PostEvent.loadPost()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadPostImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadPost,
    required TResult Function(String id) likePost,
    required TResult Function(String? description, List<File>? images)
        createPost,
  }) {
    return loadPost();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadPost,
    TResult? Function(String id)? likePost,
    TResult? Function(String? description, List<File>? images)? createPost,
  }) {
    return loadPost?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadPost,
    TResult Function(String id)? likePost,
    TResult Function(String? description, List<File>? images)? createPost,
    required TResult orElse(),
  }) {
    if (loadPost != null) {
      return loadPost();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadPost value) loadPost,
    required TResult Function(_LikePost value) likePost,
    required TResult Function(_CreatePost value) createPost,
  }) {
    return loadPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadPost value)? loadPost,
    TResult? Function(_LikePost value)? likePost,
    TResult? Function(_CreatePost value)? createPost,
  }) {
    return loadPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadPost value)? loadPost,
    TResult Function(_LikePost value)? likePost,
    TResult Function(_CreatePost value)? createPost,
    required TResult orElse(),
  }) {
    if (loadPost != null) {
      return loadPost(this);
    }
    return orElse();
  }
}

abstract class _LoadPost implements PostEvent {
  const factory _LoadPost() = _$LoadPostImpl;
}

/// @nodoc
abstract class _$$LikePostImplCopyWith<$Res> {
  factory _$$LikePostImplCopyWith(
          _$LikePostImpl value, $Res Function(_$LikePostImpl) then) =
      __$$LikePostImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$LikePostImplCopyWithImpl<$Res>
    extends _$PostEventCopyWithImpl<$Res, _$LikePostImpl>
    implements _$$LikePostImplCopyWith<$Res> {
  __$$LikePostImplCopyWithImpl(
      _$LikePostImpl _value, $Res Function(_$LikePostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$LikePostImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LikePostImpl implements _LikePost {
  const _$LikePostImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'PostEvent.likePost(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikePostImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LikePostImplCopyWith<_$LikePostImpl> get copyWith =>
      __$$LikePostImplCopyWithImpl<_$LikePostImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadPost,
    required TResult Function(String id) likePost,
    required TResult Function(String? description, List<File>? images)
        createPost,
  }) {
    return likePost(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadPost,
    TResult? Function(String id)? likePost,
    TResult? Function(String? description, List<File>? images)? createPost,
  }) {
    return likePost?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadPost,
    TResult Function(String id)? likePost,
    TResult Function(String? description, List<File>? images)? createPost,
    required TResult orElse(),
  }) {
    if (likePost != null) {
      return likePost(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadPost value) loadPost,
    required TResult Function(_LikePost value) likePost,
    required TResult Function(_CreatePost value) createPost,
  }) {
    return likePost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadPost value)? loadPost,
    TResult? Function(_LikePost value)? likePost,
    TResult? Function(_CreatePost value)? createPost,
  }) {
    return likePost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadPost value)? loadPost,
    TResult Function(_LikePost value)? likePost,
    TResult Function(_CreatePost value)? createPost,
    required TResult orElse(),
  }) {
    if (likePost != null) {
      return likePost(this);
    }
    return orElse();
  }
}

abstract class _LikePost implements PostEvent {
  const factory _LikePost(final String id) = _$LikePostImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$LikePostImplCopyWith<_$LikePostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreatePostImplCopyWith<$Res> {
  factory _$$CreatePostImplCopyWith(
          _$CreatePostImpl value, $Res Function(_$CreatePostImpl) then) =
      __$$CreatePostImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? description, List<File>? images});
}

/// @nodoc
class __$$CreatePostImplCopyWithImpl<$Res>
    extends _$PostEventCopyWithImpl<$Res, _$CreatePostImpl>
    implements _$$CreatePostImplCopyWith<$Res> {
  __$$CreatePostImplCopyWithImpl(
      _$CreatePostImpl _value, $Res Function(_$CreatePostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? images = freezed,
  }) {
    return _then(_$CreatePostImpl(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<File>?,
    ));
  }
}

/// @nodoc

class _$CreatePostImpl implements _CreatePost {
  const _$CreatePostImpl({this.description, final List<File>? images})
      : _images = images;

  @override
  final String? description;
  final List<File>? _images;
  @override
  List<File>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PostEvent.createPost(description: $description, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePostImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, description, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePostImplCopyWith<_$CreatePostImpl> get copyWith =>
      __$$CreatePostImplCopyWithImpl<_$CreatePostImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadPost,
    required TResult Function(String id) likePost,
    required TResult Function(String? description, List<File>? images)
        createPost,
  }) {
    return createPost(description, images);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadPost,
    TResult? Function(String id)? likePost,
    TResult? Function(String? description, List<File>? images)? createPost,
  }) {
    return createPost?.call(description, images);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadPost,
    TResult Function(String id)? likePost,
    TResult Function(String? description, List<File>? images)? createPost,
    required TResult orElse(),
  }) {
    if (createPost != null) {
      return createPost(description, images);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadPost value) loadPost,
    required TResult Function(_LikePost value) likePost,
    required TResult Function(_CreatePost value) createPost,
  }) {
    return createPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadPost value)? loadPost,
    TResult? Function(_LikePost value)? likePost,
    TResult? Function(_CreatePost value)? createPost,
  }) {
    return createPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadPost value)? loadPost,
    TResult Function(_LikePost value)? likePost,
    TResult Function(_CreatePost value)? createPost,
    required TResult orElse(),
  }) {
    if (createPost != null) {
      return createPost(this);
    }
    return orElse();
  }
}

abstract class _CreatePost implements PostEvent {
  const factory _CreatePost(
      {final String? description, final List<File>? images}) = _$CreatePostImpl;

  String? get description;
  List<File>? get images;
  @JsonKey(ignore: true)
  _$$CreatePostImplCopyWith<_$CreatePostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PostState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() postLoading,
    required TResult Function(List<PostModel> posts) postLoaded,
    required TResult Function(dynamic errors) postError,
    required TResult Function(String? id) postLiking,
    required TResult Function() postLiked,
    required TResult Function() creatingPost,
    required TResult Function() postCreated,
    required TResult Function(dynamic errors) createPostError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? postLoading,
    TResult? Function(List<PostModel> posts)? postLoaded,
    TResult? Function(dynamic errors)? postError,
    TResult? Function(String? id)? postLiking,
    TResult? Function()? postLiked,
    TResult? Function()? creatingPost,
    TResult? Function()? postCreated,
    TResult? Function(dynamic errors)? createPostError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? postLoading,
    TResult Function(List<PostModel> posts)? postLoaded,
    TResult Function(dynamic errors)? postError,
    TResult Function(String? id)? postLiking,
    TResult Function()? postLiked,
    TResult Function()? creatingPost,
    TResult Function()? postCreated,
    TResult Function(dynamic errors)? createPostError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PostLoading value) postLoading,
    required TResult Function(_PostLoaded value) postLoaded,
    required TResult Function(_PostError value) postError,
    required TResult Function(_PostLiking value) postLiking,
    required TResult Function(_PostLiked value) postLiked,
    required TResult Function(_CreatingPost value) creatingPost,
    required TResult Function(_PostCreated value) postCreated,
    required TResult Function(_CreatePostError value) createPostError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PostLoading value)? postLoading,
    TResult? Function(_PostLoaded value)? postLoaded,
    TResult? Function(_PostError value)? postError,
    TResult? Function(_PostLiking value)? postLiking,
    TResult? Function(_PostLiked value)? postLiked,
    TResult? Function(_CreatingPost value)? creatingPost,
    TResult? Function(_PostCreated value)? postCreated,
    TResult? Function(_CreatePostError value)? createPostError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PostLoading value)? postLoading,
    TResult Function(_PostLoaded value)? postLoaded,
    TResult Function(_PostError value)? postError,
    TResult Function(_PostLiking value)? postLiking,
    TResult Function(_PostLiked value)? postLiked,
    TResult Function(_CreatingPost value)? creatingPost,
    TResult Function(_PostCreated value)? postCreated,
    TResult Function(_CreatePostError value)? createPostError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostStateCopyWith<$Res> {
  factory $PostStateCopyWith(PostState value, $Res Function(PostState) then) =
      _$PostStateCopyWithImpl<$Res, PostState>;
}

/// @nodoc
class _$PostStateCopyWithImpl<$Res, $Val extends PostState>
    implements $PostStateCopyWith<$Res> {
  _$PostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PostState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() postLoading,
    required TResult Function(List<PostModel> posts) postLoaded,
    required TResult Function(dynamic errors) postError,
    required TResult Function(String? id) postLiking,
    required TResult Function() postLiked,
    required TResult Function() creatingPost,
    required TResult Function() postCreated,
    required TResult Function(dynamic errors) createPostError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? postLoading,
    TResult? Function(List<PostModel> posts)? postLoaded,
    TResult? Function(dynamic errors)? postError,
    TResult? Function(String? id)? postLiking,
    TResult? Function()? postLiked,
    TResult? Function()? creatingPost,
    TResult? Function()? postCreated,
    TResult? Function(dynamic errors)? createPostError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? postLoading,
    TResult Function(List<PostModel> posts)? postLoaded,
    TResult Function(dynamic errors)? postError,
    TResult Function(String? id)? postLiking,
    TResult Function()? postLiked,
    TResult Function()? creatingPost,
    TResult Function()? postCreated,
    TResult Function(dynamic errors)? createPostError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PostLoading value) postLoading,
    required TResult Function(_PostLoaded value) postLoaded,
    required TResult Function(_PostError value) postError,
    required TResult Function(_PostLiking value) postLiking,
    required TResult Function(_PostLiked value) postLiked,
    required TResult Function(_CreatingPost value) creatingPost,
    required TResult Function(_PostCreated value) postCreated,
    required TResult Function(_CreatePostError value) createPostError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PostLoading value)? postLoading,
    TResult? Function(_PostLoaded value)? postLoaded,
    TResult? Function(_PostError value)? postError,
    TResult? Function(_PostLiking value)? postLiking,
    TResult? Function(_PostLiked value)? postLiked,
    TResult? Function(_CreatingPost value)? creatingPost,
    TResult? Function(_PostCreated value)? postCreated,
    TResult? Function(_CreatePostError value)? createPostError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PostLoading value)? postLoading,
    TResult Function(_PostLoaded value)? postLoaded,
    TResult Function(_PostError value)? postError,
    TResult Function(_PostLiking value)? postLiking,
    TResult Function(_PostLiked value)? postLiked,
    TResult Function(_CreatingPost value)? creatingPost,
    TResult Function(_PostCreated value)? postCreated,
    TResult Function(_CreatePostError value)? createPostError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PostState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$PostLoadingImplCopyWith<$Res> {
  factory _$$PostLoadingImplCopyWith(
          _$PostLoadingImpl value, $Res Function(_$PostLoadingImpl) then) =
      __$$PostLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostLoadingImplCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$PostLoadingImpl>
    implements _$$PostLoadingImplCopyWith<$Res> {
  __$$PostLoadingImplCopyWithImpl(
      _$PostLoadingImpl _value, $Res Function(_$PostLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PostLoadingImpl implements _PostLoading {
  const _$PostLoadingImpl();

  @override
  String toString() {
    return 'PostState.postLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PostLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() postLoading,
    required TResult Function(List<PostModel> posts) postLoaded,
    required TResult Function(dynamic errors) postError,
    required TResult Function(String? id) postLiking,
    required TResult Function() postLiked,
    required TResult Function() creatingPost,
    required TResult Function() postCreated,
    required TResult Function(dynamic errors) createPostError,
  }) {
    return postLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? postLoading,
    TResult? Function(List<PostModel> posts)? postLoaded,
    TResult? Function(dynamic errors)? postError,
    TResult? Function(String? id)? postLiking,
    TResult? Function()? postLiked,
    TResult? Function()? creatingPost,
    TResult? Function()? postCreated,
    TResult? Function(dynamic errors)? createPostError,
  }) {
    return postLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? postLoading,
    TResult Function(List<PostModel> posts)? postLoaded,
    TResult Function(dynamic errors)? postError,
    TResult Function(String? id)? postLiking,
    TResult Function()? postLiked,
    TResult Function()? creatingPost,
    TResult Function()? postCreated,
    TResult Function(dynamic errors)? createPostError,
    required TResult orElse(),
  }) {
    if (postLoading != null) {
      return postLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PostLoading value) postLoading,
    required TResult Function(_PostLoaded value) postLoaded,
    required TResult Function(_PostError value) postError,
    required TResult Function(_PostLiking value) postLiking,
    required TResult Function(_PostLiked value) postLiked,
    required TResult Function(_CreatingPost value) creatingPost,
    required TResult Function(_PostCreated value) postCreated,
    required TResult Function(_CreatePostError value) createPostError,
  }) {
    return postLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PostLoading value)? postLoading,
    TResult? Function(_PostLoaded value)? postLoaded,
    TResult? Function(_PostError value)? postError,
    TResult? Function(_PostLiking value)? postLiking,
    TResult? Function(_PostLiked value)? postLiked,
    TResult? Function(_CreatingPost value)? creatingPost,
    TResult? Function(_PostCreated value)? postCreated,
    TResult? Function(_CreatePostError value)? createPostError,
  }) {
    return postLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PostLoading value)? postLoading,
    TResult Function(_PostLoaded value)? postLoaded,
    TResult Function(_PostError value)? postError,
    TResult Function(_PostLiking value)? postLiking,
    TResult Function(_PostLiked value)? postLiked,
    TResult Function(_CreatingPost value)? creatingPost,
    TResult Function(_PostCreated value)? postCreated,
    TResult Function(_CreatePostError value)? createPostError,
    required TResult orElse(),
  }) {
    if (postLoading != null) {
      return postLoading(this);
    }
    return orElse();
  }
}

abstract class _PostLoading implements PostState {
  const factory _PostLoading() = _$PostLoadingImpl;
}

/// @nodoc
abstract class _$$PostLoadedImplCopyWith<$Res> {
  factory _$$PostLoadedImplCopyWith(
          _$PostLoadedImpl value, $Res Function(_$PostLoadedImpl) then) =
      __$$PostLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PostModel> posts});
}

/// @nodoc
class __$$PostLoadedImplCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$PostLoadedImpl>
    implements _$$PostLoadedImplCopyWith<$Res> {
  __$$PostLoadedImplCopyWithImpl(
      _$PostLoadedImpl _value, $Res Function(_$PostLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
  }) {
    return _then(_$PostLoadedImpl(
      null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostModel>,
    ));
  }
}

/// @nodoc

class _$PostLoadedImpl implements _PostLoaded {
  const _$PostLoadedImpl(final List<PostModel> posts) : _posts = posts;

  final List<PostModel> _posts;
  @override
  List<PostModel> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  String toString() {
    return 'PostState.postLoaded(posts: $posts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostLoadedImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_posts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostLoadedImplCopyWith<_$PostLoadedImpl> get copyWith =>
      __$$PostLoadedImplCopyWithImpl<_$PostLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() postLoading,
    required TResult Function(List<PostModel> posts) postLoaded,
    required TResult Function(dynamic errors) postError,
    required TResult Function(String? id) postLiking,
    required TResult Function() postLiked,
    required TResult Function() creatingPost,
    required TResult Function() postCreated,
    required TResult Function(dynamic errors) createPostError,
  }) {
    return postLoaded(posts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? postLoading,
    TResult? Function(List<PostModel> posts)? postLoaded,
    TResult? Function(dynamic errors)? postError,
    TResult? Function(String? id)? postLiking,
    TResult? Function()? postLiked,
    TResult? Function()? creatingPost,
    TResult? Function()? postCreated,
    TResult? Function(dynamic errors)? createPostError,
  }) {
    return postLoaded?.call(posts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? postLoading,
    TResult Function(List<PostModel> posts)? postLoaded,
    TResult Function(dynamic errors)? postError,
    TResult Function(String? id)? postLiking,
    TResult Function()? postLiked,
    TResult Function()? creatingPost,
    TResult Function()? postCreated,
    TResult Function(dynamic errors)? createPostError,
    required TResult orElse(),
  }) {
    if (postLoaded != null) {
      return postLoaded(posts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PostLoading value) postLoading,
    required TResult Function(_PostLoaded value) postLoaded,
    required TResult Function(_PostError value) postError,
    required TResult Function(_PostLiking value) postLiking,
    required TResult Function(_PostLiked value) postLiked,
    required TResult Function(_CreatingPost value) creatingPost,
    required TResult Function(_PostCreated value) postCreated,
    required TResult Function(_CreatePostError value) createPostError,
  }) {
    return postLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PostLoading value)? postLoading,
    TResult? Function(_PostLoaded value)? postLoaded,
    TResult? Function(_PostError value)? postError,
    TResult? Function(_PostLiking value)? postLiking,
    TResult? Function(_PostLiked value)? postLiked,
    TResult? Function(_CreatingPost value)? creatingPost,
    TResult? Function(_PostCreated value)? postCreated,
    TResult? Function(_CreatePostError value)? createPostError,
  }) {
    return postLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PostLoading value)? postLoading,
    TResult Function(_PostLoaded value)? postLoaded,
    TResult Function(_PostError value)? postError,
    TResult Function(_PostLiking value)? postLiking,
    TResult Function(_PostLiked value)? postLiked,
    TResult Function(_CreatingPost value)? creatingPost,
    TResult Function(_PostCreated value)? postCreated,
    TResult Function(_CreatePostError value)? createPostError,
    required TResult orElse(),
  }) {
    if (postLoaded != null) {
      return postLoaded(this);
    }
    return orElse();
  }
}

abstract class _PostLoaded implements PostState {
  const factory _PostLoaded(final List<PostModel> posts) = _$PostLoadedImpl;

  List<PostModel> get posts;
  @JsonKey(ignore: true)
  _$$PostLoadedImplCopyWith<_$PostLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostErrorImplCopyWith<$Res> {
  factory _$$PostErrorImplCopyWith(
          _$PostErrorImpl value, $Res Function(_$PostErrorImpl) then) =
      __$$PostErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic errors});
}

/// @nodoc
class __$$PostErrorImplCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$PostErrorImpl>
    implements _$$PostErrorImplCopyWith<$Res> {
  __$$PostErrorImplCopyWithImpl(
      _$PostErrorImpl _value, $Res Function(_$PostErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = freezed,
  }) {
    return _then(_$PostErrorImpl(
      freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$PostErrorImpl implements _PostError {
  const _$PostErrorImpl(this.errors);

  @override
  final dynamic errors;

  @override
  String toString() {
    return 'PostState.postError(errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostErrorImpl &&
            const DeepCollectionEquality().equals(other.errors, errors));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostErrorImplCopyWith<_$PostErrorImpl> get copyWith =>
      __$$PostErrorImplCopyWithImpl<_$PostErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() postLoading,
    required TResult Function(List<PostModel> posts) postLoaded,
    required TResult Function(dynamic errors) postError,
    required TResult Function(String? id) postLiking,
    required TResult Function() postLiked,
    required TResult Function() creatingPost,
    required TResult Function() postCreated,
    required TResult Function(dynamic errors) createPostError,
  }) {
    return postError(errors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? postLoading,
    TResult? Function(List<PostModel> posts)? postLoaded,
    TResult? Function(dynamic errors)? postError,
    TResult? Function(String? id)? postLiking,
    TResult? Function()? postLiked,
    TResult? Function()? creatingPost,
    TResult? Function()? postCreated,
    TResult? Function(dynamic errors)? createPostError,
  }) {
    return postError?.call(errors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? postLoading,
    TResult Function(List<PostModel> posts)? postLoaded,
    TResult Function(dynamic errors)? postError,
    TResult Function(String? id)? postLiking,
    TResult Function()? postLiked,
    TResult Function()? creatingPost,
    TResult Function()? postCreated,
    TResult Function(dynamic errors)? createPostError,
    required TResult orElse(),
  }) {
    if (postError != null) {
      return postError(errors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PostLoading value) postLoading,
    required TResult Function(_PostLoaded value) postLoaded,
    required TResult Function(_PostError value) postError,
    required TResult Function(_PostLiking value) postLiking,
    required TResult Function(_PostLiked value) postLiked,
    required TResult Function(_CreatingPost value) creatingPost,
    required TResult Function(_PostCreated value) postCreated,
    required TResult Function(_CreatePostError value) createPostError,
  }) {
    return postError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PostLoading value)? postLoading,
    TResult? Function(_PostLoaded value)? postLoaded,
    TResult? Function(_PostError value)? postError,
    TResult? Function(_PostLiking value)? postLiking,
    TResult? Function(_PostLiked value)? postLiked,
    TResult? Function(_CreatingPost value)? creatingPost,
    TResult? Function(_PostCreated value)? postCreated,
    TResult? Function(_CreatePostError value)? createPostError,
  }) {
    return postError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PostLoading value)? postLoading,
    TResult Function(_PostLoaded value)? postLoaded,
    TResult Function(_PostError value)? postError,
    TResult Function(_PostLiking value)? postLiking,
    TResult Function(_PostLiked value)? postLiked,
    TResult Function(_CreatingPost value)? creatingPost,
    TResult Function(_PostCreated value)? postCreated,
    TResult Function(_CreatePostError value)? createPostError,
    required TResult orElse(),
  }) {
    if (postError != null) {
      return postError(this);
    }
    return orElse();
  }
}

abstract class _PostError implements PostState {
  const factory _PostError(final dynamic errors) = _$PostErrorImpl;

  dynamic get errors;
  @JsonKey(ignore: true)
  _$$PostErrorImplCopyWith<_$PostErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostLikingImplCopyWith<$Res> {
  factory _$$PostLikingImplCopyWith(
          _$PostLikingImpl value, $Res Function(_$PostLikingImpl) then) =
      __$$PostLikingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? id});
}

/// @nodoc
class __$$PostLikingImplCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$PostLikingImpl>
    implements _$$PostLikingImplCopyWith<$Res> {
  __$$PostLikingImplCopyWithImpl(
      _$PostLikingImpl _value, $Res Function(_$PostLikingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$PostLikingImpl(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PostLikingImpl implements _PostLiking {
  const _$PostLikingImpl(this.id);

  @override
  final String? id;

  @override
  String toString() {
    return 'PostState.postLiking(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostLikingImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostLikingImplCopyWith<_$PostLikingImpl> get copyWith =>
      __$$PostLikingImplCopyWithImpl<_$PostLikingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() postLoading,
    required TResult Function(List<PostModel> posts) postLoaded,
    required TResult Function(dynamic errors) postError,
    required TResult Function(String? id) postLiking,
    required TResult Function() postLiked,
    required TResult Function() creatingPost,
    required TResult Function() postCreated,
    required TResult Function(dynamic errors) createPostError,
  }) {
    return postLiking(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? postLoading,
    TResult? Function(List<PostModel> posts)? postLoaded,
    TResult? Function(dynamic errors)? postError,
    TResult? Function(String? id)? postLiking,
    TResult? Function()? postLiked,
    TResult? Function()? creatingPost,
    TResult? Function()? postCreated,
    TResult? Function(dynamic errors)? createPostError,
  }) {
    return postLiking?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? postLoading,
    TResult Function(List<PostModel> posts)? postLoaded,
    TResult Function(dynamic errors)? postError,
    TResult Function(String? id)? postLiking,
    TResult Function()? postLiked,
    TResult Function()? creatingPost,
    TResult Function()? postCreated,
    TResult Function(dynamic errors)? createPostError,
    required TResult orElse(),
  }) {
    if (postLiking != null) {
      return postLiking(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PostLoading value) postLoading,
    required TResult Function(_PostLoaded value) postLoaded,
    required TResult Function(_PostError value) postError,
    required TResult Function(_PostLiking value) postLiking,
    required TResult Function(_PostLiked value) postLiked,
    required TResult Function(_CreatingPost value) creatingPost,
    required TResult Function(_PostCreated value) postCreated,
    required TResult Function(_CreatePostError value) createPostError,
  }) {
    return postLiking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PostLoading value)? postLoading,
    TResult? Function(_PostLoaded value)? postLoaded,
    TResult? Function(_PostError value)? postError,
    TResult? Function(_PostLiking value)? postLiking,
    TResult? Function(_PostLiked value)? postLiked,
    TResult? Function(_CreatingPost value)? creatingPost,
    TResult? Function(_PostCreated value)? postCreated,
    TResult? Function(_CreatePostError value)? createPostError,
  }) {
    return postLiking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PostLoading value)? postLoading,
    TResult Function(_PostLoaded value)? postLoaded,
    TResult Function(_PostError value)? postError,
    TResult Function(_PostLiking value)? postLiking,
    TResult Function(_PostLiked value)? postLiked,
    TResult Function(_CreatingPost value)? creatingPost,
    TResult Function(_PostCreated value)? postCreated,
    TResult Function(_CreatePostError value)? createPostError,
    required TResult orElse(),
  }) {
    if (postLiking != null) {
      return postLiking(this);
    }
    return orElse();
  }
}

abstract class _PostLiking implements PostState {
  const factory _PostLiking(final String? id) = _$PostLikingImpl;

  String? get id;
  @JsonKey(ignore: true)
  _$$PostLikingImplCopyWith<_$PostLikingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostLikedImplCopyWith<$Res> {
  factory _$$PostLikedImplCopyWith(
          _$PostLikedImpl value, $Res Function(_$PostLikedImpl) then) =
      __$$PostLikedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostLikedImplCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$PostLikedImpl>
    implements _$$PostLikedImplCopyWith<$Res> {
  __$$PostLikedImplCopyWithImpl(
      _$PostLikedImpl _value, $Res Function(_$PostLikedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PostLikedImpl implements _PostLiked {
  const _$PostLikedImpl();

  @override
  String toString() {
    return 'PostState.postLiked()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PostLikedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() postLoading,
    required TResult Function(List<PostModel> posts) postLoaded,
    required TResult Function(dynamic errors) postError,
    required TResult Function(String? id) postLiking,
    required TResult Function() postLiked,
    required TResult Function() creatingPost,
    required TResult Function() postCreated,
    required TResult Function(dynamic errors) createPostError,
  }) {
    return postLiked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? postLoading,
    TResult? Function(List<PostModel> posts)? postLoaded,
    TResult? Function(dynamic errors)? postError,
    TResult? Function(String? id)? postLiking,
    TResult? Function()? postLiked,
    TResult? Function()? creatingPost,
    TResult? Function()? postCreated,
    TResult? Function(dynamic errors)? createPostError,
  }) {
    return postLiked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? postLoading,
    TResult Function(List<PostModel> posts)? postLoaded,
    TResult Function(dynamic errors)? postError,
    TResult Function(String? id)? postLiking,
    TResult Function()? postLiked,
    TResult Function()? creatingPost,
    TResult Function()? postCreated,
    TResult Function(dynamic errors)? createPostError,
    required TResult orElse(),
  }) {
    if (postLiked != null) {
      return postLiked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PostLoading value) postLoading,
    required TResult Function(_PostLoaded value) postLoaded,
    required TResult Function(_PostError value) postError,
    required TResult Function(_PostLiking value) postLiking,
    required TResult Function(_PostLiked value) postLiked,
    required TResult Function(_CreatingPost value) creatingPost,
    required TResult Function(_PostCreated value) postCreated,
    required TResult Function(_CreatePostError value) createPostError,
  }) {
    return postLiked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PostLoading value)? postLoading,
    TResult? Function(_PostLoaded value)? postLoaded,
    TResult? Function(_PostError value)? postError,
    TResult? Function(_PostLiking value)? postLiking,
    TResult? Function(_PostLiked value)? postLiked,
    TResult? Function(_CreatingPost value)? creatingPost,
    TResult? Function(_PostCreated value)? postCreated,
    TResult? Function(_CreatePostError value)? createPostError,
  }) {
    return postLiked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PostLoading value)? postLoading,
    TResult Function(_PostLoaded value)? postLoaded,
    TResult Function(_PostError value)? postError,
    TResult Function(_PostLiking value)? postLiking,
    TResult Function(_PostLiked value)? postLiked,
    TResult Function(_CreatingPost value)? creatingPost,
    TResult Function(_PostCreated value)? postCreated,
    TResult Function(_CreatePostError value)? createPostError,
    required TResult orElse(),
  }) {
    if (postLiked != null) {
      return postLiked(this);
    }
    return orElse();
  }
}

abstract class _PostLiked implements PostState {
  const factory _PostLiked() = _$PostLikedImpl;
}

/// @nodoc
abstract class _$$CreatingPostImplCopyWith<$Res> {
  factory _$$CreatingPostImplCopyWith(
          _$CreatingPostImpl value, $Res Function(_$CreatingPostImpl) then) =
      __$$CreatingPostImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreatingPostImplCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$CreatingPostImpl>
    implements _$$CreatingPostImplCopyWith<$Res> {
  __$$CreatingPostImplCopyWithImpl(
      _$CreatingPostImpl _value, $Res Function(_$CreatingPostImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreatingPostImpl implements _CreatingPost {
  const _$CreatingPostImpl();

  @override
  String toString() {
    return 'PostState.creatingPost()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreatingPostImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() postLoading,
    required TResult Function(List<PostModel> posts) postLoaded,
    required TResult Function(dynamic errors) postError,
    required TResult Function(String? id) postLiking,
    required TResult Function() postLiked,
    required TResult Function() creatingPost,
    required TResult Function() postCreated,
    required TResult Function(dynamic errors) createPostError,
  }) {
    return creatingPost();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? postLoading,
    TResult? Function(List<PostModel> posts)? postLoaded,
    TResult? Function(dynamic errors)? postError,
    TResult? Function(String? id)? postLiking,
    TResult? Function()? postLiked,
    TResult? Function()? creatingPost,
    TResult? Function()? postCreated,
    TResult? Function(dynamic errors)? createPostError,
  }) {
    return creatingPost?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? postLoading,
    TResult Function(List<PostModel> posts)? postLoaded,
    TResult Function(dynamic errors)? postError,
    TResult Function(String? id)? postLiking,
    TResult Function()? postLiked,
    TResult Function()? creatingPost,
    TResult Function()? postCreated,
    TResult Function(dynamic errors)? createPostError,
    required TResult orElse(),
  }) {
    if (creatingPost != null) {
      return creatingPost();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PostLoading value) postLoading,
    required TResult Function(_PostLoaded value) postLoaded,
    required TResult Function(_PostError value) postError,
    required TResult Function(_PostLiking value) postLiking,
    required TResult Function(_PostLiked value) postLiked,
    required TResult Function(_CreatingPost value) creatingPost,
    required TResult Function(_PostCreated value) postCreated,
    required TResult Function(_CreatePostError value) createPostError,
  }) {
    return creatingPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PostLoading value)? postLoading,
    TResult? Function(_PostLoaded value)? postLoaded,
    TResult? Function(_PostError value)? postError,
    TResult? Function(_PostLiking value)? postLiking,
    TResult? Function(_PostLiked value)? postLiked,
    TResult? Function(_CreatingPost value)? creatingPost,
    TResult? Function(_PostCreated value)? postCreated,
    TResult? Function(_CreatePostError value)? createPostError,
  }) {
    return creatingPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PostLoading value)? postLoading,
    TResult Function(_PostLoaded value)? postLoaded,
    TResult Function(_PostError value)? postError,
    TResult Function(_PostLiking value)? postLiking,
    TResult Function(_PostLiked value)? postLiked,
    TResult Function(_CreatingPost value)? creatingPost,
    TResult Function(_PostCreated value)? postCreated,
    TResult Function(_CreatePostError value)? createPostError,
    required TResult orElse(),
  }) {
    if (creatingPost != null) {
      return creatingPost(this);
    }
    return orElse();
  }
}

abstract class _CreatingPost implements PostState {
  const factory _CreatingPost() = _$CreatingPostImpl;
}

/// @nodoc
abstract class _$$PostCreatedImplCopyWith<$Res> {
  factory _$$PostCreatedImplCopyWith(
          _$PostCreatedImpl value, $Res Function(_$PostCreatedImpl) then) =
      __$$PostCreatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostCreatedImplCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$PostCreatedImpl>
    implements _$$PostCreatedImplCopyWith<$Res> {
  __$$PostCreatedImplCopyWithImpl(
      _$PostCreatedImpl _value, $Res Function(_$PostCreatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PostCreatedImpl implements _PostCreated {
  const _$PostCreatedImpl();

  @override
  String toString() {
    return 'PostState.postCreated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PostCreatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() postLoading,
    required TResult Function(List<PostModel> posts) postLoaded,
    required TResult Function(dynamic errors) postError,
    required TResult Function(String? id) postLiking,
    required TResult Function() postLiked,
    required TResult Function() creatingPost,
    required TResult Function() postCreated,
    required TResult Function(dynamic errors) createPostError,
  }) {
    return postCreated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? postLoading,
    TResult? Function(List<PostModel> posts)? postLoaded,
    TResult? Function(dynamic errors)? postError,
    TResult? Function(String? id)? postLiking,
    TResult? Function()? postLiked,
    TResult? Function()? creatingPost,
    TResult? Function()? postCreated,
    TResult? Function(dynamic errors)? createPostError,
  }) {
    return postCreated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? postLoading,
    TResult Function(List<PostModel> posts)? postLoaded,
    TResult Function(dynamic errors)? postError,
    TResult Function(String? id)? postLiking,
    TResult Function()? postLiked,
    TResult Function()? creatingPost,
    TResult Function()? postCreated,
    TResult Function(dynamic errors)? createPostError,
    required TResult orElse(),
  }) {
    if (postCreated != null) {
      return postCreated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PostLoading value) postLoading,
    required TResult Function(_PostLoaded value) postLoaded,
    required TResult Function(_PostError value) postError,
    required TResult Function(_PostLiking value) postLiking,
    required TResult Function(_PostLiked value) postLiked,
    required TResult Function(_CreatingPost value) creatingPost,
    required TResult Function(_PostCreated value) postCreated,
    required TResult Function(_CreatePostError value) createPostError,
  }) {
    return postCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PostLoading value)? postLoading,
    TResult? Function(_PostLoaded value)? postLoaded,
    TResult? Function(_PostError value)? postError,
    TResult? Function(_PostLiking value)? postLiking,
    TResult? Function(_PostLiked value)? postLiked,
    TResult? Function(_CreatingPost value)? creatingPost,
    TResult? Function(_PostCreated value)? postCreated,
    TResult? Function(_CreatePostError value)? createPostError,
  }) {
    return postCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PostLoading value)? postLoading,
    TResult Function(_PostLoaded value)? postLoaded,
    TResult Function(_PostError value)? postError,
    TResult Function(_PostLiking value)? postLiking,
    TResult Function(_PostLiked value)? postLiked,
    TResult Function(_CreatingPost value)? creatingPost,
    TResult Function(_PostCreated value)? postCreated,
    TResult Function(_CreatePostError value)? createPostError,
    required TResult orElse(),
  }) {
    if (postCreated != null) {
      return postCreated(this);
    }
    return orElse();
  }
}

abstract class _PostCreated implements PostState {
  const factory _PostCreated() = _$PostCreatedImpl;
}

/// @nodoc
abstract class _$$CreatePostErrorImplCopyWith<$Res> {
  factory _$$CreatePostErrorImplCopyWith(_$CreatePostErrorImpl value,
          $Res Function(_$CreatePostErrorImpl) then) =
      __$$CreatePostErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic errors});
}

/// @nodoc
class __$$CreatePostErrorImplCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$CreatePostErrorImpl>
    implements _$$CreatePostErrorImplCopyWith<$Res> {
  __$$CreatePostErrorImplCopyWithImpl(
      _$CreatePostErrorImpl _value, $Res Function(_$CreatePostErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = freezed,
  }) {
    return _then(_$CreatePostErrorImpl(
      freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$CreatePostErrorImpl implements _CreatePostError {
  const _$CreatePostErrorImpl(this.errors);

  @override
  final dynamic errors;

  @override
  String toString() {
    return 'PostState.createPostError(errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePostErrorImpl &&
            const DeepCollectionEquality().equals(other.errors, errors));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePostErrorImplCopyWith<_$CreatePostErrorImpl> get copyWith =>
      __$$CreatePostErrorImplCopyWithImpl<_$CreatePostErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() postLoading,
    required TResult Function(List<PostModel> posts) postLoaded,
    required TResult Function(dynamic errors) postError,
    required TResult Function(String? id) postLiking,
    required TResult Function() postLiked,
    required TResult Function() creatingPost,
    required TResult Function() postCreated,
    required TResult Function(dynamic errors) createPostError,
  }) {
    return createPostError(errors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? postLoading,
    TResult? Function(List<PostModel> posts)? postLoaded,
    TResult? Function(dynamic errors)? postError,
    TResult? Function(String? id)? postLiking,
    TResult? Function()? postLiked,
    TResult? Function()? creatingPost,
    TResult? Function()? postCreated,
    TResult? Function(dynamic errors)? createPostError,
  }) {
    return createPostError?.call(errors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? postLoading,
    TResult Function(List<PostModel> posts)? postLoaded,
    TResult Function(dynamic errors)? postError,
    TResult Function(String? id)? postLiking,
    TResult Function()? postLiked,
    TResult Function()? creatingPost,
    TResult Function()? postCreated,
    TResult Function(dynamic errors)? createPostError,
    required TResult orElse(),
  }) {
    if (createPostError != null) {
      return createPostError(errors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PostLoading value) postLoading,
    required TResult Function(_PostLoaded value) postLoaded,
    required TResult Function(_PostError value) postError,
    required TResult Function(_PostLiking value) postLiking,
    required TResult Function(_PostLiked value) postLiked,
    required TResult Function(_CreatingPost value) creatingPost,
    required TResult Function(_PostCreated value) postCreated,
    required TResult Function(_CreatePostError value) createPostError,
  }) {
    return createPostError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PostLoading value)? postLoading,
    TResult? Function(_PostLoaded value)? postLoaded,
    TResult? Function(_PostError value)? postError,
    TResult? Function(_PostLiking value)? postLiking,
    TResult? Function(_PostLiked value)? postLiked,
    TResult? Function(_CreatingPost value)? creatingPost,
    TResult? Function(_PostCreated value)? postCreated,
    TResult? Function(_CreatePostError value)? createPostError,
  }) {
    return createPostError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PostLoading value)? postLoading,
    TResult Function(_PostLoaded value)? postLoaded,
    TResult Function(_PostError value)? postError,
    TResult Function(_PostLiking value)? postLiking,
    TResult Function(_PostLiked value)? postLiked,
    TResult Function(_CreatingPost value)? creatingPost,
    TResult Function(_PostCreated value)? postCreated,
    TResult Function(_CreatePostError value)? createPostError,
    required TResult orElse(),
  }) {
    if (createPostError != null) {
      return createPostError(this);
    }
    return orElse();
  }
}

abstract class _CreatePostError implements PostState {
  const factory _CreatePostError(final dynamic errors) = _$CreatePostErrorImpl;

  dynamic get errors;
  @JsonKey(ignore: true)
  _$$CreatePostErrorImplCopyWith<_$CreatePostErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
