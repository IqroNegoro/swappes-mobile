import 'dart:convert';
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

  Future<void> getPosts() async {
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

  Future<void> getPost(String id) async {
    if (state.status == PostStatus.creating) return;
    emit(state.copyWith(status: PostStatus.loading));
    try {
      late PostModel post;

      var data = await Api.dio.get("posts/$id");

      post = PostModel.fromJson(data.data['data']);

      emit(state.copyWith(post: post, status: PostStatus.loaded));
    } on DioException catch (e) {
      emit(state.copyWith(error: e.error, status: PostStatus.error));
    }
  }

  Future<void> editPost(
      {required String id,
      String? description = "",
      List<File>? images = const [],
      List<dynamic>? oldImages = const []}) async {
    if (description!.isEmpty && images!.isEmpty) return;
    emit(state.copyWith(status: PostStatus.editing));
    try {
      List<MultipartFile>? postImages = [];
      if (images!.isNotEmpty) {
        postImages = images
            .map((image) => MultipartFile.fromFileSync(image.path,
                filename: image.path.split("/").last))
            .toList();
      }
      var post = await Api.dio.put("posts/$id",
          data: FormData.fromMap(
            {
              'images': postImages,
              'description': description,
              'oldImages': json.encode(oldImages)
            },
          ));

      final int index = state.posts.indexWhere((element) => element.id == id);

      state.posts[index] = PostModel.fromJson(post.data['data']);

      emit(state.copyWith(status: PostStatus.loaded, posts: state.posts));
    } on DioException catch (e) {
      log(e.error.toString());
      emit(state.copyWith(status: PostStatus.error, error: e.error));
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

  Future<void> deletePost(String id) async {
    emit(state.copyWith(status: PostStatus.deleting));
    try {
      var post = await Api.dio.delete("posts/$id");
      state.posts.removeWhere((element) => element.id == id);
      emit(state.copyWith(status: PostStatus.loaded, posts: state.posts));
    } on DioException catch (e) {
      log(e.error.toString());
      emit(state.copyWith(status: PostStatus.error, error: e.error));
    }
  }

  Future<void> savePost(String id) async {
    if (id.isEmpty) return;
    emit(state.copyWith(status: PostStatus.saving));
    try {
      var post = await Api.dio.post("bookmarks", data: {"id": id});

      final int index = state.posts.indexWhere((element) => element.id == id);

      state.posts[index] =
          state.posts[index].copyWith(bookmark: post.data['data']);

      emit(state.copyWith(status: PostStatus.loaded, posts: state.posts));
    } on DioException catch (e) {
      log(e.error.toString());
      emit(state.copyWith(status: PostStatus.error, error: e.error));
    }
  }

  Future<void> sharePost(String id, String? description) async {
    if (id.isEmpty) return;
    emit(state.copyWith(status: PostStatus.sharing));
    try {
      var post = await Api.dio.post("posts", data: {"share": id, "description": description, "isShare": true});

      emit(state.copyWith(status: PostStatus.loaded));
    } on DioException catch (e) {
      log(e.error.toString());
      emit(state.copyWith(status: PostStatus.error, error: e.error));
    }
  }

  Future<void> deleteSavedPost(String id) async {
    if (id.isEmpty) return;
    emit(state.copyWith(status: PostStatus.deleting));
    try {
      var post = await Api.dio.delete("bookmarks/$id");

      final int index = state.posts.indexWhere((element) => element.id == id);

      state.posts[index] = state.posts[index].copyWith(bookmark: null);

      emit(state.copyWith(status: PostStatus.loaded, posts: state.posts));
    } on DioException catch (e) {
      log(e.error.toString());
      emit(state.copyWith(status: PostStatus.error, error: e.error));
    }
  }
}
