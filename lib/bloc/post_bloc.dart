import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:swappes/models/post.dart';
import 'package:swappes/models/services/api.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<LoadPost>((event, emit) async {
      emit(PostLoading());
      try {
        List<PostModel> lists = [];
        var posts = await dio.get("posts");

        for (var x in posts.data['data']) {
          lists.add(PostModel.fromJson(x));
        }

        emit(PostLoaded(lists));
      } on DioException catch (e) {
        log(e.toString());
        emit(PostError(e.error));
      }
    });

    on<LikePost>((event, emit) async {
      emit(LikingPost(event.id));
      try {
        await dio.post("posts/${event.id}/likes");
        emit(PostLiked());
      } on DioException catch (e) {
        emit(PostError(e.error));
      }
    }, transformer: droppable());

    on<CreatePost>((event, emit) async {
      emit(CreatingPost());
      try {
        final List<MultipartFile>? images = event.images?.map((image) => MultipartFile.fromFileSync(image.path, filename: image.path.split("/").last)).toList();
        var post = await dio.post("posts",
            data: FormData.fromMap(
                {'images': images, 'description': event.description}));
        emit(PostCreated());
      } on DioException catch (e) {
        emit(CreatePostError(e.error));
      }
    });
  }
}
