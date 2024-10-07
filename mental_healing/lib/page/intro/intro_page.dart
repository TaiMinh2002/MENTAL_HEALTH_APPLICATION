import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/intro/intro_controller.dart';

class IntroPage extends StatelessWidget with BaseMixin {
  final IntroController controller = Get.put(IntroController());
  IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetIcons.getStartHeader),
            _bodyWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
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
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: title == LocaleKeys.welcome_message.tr
            ? textStyle.bold(size: 20, color: color.mainColor)
            : textStyle.regular(
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
      child: ButtonWidget(
        onClick: controller.moveToIntro,
        textSize: 18,
        title: LocaleKeys.get_start.tr,
        suffixIcon: AssetIcons.next,
        height: 55,
        width: 180,
      ),
    );
  }
}
