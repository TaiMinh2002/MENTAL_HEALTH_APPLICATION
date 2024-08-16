import 'package:get_storage/get_storage.dart';

class CacheManager {
  static final GetStorage _box = GetStorage();

  // Lưu trữ token và refreshToken
  static Future<void> storeTokens(String token, String refreshToken) async {
    await _box.write('token', token);
    await _box.write('refreshToken', refreshToken);
  }

  // Lấy token đã lưu
  static String? getToken() {
    return _box.read('token');
  }

  // Lấy refreshToken đã lưu
  static String? getRefreshToken() {
    return _box.read('refreshToken');
  }

  // Xóa token và refreshToken đã lưu
  static Future<void> clearTokens() async {
    await _box.remove('token');
    await _box.remove('refreshToken');
  }

  // Lưu trữ trạng thái lần đầu mở app
  static Future<void> storeFirstLaunch() async {
    await _box.write('is_first_launch', false);
  }

  // Kiểm tra lần đầu mở app
  static bool isFirstLaunch() {
    return _box.read('is_first_launch') ?? true;
  }

  // Kiểm tra người dùng đã đăng nhập hay chưa
  static bool isLoggedIn() {
    return getToken() != null;
  }
}
