part of 'post_cubit.dart';

enum PostStatus {
  initial,
  loading,
  loaded,
  error,
  creating,
  liking,
  showComment,
}

@Freezed(makeCollectionsUnmodifiable: false)
class PostState with _$PostState {
  factory PostState(
      {@Default([]) final List<PostModel> posts,
      @Default([]) final List<CommentModel> comments,
      @Default(PostStatus.initial) final PostStatus status,
      final String? postId, final dynamic error}) = _PostState;
}
