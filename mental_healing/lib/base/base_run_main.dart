// import 'dart:async';

// import 'package:flutter/services.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:mental_healing/base/cache_manager.dart';
// import 'package:mental_healing/base/locator.dart';
// import 'package:mental_healing/config/config.dart';
// import 'package:mental_healing/import.dart';
// import 'package:mental_healing/main.dart';

// class BaseRunMain with CacheManager {
//   static Future<void> runMainApp({required BaseConfig config}) async {
//     runZonedGuarded(() async {
//       WidgetsFlutterBinding.ensureInitialized();
//       setSystemUIOverlayStyle();
//       await ScreenUtil.ensureScreenSize();
//       await GetStorage.init();
//       await SystemChrome.setPreferredOrientations(
//           <DeviceOrientation>[DeviceOrientation.portraitUp]);
//       AppConfig.setEnvironment(valueConfig: config);
//       await setupLocator();
//       runApp(const MyApp());
//     }, (Object error, StackTrace stackTrace) {});
//   }
// }
