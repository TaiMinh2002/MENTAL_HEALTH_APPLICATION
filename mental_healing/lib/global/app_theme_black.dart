import 'package:flutter/material.dart';
import 'app_text_style.dart';
import 'app_theme.dart';

class AppThemeBlack extends AppTheme {
  AppTextStyle get textStyle => AppTextStyle.share;

  @override
  ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        // backgroundColor: neutral800,
        // primaryColor: primary,
        // dialogBackgroundColor: grey90,
        fontFamily: 'SF-REGULAR',
        appBarTheme: _buildAppBarTheme,
        bottomAppBarTheme: _buildBottomAppBarTheme,
        dialogTheme: _buildDialogTheme,
      );
  AppBarTheme get _buildAppBarTheme => AppBarTheme(
        elevation: 0,
        iconTheme: IconThemeData(color: backgroundColor),
        // textTheme: TextTheme(),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      );

  BottomAppBarTheme get _buildBottomAppBarTheme =>
      const BottomAppBarTheme(elevation: 0);

  DialogTheme get _buildDialogTheme => const DialogTheme(elevation: 0);

  @override
  Color get mainColor => const Color(0xffE8DDD9);

  @override
  Color get backgroundColor => const Color(0xFF833500);

  @override
  Color get colorA8B95A => const Color(0xffA8B95A);

  @override
  Color get color9BB068 => const Color(0xff9BB068);

  @override
  Color get whiteColor => Colors.white;

  @override
  Color get color3F3C36 => const Color(0xff3F3C36);

  @override
  Color get color9BB168 => const Color(0xff9BB168);

  @override
  Color get colorED7E1C => const Color(0xFFED7E1C);

  @override
  Color get colorA694F5 => const Color(0xFFA694F5);

  @override
  Color get colorC0A091 => const Color(0xFFC0A091);

  @override
  Color get colorFFCE5C => const Color(0xFFFFCE5C);

  @override
  Color get color736B66 => const Color(0xff736B66);

  @override
  Color get colorACA9A5 => const Color(0xffACA9A5);

  @override
  Color get color6F4E37 => Colors.brown;

  @override
  Color get colorCCCCCC => const Color(0xffCCCCCC);

  @override
  Color get colorFFD966 => const Color(0xffFFD966);

  @override
  Color get color333333 => const Color(0xff333333);

  @override
  Color get colorEDEDED => const Color(0xffEDEDED);

  @override
  Color get colorFFFFFF => const Color(0xffFFFFFF);

  @override
  Color get color444444 => const Color(0xff444444);

  @override
  Color get color8F5E9 => const Color(0xffE8F5E9);

  @override
  Color get colorED581 => const Color(0xffAED581);

  @override
  Color get color616161 => const Color(0xff616161);

  @override
  Color get colorEEEDEB => const Color(0xffEEEDEB);

  @override
  Color get colorEDE9E6 => const Color(0xffEDE9E6);

  @override
  Color get blackColor => Colors.black;
}
