import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// ignore_for_file: constant_identifier_names
class SecureStorage {
  static const AndroidOptions _androidOptions = AndroidOptions(
    encryptedSharedPreferences: true,
  );

  static const _storage = FlutterSecureStorage(aOptions: _androidOptions);

  static const USER_ACCESS_TOKEN = "user_access_token";

  static const USER_REFRESH_TOKEN = "user_refresh_token";

  static const API_URL = "api_url";

  static Future<void> writeSecureData(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  static Future<String?> readSecureData(String key) async {
    return await _storage.read(key: key);
  }

  static Future<void> deleteSecureData(String key) async {
    await _storage.delete(key: key);
  }

  static Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
