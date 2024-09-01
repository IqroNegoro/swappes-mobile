import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swappes/models/user.dart';

part "post.freezed.dart";
part "post.g.dart";

@freezed
final class PostModel with _$PostModel {
  factory PostModel(
      {@JsonKey(name: "_id") required final String id,
      final String? description,
      @Default([]) List<dynamic> images,
      required User user,
      @Default([]) List<dynamic> likes,
      @Default(0) int comments,
      final dynamic bookmark,
      @Default(false) final bool isShare,
      required final PostModel? share,
      required final String createdAt,
      required final String updatedAt}) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
}
