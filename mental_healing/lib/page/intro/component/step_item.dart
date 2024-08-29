import 'package:flutter/material.dart';
import 'package:mental_healing/base/base_mixin.dart';

class StepItem extends StatelessWidget with BaseMixin {
  const StepItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 95,
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: color.mainColor),
          borderRadius: const BorderRadius.all(Radius.circular(32))),
      child: Center(
        child: Text(
          title,
          style: textStyle.bold(
            size: 16,
            color: color.mainColor,
          ),
        ),
      ),
    );
  }
}
