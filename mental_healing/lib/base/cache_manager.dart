import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:mental_healing/controller/controller_manager.dart';
import 'package:mental_healing/data/model/user_info.dart';
import 'package:mental_healing/global/app_enum.dart';

mixin CacheManager {
  final GetStorage _box = GetStorage();
  Future<bool> removeAllCache() async {
    Future.wait([
      removeToken(),
      removeUserInfo(),
      removeFCMToken(),
    ]);
    ControllerManager().tags = [];
    return true;
  }

  // ============================= passBoarding ============================= //
  void savePassBoarding(bool value) {
    _box.write(CacheManagerKey.passBoarding.toString(), value);
  }

  bool? getPassBoarding() {
    return _box.read(CacheManagerKey.passBoarding.toString());
  }

  Future<void> removePassBoarding() async {
    await _box.remove(CacheManagerKey.passBoarding.toString());
  }

  // ============================= passChatbot ============================= //
  void savePassChatbot(bool value) {
    _box.write(CacheManagerKey.passChatbot.toString(), value);
  }

  bool? getPassChatbot() {
    return _box.read(CacheManagerKey.passChatbot.toString());
  }

  Future<void> removePassChatbot() async {
    await _box.remove(CacheManagerKey.passChatbot.toString());
  }

  // ============================= Language ============================= //
  void saveLanguage(String token) {
    _box.write(CacheManagerKey.language.toString(), token);
  }

  String? getLanguage() {
    return _box.read(CacheManagerKey.language.toString());
  }

  Future<void> removeLanguage() async {
    await _box.remove(CacheManagerKey.language.toString());
  }

  // ============================= Token ============================= //
  void saveToken(String? token) {
    _box.write(CacheManagerKey.token.toString(), token);
  }

  String? getToken() {
    return _box.read(CacheManagerKey.token.toString());
  }

  Future<void> removeToken() async {
    await _box.remove(CacheManagerKey.token.toString());
  }

  // ============================= LogInData ============================= //
  Future<void> saveUserInfo(UserInfo userInfo) async {
    return await _box.write(
        CacheManagerKey.userInfo.toString(), jsonEncode(userInfo.toJson()));
  }

  Future<UserInfo> getUserInfo() async {
    final tempData = _box.read(CacheManagerKey.userInfo.toString());
    return await tempData != null
        ? UserInfo.fromJson(
            jsonDecode(_box.read(CacheManagerKey.userInfo.toString())))
        : const UserInfo();
  }

  Future<void> removeUserInfo() async {
    await _box.remove(CacheManagerKey.userInfo.toString());
  }

  // ============================= FcmToken ============================= //
  String? getFcmToken() {
    return _box.read(CacheManagerKey.fcmToken.toString());
  }

  Future<void> removeFCMToken() async {
    await _box.remove(CacheManagerKey.fcmToken.toString());
  }

  Future<bool> saveFcmToken(String? token) async {
    await _box.write(CacheManagerKey.fcmToken.toString(), token);
    return true;
  }
}
