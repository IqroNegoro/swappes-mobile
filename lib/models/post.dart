import 'package:swappes/models/user.dart';

// final class ImageData {
//   final int discordId;
//   final String images;

//   const ImageData({required this.discordId, required this.images});
// }

final class PostModel {
  final String id;
  final String? description;
  final List<dynamic> images;
  final User user;
  List<dynamic> likes;
  final int comments;
  final bool isShare;
  final PostModel? share;
  final String createdAt;
  final String updatedAt;

  PostModel(
      {required this.id,
      this.description = "",
      required this.images,
      required this.user,
      this.likes = const [],
      this.comments = 0,
      this.isShare = false,
      required this.share,
      required this.createdAt,
      required this.updatedAt});

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json['_id'],
        description: json['description'] ?? "",
        images: json['images'],
        user: User.fromJson(json['user']),
        likes: json['likes'] ?? [],
        comments: json['comments'],
        isShare: json['isShare'],
        share: json['share'] != null ? PostModel.fromJson(json['share']) : null,
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );
}
