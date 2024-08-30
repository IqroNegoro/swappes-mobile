import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swappes/models/comment.dart';
import 'package:swappes/services/api.dart';

part 'comment_state.dart';
part 'comment_cubit.freezed.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(const CommentState.initial());

  List<CommentModel> commentsState = [];

  Future<void> getComments(String id) async {
    emit(const CommentState.loading());
    try {
      final List<CommentModel> comments = [];
      final data = await Api.dio.get("posts/$id/comments");
      for (var x in data.data['data']) {
        comments.add(CommentModel.fromJson(x));
      }
      commentsState = comments;
      emit(CommentState.loaded(comments));
    } on DioException catch (e) {
      emit(CommentState.error(e.error));
    }
  }

  Future<void> postComment(
      String postId, String? comment, File? commentImage) async {
    if (comment == null && comment!.isEmpty && commentImage == null) return;
    emit(CommentState.postComment(postId));
    try {
      MultipartFile? image;
      if (commentImage != null) {
        image = MultipartFile.fromFileSync(commentImage.path,
            filename: commentImage.path.split("/").last);
      }

      final commentResponse = await Api.dio.post("posts/$postId/comments",
          data: FormData.fromMap(
              {"id": postId, "comment": comment, "image": image}));
      commentsState.insert(
          0, CommentModel.fromJson(commentResponse.data['data']));
      emit(CommentState.loaded(commentsState));
    } on DioException catch (e) {
      emit(CommentState.error(e.error));
    }
  }

  Future<void> deleteComment(String id, String postId) async {
    emit(CommentState.deleteComment(postId));
    try {
      final comment = await Api.dio
          .delete("posts/$postId/comments/$id", data: {"id": id, "postId": postId});
      commentsState.removeWhere((element) => element.id == id);
      emit(CommentState.loaded(commentsState));
    } on DioException catch (e) {
      emit(CommentState.error(e.error));
    }
  }
}
