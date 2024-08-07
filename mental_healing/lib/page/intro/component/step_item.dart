import 'package:flutter/material.dart';

class StepItem extends StatelessWidget {
  const StepItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 95,
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: const Color(0xff4F3422)),
          borderRadius: const BorderRadius.all(Radius.circular(32))),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xff4F3422),
          ),
        ),
      ),
    );
  }
}
