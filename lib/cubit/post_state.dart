part of 'post_cubit.dart';

enum PostStatus {
  initial,
  loading,
  loaded,
  error,
  creating,
}

@freezed
class PostState with _$PostState {
  factory PostState(
      {@Default([]) final List<PostModel> posts,
      @Default(PostStatus.initial) final PostStatus status,
      final String? postId, final dynamic error}) = _PostState;
  // const factory PostState.initial() = _Initial;
}
