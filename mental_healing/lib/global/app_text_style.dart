import 'package:mental_healing/import.dart';

class AppTextStyle {
  static final AppTextStyle share = AppTextStyle();
  TextStyle extraBold({
    double? size,
    Color? color,
    Color? backgroundColor,
    double? height,
  }) =>
      custom(
        size: size,
        color: color,
        fontWeight: FontWeight.w800,
        backgroundColor: backgroundColor,
        height: height,
      );

  TextStyle bold({
    double? size,
    Color? color,
    Color? backgroundColor,
    double? height,
    TextDecoration? decoration,
  }) =>
      custom(
        size: size,
        color: color,
        fontWeight: FontWeight.w700,
        backgroundColor: backgroundColor,
        height: height,
        decoration: decoration,
      );

  TextStyle semiBold({
    double? size,
    Color? color,
    Color? backgroundColor,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    double? height,
  }) =>
      custom(
        size: size,
        color: color,
        fontWeight: FontWeight.w600,
        backgroundColor: backgroundColor,
        decoration: decoration,
        fontStyle: fontStyle,
        height: height,
      );
  TextStyle medium({
    double? size,
    Color? color,
    Color? backgroundColor,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    double? height,
  }) =>
      custom(
        size: size,
        color: color,
        fontWeight: FontWeight.w500,
        backgroundColor: backgroundColor,
        decoration: decoration,
        fontStyle: fontStyle,
        height: height,
      );

  TextStyle regular({
    double? size,
    Color? color,
    Color? backgroundColor,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    double? height,
  }) =>
      custom(
        size: size,
        color: color,
        fontWeight: FontWeight.w400,
        backgroundColor: backgroundColor,
        decoration: decoration,
        fontStyle: fontStyle,
        height: height,
      );

  TextStyle italic({
    double? size,
    Color? color,
    Color? backgroundColor,
  }) =>
      custom(
          size: size,
          color: color,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic,
          backgroundColor: backgroundColor);

  TextStyle regularUnderline({
    double? size,
    Color? color,
    Color? backgroundColor,
  }) =>
      custom(
          size: size,
          color: color,
          fontWeight: FontWeight.w600,
          backgroundColor: backgroundColor,
          decoration: TextDecoration.underline);

  TextStyle custom({
    double? size,
    Color? color,
    Color? backgroundColor,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? height,
    TextDecoration? decoration,
    String fontFamily = 'Roboto',
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontSize: (size ?? 14).sp,
      color: color ?? Colors.black,
      height: height ?? 1.2,
      decoration: decoration,
      fontFeatures: const <FontFeature>[
        FontFeature.tabularFigures(),
      ],
    );
  }
  // TextStyle custom({
  //   double? size,
  //   Color? color,
  //   Color? backgroundColor,
  //   FontWeight? fontWeight,
  //   FontStyle? fontStyle,
  //   TextDecoration? decoration,
  //   String fontFamily = '',
  //   double? height,
  // }) {
  //   return GoogleFonts.notoSans(
  //     fontWeight: fontWeight,
  //     fontStyle: fontStyle,
  //     fontSize: size ?? 14,
  //     backgroundColor: backgroundColor,
  //     color: color ?? appThemes.black,
  //     height: height ?? 1.2,
  //     decoration: decoration,
  //     fontFeatures: const <FontFeature>[
  //       FontFeature.tabularFigures(),
  //     ],
  //   );
  // }
}
