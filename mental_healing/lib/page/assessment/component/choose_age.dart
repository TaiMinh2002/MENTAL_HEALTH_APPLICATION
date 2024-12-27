import 'package:flutter/cupertino.dart';
import 'package:mental_healing/import.dart';

class ChooseAge extends StatefulWidget with BaseMixin {
  const ChooseAge({super.key, required this.onChange, required int age});
  final Function(int value) onChange;

  @override
  State<ChooseAge> createState() => _ChooseAgeState();
}

class _ChooseAgeState extends State<ChooseAge> {
  int selectedAge = 20;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: widget.color.backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _bodyWidget(),
            Expanded(
              child: Center(
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                    initialItem: selectedAge - 10,
                  ),
                  itemExtent: 100,
                  onSelectedItemChanged: (int value) {
                    setState(() {
                      selectedAge = value + 10;
                      widget.onChange(selectedAge);
                    });
                  },
                  children: List<Widget>.generate(61, (int index) {
                    int age = index + 10;
                    bool isSelected = age == selectedAge;
                    return Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: 200,
                        height: 70,
                        decoration: isSelected
                            ? BoxDecoration(
                                color: widget.color.colorA8B95A,
                                borderRadius: BorderRadius.circular(35),
                                boxShadow: [
                                  BoxShadow(
                                    color: widget.color.color9BB068
                                        .withOpacity(0.25),
                                    spreadRadius: 2,
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              )
                            : null,
                        child: Text('$age',
                            style: isSelected
                                ? widget.textStyle.bold(
                                    size: 48, color: widget.color.whiteColor)
                                : widget.textStyle.medium(
                                    size: 28, color: widget.color.mainColor)),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 10, right: 10),
      child: Text(
        LocaleKeys.whats_your_age.tr,
        textAlign: TextAlign.center,
        style:
            widget.textStyle.extraBold(size: 28, color: widget.color.mainColor),
      ),
    );
  }
}
