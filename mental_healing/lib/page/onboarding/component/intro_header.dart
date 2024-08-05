import 'package:flutter/material.dart';

class IntroHeader extends StatelessWidget {
  const IntroHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 96,
        height: 40,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff4F3422)),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
