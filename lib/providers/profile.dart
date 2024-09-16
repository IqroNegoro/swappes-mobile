import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:swappes/models/avatar.dart';
import 'package:swappes/storage/storage.dart';

class Profile with ChangeNotifier {
  late String? id;
  late String? name;
  late String? email;
  late Avatar? avatar;
  late Avatar? banner;

  void saveUser(user) async {
    id = user['_id'] ?? id;
    name = user['name'] ?? name;
    email = user['email'] ?? email;
    avatar = user['avatar'] != null ? Avatar.fromJson(user['avatar']) : avatar;
    banner = user['banner'] != null ? Avatar.fromJson(user['banner']) : banner;

    await Storage.save(
        "user",
        json.encode({
          "id": user['id'],
          "name": user['name'],
          "email": user['email'],
          "avatar": user['avatar'],
          "banner": user['banner'],
        }));

    notifyListeners();
  }

  void getUser() async {
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
    try {
      
      notifyListeners();
      return true;
    } catch (error) {
      return false;
    }
  }
}
