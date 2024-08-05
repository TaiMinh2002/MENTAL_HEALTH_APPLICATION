import 'package:flutter/cupertino.dart';
import 'package:mental_healing/import.dart';

class CustomCupertinoSwitch extends StatefulWidget {
  const CustomCupertinoSwitch(
      {super.key, this.isSwitch = false, required this.onChangeSwitch});
  final bool isSwitch;
  final VoidCallback onChangeSwitch;
  @override
  State<CustomCupertinoSwitch> createState() => _CustomCupertinoSwitchState();
}

class _CustomCupertinoSwitchState extends State<CustomCupertinoSwitch>
    with BaseMixin {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 52,
      child: Transform.scale(
        scale: 0.8,
        alignment: Alignment.centerRight,
        child: CupertinoSwitch(
          value: widget.isSwitch,
          activeColor: color.mainColor,
          onChanged: (bool? value) {
            setState(() {
              widget.onChangeSwitch();
            });
          },
        ),
      ),
    );
  }
}
