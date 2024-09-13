import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swappes/models/avatar.dart';

part "user.freezed.dart";
part "user.g.dart";

@freezed
final class User with _$User {
  factory User({
    @JsonKey(name: "_id") required final String id,
    required final String name,
    required final Avatar avatar,
    final dynamic banner,
    @Default(0) final int friends,
    final dynamic isFriend,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}