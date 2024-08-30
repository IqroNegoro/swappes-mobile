part of 'comment_cubit.dart';

@freezed
class CommentState with _$CommentState {
  const factory CommentState.initial() = _Initial;
  const factory CommentState.loading() = _Loading;
  const factory CommentState.loaded(final List<CommentModel> comments) =
      _Loaded;
  const factory CommentState.error(final dynamic error) = _Error;
  const factory CommentState.postComment(String id) = _PostComment;
  const factory CommentState.deleteComment(String id) = _DeleteComment;
}