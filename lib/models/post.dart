import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swappes/models/user.dart';

part "post.freezed.dart";
part "post.g.dart";

// final class ImageData {
//   final int discordId;
//   final String images;

//   const ImageData({required this.discordId, required this.images});
// }


@freezed
final class PostModel with _$PostModel {
  // final String id;
  // final String? description;
  // final List<dynamic> images;
  // final User user;
  // List<dynamic> likes;
  // final int comments;
  // final bool isShare;
  // final PostModel? share;
  // final String createdAt;
  // final String updatedAt;

  factory PostModel(
      {@JsonKey(name: "_id") required final String id,
      final String? description,
      required List<dynamic> images,
      required User user,
      @Default([]) List<dynamic> likes,
      @Default(0) int comments,
      @Default(false) final bool isShare,
      required final PostModel? share,
      required final String createdAt,
      required final String updatedAt}) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
}
