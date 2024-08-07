import 'package:flutter/material.dart';
import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/intro/intro_controller.dart';

class IntroPage extends StatelessWidget {
  final IntroController controller = Get.put(IntroController());
  IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F4F2),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
          child: Column(
            children: [
              SvgPicture.asset(AssetIcons.getStartHeader),
              _bodyWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
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
      {required String titleTop,
      required String titleUnder,
      required double size,
      required FontWeight weight,
      required Color color}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: titleTop,
              style: TextStyle(
                fontSize: size,
                color: color,
                fontWeight: weight,
              ),
            ),
            TextSpan(
              text: titleUnder,
              style: TextStyle(
                fontSize: size,
                fontWeight: weight,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return Column(
      children: [
        _textWidget(
            titleTop: 'Welcome to the CUHK',
            titleUnder: 'AI Therapist ',
            size: 30,
            weight: FontWeight.bold,
            color: Color(0xff4F3422)),
        _textWidget(
            titleTop: 'Your mindful mental health AI companion',
            titleUnder: 'for everyone, anywhere 🍃',
            size: 18,
            weight: FontWeight.w400,
            color: Color(0xff736B66)),
      ],
    );
  }

  Widget _buttonWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: ButtonWidget(
        onClick: controller.moveToIntro,
        textSize: 18,
        title: 'Get Start',
        suffixIcon: AssetIcons.next,
        height: 55,
        width: 180,
      ),
    );
  }
}
