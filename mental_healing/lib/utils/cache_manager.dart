import 'package:get_storage/get_storage.dart';

class CacheManager {
  static final GetStorage _box = GetStorage();

  static const String _keyFirstRun = 'firstRun';
  static const String _keyFirstLogin = 'firstLogin';

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

  // Kiểm tra xem có phải lần đầu mở ứng dụng hay không
  static bool isFirstRun() {
    return _box.read(_keyFirstRun) ??
        true; // Mặc định là true nếu chưa được set
  }

  // Đánh dấu ứng dụng đã mở lần đầu
  static Future<void> markFirstRunComplete() async {
    await _box.write(_keyFirstRun, false);
  }

  static bool isFirstLogin() {
    return _box.read(_keyFirstLogin) ?? true;
  }

  static Future<void> markFirstLoginComplete() async {
    await _box.write(_keyFirstLogin, false);
  }
}
