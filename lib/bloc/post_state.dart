part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

final class PostLoading extends PostState {}

final class PostLoaded extends PostState {
  final List<PostModel> posts;

  PostLoaded(this.posts);
}

final class PostError extends PostState {
  final dynamic errors;

  PostError(this.errors);
}

final class LikingPost extends PostState {
  final String? id;

  LikingPost(this.id);
}

final class PostLiked extends PostState {}

final class CreatingPost extends PostState {}

final class PostCreated extends PostState {}

final class CreatePostError extends PostState {
  final dynamic errors;

  CreatePostError(this.errors);
}
// part of 'post_bloc.dart';

// enum PostStates { initial, loading, error, loaded, likingPost }

// class PostState {
//   final List<PostModel> posts;
//   final PostStates state;

//   const PostState({this.posts = const [], this.state = PostStates.initial});

//   PostState copyWith({List<PostModel>? posts, PostStates? state}) =>
//       PostState(posts: posts ?? this.posts, state: state ?? this.state);
// }