import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final class Storage {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  FlutterSecureStorage get storage => _storage;

  static Future<void> save(String keyName, dynamic valueName) async =>
      await _storage.write(key: keyName, value: valueName);

  static Future<String?> get(String keyName) async =>
      await _storage.read(key: keyName);
}
