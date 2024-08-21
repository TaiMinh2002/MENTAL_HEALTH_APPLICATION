import 'package:flutter/cupertino.dart';
import 'package:mental_healing/generated/locales.g.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/complete_account/complete_account_controller.dart';

class ChooseAge extends StatefulWidget {
  const ChooseAge({super.key});

  @override
  State<ChooseAge> createState() => _ChooseAgeState();
}

class _ChooseAgeState extends State<ChooseAge> {
  final CompleteAccountController controller =
      Get.put(CompleteAccountController());
  int selectedAge = 20;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF7F4F2),
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
                                color: const Color(0xffA8B95A),
                                borderRadius: BorderRadius.circular(35),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xff9BB068)
                                        .withOpacity(0.25),
                                    spreadRadius: 2,
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              )
                            : null,
                        child: Text(
                          '$age',
                          style: TextStyle(
                            fontSize: isSelected ? 48 : 28,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xff4F3422),
                          ),
                        ),
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
        style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: Color(0xff4F3422)),
      ),
    );
  }
}
