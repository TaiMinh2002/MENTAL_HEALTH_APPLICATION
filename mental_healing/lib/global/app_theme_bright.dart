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
  Color get mainColor => const Color(0xFF3184F2);

  @override
  Color get black => const Color(0xFF000000);

  @override
  Color get backgroundColor => const Color(0xFFFFFFFF);

  @override
  Color get white => const Color(0xFFFFFFFF);

  @override
  Color get redColor => const Color(0xFFDD0000);

  @override
  Color get inActiveIndicator => const Color(0xFF4EA9F6);

  @override
  Color get color999999 => const Color(0xFF999999);

  @override
  Color get greyColor => const Color(0xFFD9D9D9);

  @override
  Color get color666666 => const Color(0xFF666666);

  @override
  Color get borderLightColor => const Color(0xFFD9D9D9);

  @override
  Color get inputColor => const Color(0xFFFCFCFC);

  @override
  Color get color14CCA1 => const Color(0xFF14CCA1);

  @override
  Color get colorD3B0E0 => const Color(0xFFD3B0E0);

  @override
  Color get colorF0FFFC => const Color(0xFFF0FFFC);

  @override
  Color get colorF5FCFF => const Color(0xFFF5FCFF);

  @override
  Color get colorFABD7C => const Color(0xFFFABD7C);

  @override
  Color get colorFCF3FF => const Color(0xFFFCF3FF);

  @override
  Color get colorFFF8F0 => const Color(0xFFFFF8F0);

  @override
  Color get color333333 => const Color(0xff333333);

  @override
  Color get disableButtonColor => const Color(0xFFF1F1F1);
}
