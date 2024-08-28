import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swappes/models/user.dart';

part "comment.freezed.dart";
part "comment.g.dart";

@freezed
final class CommentModel with _$CommentModel {
  factory CommentModel(
      {@JsonKey(name: "_id") required final String id,
      required final String comment,
      required final dynamic image,
      required final User user,
      required final String post,
      required final String replyId,
      required final String createdAt,
      required final String updatedAt}) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);
}
