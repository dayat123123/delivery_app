import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageHelper {
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage(
      aOptions: _androidOptions, iOptions: _iosOptions);
  static const AndroidOptions _androidOptions = AndroidOptions(
      encryptedSharedPreferences: true,
      sharedPreferencesName: 'secure_storage',
      preferencesKeyPrefix: 'secure_');

  static const IOSOptions _iosOptions =
      IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  Future<void> deleteData(String key) async {
    await _flutterSecureStorage.delete(key: key);
  }

  Future<void> deleteAllData() async {
    await _flutterSecureStorage.deleteAll();
  }

  Future<void> write(String key, dynamic value) async {
    String jsonString = jsonEncode(value);
    await _flutterSecureStorage.write(
        key: key,
        value: jsonString,
        aOptions: _androidOptions,
        iOptions: _iosOptions);
  }

  Future<dynamic> read(String key) async {
    String? jsonString = await _flutterSecureStorage.read(
        key: key, aOptions: _androidOptions, iOptions: _iosOptions);
    if (jsonString != null) return jsonDecode(jsonString);
    return null;
  }
}
