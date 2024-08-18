part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

final class LoadPost extends PostEvent {}

final class LikePost extends PostEvent {
  final String id;

  LikePost(this.id);
}

final class CreatePost extends PostEvent {
  final String? description;
  final List<File>? images;

  CreatePost({this.description, this.images});
}
