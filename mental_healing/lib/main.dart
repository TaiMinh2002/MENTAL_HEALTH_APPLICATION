import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/service/localization/localization_service.dart';

void main() async {
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: AppRouter.routerSplash,
      getPages: AppRouter.getPages,
      defaultTransition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 280),
      translations: LocalizationService(),
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
    );
  }
}
