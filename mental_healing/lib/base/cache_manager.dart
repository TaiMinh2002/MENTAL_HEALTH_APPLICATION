// import 'dart:convert';

// import 'package:get_storage/get_storage.dart';
// import 'package:mental_healing/controller/controller_manager.dart';
// import 'package:mental_healing/data/model/user/user_info.dart';
// import 'package:mental_healing/global/app_enum.dart';

// mixin CacheManager {
//   final GetStorage _box = GetStorage();
//   Future<bool> removeAllCache() async {
//     Future.wait([
//       removeToken(),
//       removeUserInfo(),
//     ]);
//     ControllerManager().tags = [];
//     return true;
//   }

//   // ============================= Language ============================= //
//   void saveLanguage(String token) {
//     _box.write(CacheManagerKey.language.toString(), token);
//   }

//   String? getLanguage() {
//     return _box.read(CacheManagerKey.language.toString());
//   }

//   Future<void> removeLanguage() async {
//     await _box.remove(CacheManagerKey.language.toString());
//   }

//   // ============================= Token ============================= //
//   void saveToken(String token) {
//     _box.write(CacheManagerKey.token.toString(), token);
//   }

//   String? getToken() {
//     return _box.read(CacheManagerKey.token.toString());
//   }

//   Future<void> removeToken() async {
//     await _box.remove(CacheManagerKey.token.toString());
//   }

//   // ============================= LogInData ============================= //
//   Future<void> saveUserInfo(UserInfo userInfo) async {
//     return await _box.write(
//         CacheManagerKey.userInfo.toString(), jsonEncode(userInfo.toJson()));
//   }

//   Future<UserInfo> getUserInfo() async {
//     final tempData = _box.read(CacheManagerKey.userInfo.toString());
//     return await tempData != null
//         ? UserInfo.fromJson(
//             jsonDecode(_box.read(CacheManagerKey.userInfo.toString())))
//         : const UserInfo();
//   }

//   Future<void> removeUserInfo() async {
//     await _box.remove(CacheManagerKey.userInfo.toString());
//   }
// }
