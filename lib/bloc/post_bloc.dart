import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swappes/models/post.dart';
import 'package:swappes/models/services/api.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'post_event.dart';
part 'post_state.dart';
part 'post_bloc.freezed.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const _Initial()) {
    on<_LoadPost>((event, emit) async {
      emit(const PostState.postLoading());
      try {
        List<PostModel> lists = [];
        var posts = await Api.dio.get("posts");

        for (var x in posts.data['data']) {
          lists.add(PostModel.fromJson(x));
        }

        emit(PostState.postLoaded(lists));
      } on DioException catch (e) {
        log(e.toString());
        emit(PostState.postError(e.error));
      }
    });

    on<_LikePost>((event, emit) async {
      emit(PostState.postLiking(event.id));
      try {
        await Api.dio.post("posts/${event.id}/likes");
        emit(PostState.postLiked());
      } on DioException catch (e) {
        emit(PostState.postError(e.error));
      }
    }, transformer: droppable());

    on<_CreatePost>((event, emit) async {
      emit(const PostState.creatingPost());
      try {
        final List<MultipartFile>? images = event.images
            ?.map((image) => MultipartFile.fromFileSync(image.path,
                filename: image.path.split("/").last))
            .toList();
        var post = await Api.dio.post("posts",
            data: FormData.fromMap(
                {'images': images, 'description': event.description}));
        emit(const PostState.postCreated());
      } on DioException catch (e) {
        emit(PostState.createPostError(e.error));
      }
    });
  }
}
