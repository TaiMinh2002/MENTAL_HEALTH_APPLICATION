import 'package:flutter/material.dart';
import 'package:mental_healing/page/onboarding/component/intro_header.dart';
import 'package:mental_healing/r.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AssetImages.intro1,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              IntroHeader(
                title: 'Step One',
              ),
              Image.asset(
                AssetImages.imageIntro1,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Container(
                color: Colors.white,
                height: 200,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
