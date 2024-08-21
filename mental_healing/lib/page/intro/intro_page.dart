import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/generated/locales.g.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/intro/intro_controller.dart';

class IntroPage extends StatelessWidget {
  final IntroController controller = Get.put(IntroController());
  IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F4F2),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
          child: Column(
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
      ),
    );
  }

  Widget _textWidget(
      {required String title,
      required double size,
      required FontWeight weight,
      required Color color}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: weight,
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return Column(
      children: [
        _textWidget(
            title: LocaleKeys.welcome_message.tr,
            size: 20,
            weight: FontWeight.bold,
            color: const Color(0xff4F3422)),
        _textWidget(
            title: LocaleKeys.companion_description.tr,
            size: 18,
            weight: FontWeight.w400,
            color: const Color(0xff736B66)),
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
