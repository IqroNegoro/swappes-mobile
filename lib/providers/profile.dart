import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:swappes/models/avatar.dart';
import 'package:swappes/storage/storage.dart';

class Profile with ChangeNotifier {
  String? id;
  String? name;
  String? email;
  Avatar? avatar;

  void saveUser(user) async {
    id = user['_id'];
    name = user['name'];
    email = user['email'];
    avatar = Avatar.fromJson(user['avatar']);

    await Storage.save(
        "user",
        json.encode({
          "id": user['id'],
          "name": user['name'],
          "email": user['email'],
          "avatar": user['avatar'],
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
    }
  }
}
