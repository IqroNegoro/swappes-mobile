part of 'post_bloc.dart';

@freezed
class PostState with _$PostState {
  const factory PostState.initial() = _Initial;
  const factory PostState.postLoading() = _PostLoading;
  const factory PostState.postLoaded(final List<PostModel> posts) = _PostLoaded;
  const factory PostState.postError(final dynamic errors) = _PostError;
  const factory PostState.postLiking(final String? id) = _PostLiking;
  const factory PostState.postLiked(final String? id) = _PostLiked;
  const factory PostState.postComments(final String id) = _PostComments;
  const factory PostState.creatingPost() = _CreatingPost;
  const factory PostState.postCreated() = _PostCreated;
  const factory PostState.createPostError(final dynamic errors) = _CreatePostError;
}
