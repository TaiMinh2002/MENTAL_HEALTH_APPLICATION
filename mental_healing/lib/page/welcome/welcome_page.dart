import 'package:mental_healing/common/widget_components/button/widget_button.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/welcome/welcome_controller.dart';

class WelcomePage extends BaseScreen<WelcomeController> with BaseMixin {
  WelcomePage({super.key});

  @override
  Widget builder() {
    return Scaffold(
      backgroundColor: color.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetIcons.iconWelcome),
            _bodyWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: SvgPicture.asset(AssetIcons.onboardingGetStart),
            ),
            _buttonWidget()
          ],
        ),
      ),
    );
  }

  Widget _textWidget({required String title}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: title == LocaleKeys.welcome_message.tr
            ? textStyle.bold(size: 30, color: color.mainColor)
            : textStyle.regular(
                size: 20,
                color: color.color736B66,
              ),
      ),
    );
  }

  Widget _bodyWidget() {
    return Column(
      children: [
        _textWidget(title: LocaleKeys.welcome_message.tr),
        _textWidget(title: LocaleKeys.companion_description.tr),
      ],
    );
  }

  Widget _buttonWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: WidgetButton(
        title: LocaleKeys.get_start.tr,
        textSize: 18,
        onClick: controller.handleBoarding,
        height: 60,
        width: 200,
      ),
    );
  }

  @override
  WelcomeController? putController() => WelcomeController();
}
