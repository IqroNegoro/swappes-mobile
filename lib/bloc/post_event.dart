part of 'post_bloc.dart';

@freezed
class PostEvent with _$PostEvent {
  const factory PostEvent.loadPost() = _LoadPost;
  const factory PostEvent.likePost(String id) = _LikePost;
  const factory PostEvent.createPost({String? description, List<File>? images}) = _CreatePost;
}