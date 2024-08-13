import 'package:flutter/cupertino.dart';
import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/base_widget/header_app_widget.dart';
import 'package:mental_healing/import.dart';

class ChooseAge extends StatefulWidget {
  const ChooseAge({super.key});

  @override
  State<ChooseAge> createState() => _ChooseAgeState();
}

class _ChooseAgeState extends State<ChooseAge> {
  int selectedAge = 20;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF7F4F2),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HeaderAppWidget(title: 'Assessment', text: '2 of 5'),
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
            _bottomWidget(),
          ],
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return const Padding(
      padding: EdgeInsets.only(top: 40.0, left: 10, right: 10),
      child: Text(
        'What’s your age?',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: Color(0xff4F3422)),
      ),
    );
  }

  Widget _bottomWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Column(
        children: [
          ButtonWidget(
            onClick: () {
              Get.toNamed(AppRouter.routerChooseMood);
            },
            margin: const EdgeInsets.only(top: 10),
            textSize: 18,
            title: 'Continue',
            suffixIcon: AssetIcons.next,
            height: 55,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
