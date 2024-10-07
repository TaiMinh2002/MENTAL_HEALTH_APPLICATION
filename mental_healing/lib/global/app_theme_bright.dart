import 'package:flutter/material.dart';
import 'app_text_style.dart';
import 'app_theme.dart';

class AppThemeBright extends AppTheme {
  AppTextStyle get textStyle => AppTextStyle.share;

  @override
  ThemeData get theme => ThemeData(
      // scaffoldBackgroundColor: background0,
      // backgroundColor: background0,
      // primaryColor: primary,
      // dialogBackgroundColor: grey90,
      appBarTheme: _buildAppBarTheme,
      bottomAppBarTheme: _buildBottomAppBarTheme,
      dialogTheme: _buildDialogTheme);
  AppBarTheme get _buildAppBarTheme => AppBarTheme(
        elevation: 0,
        iconTheme: IconThemeData(color: backgroundColor),
        // textTheme: TextTheme(),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      );
  BottomAppBarTheme get _buildBottomAppBarTheme =>
      const BottomAppBarTheme(elevation: 0, color: Colors.red);

  DialogTheme get _buildDialogTheme => const DialogTheme(elevation: 0);

  @override
  Color get mainColor => const Color(0xff4F3422);

  @override
  Color get backgroundColor => const Color(0xffF7F4F2);

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

  @override
  Color get color3C3D37 => const Color(0xff3C3D37);

  @override
  Color get colorD5C2B9 => const Color(0xffD5C2B9);

  @override
  Color get color926247 => const Color(0xff926247);

  @override
  Color get colorFE814B => const Color(0xffFE814B);

  @override
  Color get colorA18FFF => const Color(0xffA18FFF);

  @override
  Color get colorA5D6A7 => const Color(0xffA5D6A7);

  @override
  Color get colorC9C7C5 => const Color(0xffC9C7C5);

  @override
  Color get colorE5EAD7 => const Color(0xffE5EAD7);

  @override
  Color get colorFFC89E => const Color(0xffFFC89E);

  @override
  Color get colorE1E1E0 => const Color(0xffE1E1E0);

  @override
  Color get colorFFEBC2 => const Color(0xffFFEBC2);

  @override
  Color get colorDDD1FF => const Color(0xffDDD1FF);
}
