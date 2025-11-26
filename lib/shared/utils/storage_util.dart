import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static final _secureStorage = FlutterSecureStorage();

  static const _keyToken = 'authToken';
  static const _keyUserId = 'userID';
  static const _keyAccCreated = 'accCreated';

  static Future<void> saveToken(String token) =>
      _secureStorage.write(key: _keyToken, value: token);

  static Future<String?> getToken() => _secureStorage.read(key: _keyToken);

  static Future<void> saveUserID(String userID) =>
      _secureStorage.write(key: _keyUserId, value: userID);

  static Future<String?> getUserID() => _secureStorage.read(key: _keyUserId);

  static Future<void> setAccCreated(int flag) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyAccCreated, flag);
  }

  static Future<int?> getAccCreated() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyAccCreated);
  }

  static Future<void> clearAll() async {
    await _secureStorage.deleteAll();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyAccCreated);
  }
}
