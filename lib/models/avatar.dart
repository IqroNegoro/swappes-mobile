import 'package:freezed_annotation/freezed_annotation.dart';

part "avatar.freezed.dart";
part "avatar.g.dart";

@freezed
class Avatar with _$Avatar {
  // final String? url;
  // final String? discordId;

  factory Avatar({String? url, String? discordId}) = _Avatar;

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
}
