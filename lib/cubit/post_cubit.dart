import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swappes/models/comment.dart';
import 'package:swappes/models/post.dart';
import 'package:swappes/services/api.dart';

part 'post_state.dart';
part 'post_cubit.freezed.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostState(status: PostStatus.initial));

  Future<void> getPost() async {
    if (state.status == PostStatus.creating) return;
    emit(state.copyWith(status: PostStatus.loading));
    try {
      List<PostModel> lists = [];

      var posts = await Api.dio.get("posts");

      for (var x in posts.data['data']) {
        lists.add(PostModel.fromJson(x));
      }

      emit(state.copyWith(posts: lists, status: PostStatus.loaded));
    } on DioException catch (e) {
      emit(state.copyWith(error: e.error, status: PostStatus.error));
    }
  }

  Future<void> likePost(String id) async {
    emit(state.copyWith(status: PostStatus.liking, postId: id));
    try {
      final likes = await Api.dio.post("posts/$id/likes");

      final int index = state.posts.indexWhere((element) => element.id == id);
      state.posts[index] =
          state.posts[index].copyWith(likes: likes.data['data']['likes']);

      emit(state.copyWith(status: PostStatus.loaded, posts: state.posts));
    } on DioException catch (e) {
      emit(state.copyWith(error: e.error, status: PostStatus.error));
    }
  }

  Future<void> createPost(
      {String? description = "", List<File>? images = const []}) async {
    if (description!.isEmpty && images!.isEmpty) return;
    emit(state.copyWith(status: PostStatus.creating));
    try {
      List<MultipartFile>? postImages = [];
      if (images!.isNotEmpty) {
        postImages = images
            .map((image) => MultipartFile.fromFileSync(image.path,
                filename: image.path.split("/").last))
            .toList();
      }
      var post = await Api.dio.post("posts",
          data: FormData.fromMap(
              {'images': postImages, 'description': description}));
      log("post creating!");
      emit(state.copyWith(
          status: PostStatus.loaded,
          posts: [PostModel.fromJson(post.data['post']), ...state.posts]));
    } on DioException catch (e) {
      log(e.error.toString());
      emit(state.copyWith(status: PostStatus.error, error: e.error));
    }
  }
}
