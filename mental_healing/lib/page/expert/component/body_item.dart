import 'package:flutter/material.dart';
import 'package:mental_healing/base/base_mixin.dart';

class BodyItem extends StatelessWidget with BaseMixin {
  const BodyItem({super.key, required this.title, required this.widget});

  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 50, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textStyle.bold(size: 16, color: color.mainColor),
          ),
          widget
        ],
      ),
    );
  }
}
