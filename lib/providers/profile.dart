import 'package:flutter/material.dart';
import 'package:swappes/models/user.dart';

class Profile with ChangeNotifier {
  String? id;
  String? name;
  String? email;
  Avatar? avatar;

  void saveUser(user) {
    id = user['_id'];
    name = user['name'];
    email = user['email'];
    avatar = Avatar.fromJson(user['avatar']);

    notifyListeners();
  }
}
