import 'package:mental_healing/import.dart';

mixin BaseMixin {
  AppTheme get color => Get.find<AppThemeBase>().theme;

  // bool get eb => LocalizationService.locale.languageCode == AppConst.langEN;

  AppTextStyle get textStyle => AppTextStyle.share;
}

mixin MixinWidget<T extends StatelessWidget> on BaseMixin {}
