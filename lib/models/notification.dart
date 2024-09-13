import 'package:freezed_annotation/freezed_annotation.dart';

part "notification.freezed.dart";
part "notification.g.dart";

@freezed
class NotificationModel with _$NotificationModel {
  factory NotificationModel(
      {@JsonKey(name: "_id") required final String id,
      required final List<String> to,
      required final dynamic from,
      final dynamic post,
      required final String content,
      @Default(false) final bool isRead,
      required final String createdAt,
      required final String updatedAt}) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
