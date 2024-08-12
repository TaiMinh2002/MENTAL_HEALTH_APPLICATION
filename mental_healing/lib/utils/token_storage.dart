import 'package:get_storage/get_storage.dart';

class TokenStorage {
  static final GetStorage _box = GetStorage();

  static Future<void> storeToken(String token, String refreshToken) async {
    await _box.write('token', token);
    await _box.write('refreshToken', refreshToken);
  }

  static String? getStoredToken() {
    return _box.read('token');
  }

  static String? getStoredRefreshToken() {
    return _box.read('refreshToken');
  }

  static Future<void> clearStoredToken() async {
    await _box.remove('token');
    await _box.remove('refreshToken');
  }
}
