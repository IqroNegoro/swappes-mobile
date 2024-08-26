import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swappes/models/post.dart';
import 'package:swappes/models/services/api.dart';

part 'post_state.dart';
part 'post_cubit.freezed.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostState(status: PostStatus.initial));

  Future<void> getPost() async {
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

  // on<_LoadPost>((event, emit) async {
  //     log(state.toString());
  //     emit(const PostState.postLoading());
  //     try {
  //       List<PostModel> lists = [];
  //       var posts = await Api.dio.get("posts");

  //       for (var x in posts.data['data']) {
  //         lists.add(PostModel.fromJson(x));
  //       }

  //       emit(PostState.postLoaded(lists));
  //     } on DioException catch (e) {
  //       log(e.toString());
  //       emit(PostState.postError(e.error));
  //     }
  //   });

  // on<_LikePost>((event, emit) async {
  //   emit(PostState.postLiking(event.id));
  //   try {
  //     await Api.dio.post("posts/${event.id}/likes");
  //     emit(PostState.postLiked(event.id));
  //   } on DioException catch (e) {
  //     emit(PostState.postError(e.error));
  //   }
  // }, transformer: droppable());

  Future<void> createPost({String? description, List<File>? images}) async {
    emit(state.copyWith(status: PostStatus.creating));
    try {
      final List<MultipartFile>? postImages = images
          ?.map((image) => MultipartFile.fromFileSync(image.path,
              filename: image.path.split("/").last))
          .toList();
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

  // on<_CreatePost>((event, emit) async {
  //   log(state.toString());
  //   emit(const PostState.creatingPost());
  //   try {
  //     final List<MultipartFile>? images = event.images
  //         ?.map((image) => MultipartFile.fromFileSync(image.path,
  //             filename: image.path.split("/").last))
  //         .toList();
  //     var post = await Api.dio.post("posts",
  //         data: FormData.fromMap(
  //             {'images': images, 'description': event.description}));

  //     emit(const PostState.postCreated());
  //   } on DioException catch (e) {
  //     emit(PostState.createPostError(e.error));
  //   }
  // });

  // on<_ShowComments>((event, emit) {
  //   log(state.toString());
  //   emit(PostState.postComments(event.id));
  //   //   state.maybeWhen(
  //   //       postComments: (_) => emit(const PostState.initial()),
  //   //       initial: () => ),
  //   //       orElse: () {});
  // });
}
