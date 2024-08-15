import 'package:flutter/material.dart';
import 'package:mental_healing/base_widget/header_app_widget.dart';
import 'package:mental_healing/page/complete_account/component/select_sleep.dart';

class ChooseSleep extends StatelessWidget {
  const ChooseSleep({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF7F4F2),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderAppWidget(
                title: 'Assessment',
                text: '4 of 5',
              ),
              _bodyWidget(),
              SelectSleep()
            ],
          ),
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return const Padding(
      padding: EdgeInsets.only(top: 30.0, left: 10, right: 10, bottom: 30),
      child: Text(
        'How would you rate your sleep quality?',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: Color(0xff4F3422)),
      ),
    );
  }
}
