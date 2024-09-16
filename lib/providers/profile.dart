import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:swappes/models/avatar.dart';
import 'package:swappes/services/api.dart';
import 'package:swappes/storage/storage.dart';

class Profile with ChangeNotifier {
  late String? id;
  late String? name;
  late String? email;
  late Avatar? avatar;
  late Avatar? banner;

  bool isLoadingAvatar = false;
  bool isLoadingBanner = false;

  Future<void> saveUser(user) async {
    id = user['_id'] ?? id;
    name = user['name'] ?? name;
    email = user['email'] ?? email;
    avatar = user['avatar'] != null ? Avatar.fromJson(user['avatar']) : avatar;
    banner = user['banner'] != null ? Avatar.fromJson(user['banner']) : banner;

    await Storage.save(
        "user",
        json.encode({
          "id": id,
          "name": name,
          "email": email,
          "avatar": avatar,
          "banner": banner,
        }));

    notifyListeners();
  }

  Future<void> getUser() async {
    final String? user = await Storage.get("user");

    if (user != null) {
      final decode = json.decode(user);
      id = decode['_id'];
      name = decode['name'];
      email = decode['email'];
      avatar = Avatar.fromJson(decode['avatar']);
      banner = Avatar.fromJson(decode['banner']);
    }
  }

  Future<bool> updateAvatar(File image) async {
    isLoadingAvatar = true;
    notifyListeners();
    try {
      MultipartFile avatar = MultipartFile.fromFileSync(image.path,
          filename: image.path.split("/").last);

      final response = await Api.dio
          .post("users/avatar", data: FormData.fromMap({"avatar": avatar}));

      saveUser({'avatar': response.data['data']});
      isLoadingAvatar = false;

      notifyListeners();

      return true;
    } catch (error) {
      isLoadingAvatar = false;
      return false;
    }
  }

  Future<bool> updateBanner(File image) async {
    isLoadingBanner = true;
    notifyListeners();
    try {
      MultipartFile banner = MultipartFile.fromFileSync(image.path,
          filename: image.path.split("/").last);

      final response = await Api.dio
          .post("users/banner", data: FormData.fromMap({"banner": banner}));

      saveUser({'banner': response.data['data']});

      isLoadingBanner = false;

      notifyListeners();
      return true;
    } catch (error) {
      isLoadingBanner = false;
      log(error.toString());
      return false;
    }
  }
}
