import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:mental_healing/model/user_info.dart';

mixin CacheManager {
  static final GetStorage _box = GetStorage();
  static const String _keyUser = 'loggedInUser';
  static const String _keyAccountSetupComplete = 'accountSetupComplete';
  static const String _keyFirstRun = 'firstRun';
  static const String _keyFirstLogin = 'firstLogin';
  static const String _keyFirstChatbotVisit = 'firstChatbotVisit';

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

  static Future<void> markAccountSetupComplete() async {
    await _box.write(_keyAccountSetupComplete, true);
  }

  static bool hasCompletedAccountSetup() {
    return _box.read(_keyAccountSetupComplete) ?? false;
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

  // Kiểm tra lần đầu vào chatbot
  static bool isFirstChatbotVisit() {
    return _box.read(_keyFirstChatbotVisit) ?? true;
  }

  // Đánh dấu chatbot đã được truy cập lần đầu
  static Future<void> markFirstChatbotVisitComplete() async {
    await _box.write(_keyFirstChatbotVisit, false);
  }

  // Lưu thông tin UserInfo dưới dạng JSON
  static Future<void> storeUser(UserInfo user) async {
    await _box.write(_keyUser, jsonEncode(user.toJson()));
  }

  // Truy xuất thông tin UserInfo
  static UserInfo? getStoredUser() {
    final String? userData = _box.read(_keyUser);
    if (userData != null) {
      final Map<String, dynamic> json = jsonDecode(userData);
      return UserInfo.fromJson(json); // Chuyển từ JSON sang đối tượng UserInfo
    }
    return null;
  }

  // Xóa thông tin user
  static Future<void> clearUser() async {
    await _box.remove(_keyUser);
    await _box.remove(_keyAccountSetupComplete);
  }
}
