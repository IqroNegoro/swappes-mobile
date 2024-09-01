part of 'post_cubit.dart';

enum PostStatus {
  initial,
  loading,
  loaded,
  error,
  creating,
  editing,
  liking,
  showComment,
  saving,
  deleting,
  sharing,
}

@Freezed(makeCollectionsUnmodifiable: false)
class PostState with _$PostState {
  factory PostState(
      {@Default([]) final List<PostModel> posts,
      final PostModel? post,
      @Default([]) final List<CommentModel> comments,
      @Default(PostStatus.initial) final PostStatus status,
      final String? postId, final dynamic error}) = _PostState;
}
