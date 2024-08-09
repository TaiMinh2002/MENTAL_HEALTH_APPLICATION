import 'package:flutter/material.dart';
import 'package:mental_healing/base_widget/back_button.dart';

class HeaderAppWidget extends StatelessWidget {
  const HeaderAppWidget({super.key, this.text, this.title});
  final String? text;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BackButtonWidget(),
        Text(
          title ?? '',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Color(0xff4F3422)),
        ),
        Expanded(child: SizedBox()),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          padding: EdgeInsets.symmetric(vertical: 5.5, horizontal: 10),
          decoration: BoxDecoration(
              color: Color(0xffE8DDD9),
              borderRadius: BorderRadius.all(Radius.circular(32))),
          child: Text(
            text ?? '',
          ),
        )
      ],
    );
  }
}
