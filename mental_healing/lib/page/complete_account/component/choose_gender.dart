import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/complete_account/complete_account_controller.dart';

class ChooseGender extends StatefulWidget {
  ChooseGender({super.key});

  @override
  _ChooseGenderState createState() => _ChooseGenderState();
}

class _ChooseGenderState extends State<ChooseGender> {
  final CompleteAccountController controller =
      Get.put(CompleteAccountController());
  String? isSelect;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF7F4F2),
        body: Column(
          children: [
            _bodyWidget(),
            _chooseWidget(
                text: 'I am Male',
                icon: AssetIcons.male,
                image: AssetImages.man,
                value: 'male'),
            _chooseWidget(
                text: 'I am Female',
                icon: AssetIcons.female,
                image: AssetImages.woman,
                value: 'female'),
          ],
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return const Padding(
      padding: EdgeInsets.only(top: 40.0, left: 10, right: 10),
      child: Text(
        'What’s your official gender?',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: Color(0xff4F3422)),
      ),
    );
  }

  Widget _chooseWidget({
    required String text,
    required String icon,
    required String image,
    required String value,
  }) {
    bool selected = isSelect == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelect == value) {
            isSelect = null;
          } else {
            isSelect = value;
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff3F3C36)),
            borderRadius: const BorderRadius.all(Radius.circular(32)),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: const Color(0xff4F3422).withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    )
                  ]
                : [],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [Text(text), SvgPicture.asset(icon)],
                ),
              ),
              Expanded(
                  child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(32),
                    topRight: Radius.circular(32)),
                child: Image.asset(image),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
