import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_healing/generated/locales.g.dart';

class LocalizationService extends Translations {
  static Locale get locale => _getLocaleFromLanguage();

  static List<Locale> locales = <Locale>[
    const Locale('en', 'US'),
    const Locale('vi', 'VN'),
  ];

  static Locale fallbackLocale = const Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => <String, Map<String, String>>{
        'en_US': Locales.en,
        'vi_VN': Locales.vi,
      };

  static Future<void> changeLocale(String langCode) async {
    await Get.updateLocale(Locale(langCode));
  }

  static Locale _getLocaleFromLanguage() {
    // Mặc định trả về tiếng Việt
    return const Locale('en', 'US');
  }
}
