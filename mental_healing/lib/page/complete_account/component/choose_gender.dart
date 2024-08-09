import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/base_widget/header_app_widget.dart';
import 'package:mental_healing/import.dart';

class ChooseGender extends StatefulWidget {
  const ChooseGender({super.key});

  @override
  _ChooseGenderState createState() => _ChooseGenderState();
}

class _ChooseGenderState extends State<ChooseGender> {
  String? isSelect;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF7F4F2),
        body: Column(
          children: [
            const HeaderAppWidget(title: 'Assessment', text: '1 of 5'),
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
            _bottomWidget()
          ],
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return const Padding(
      padding: EdgeInsets.only(top: 40.0),
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
            isSelect = null; // Deselect if already selected
          } else {
            isSelect = value; // Select the tapped widget
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
                      color: Color(0xff4F3422).withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
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

  Widget _bottomWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Column(
        children: [
          ButtonWidget(
            onClick: () {},
            textSize: 18,
            title: 'Prefer to skip, thanks',
            suffixIcon: AssetIcons.cancel,
            height: 55,
            bgColor: Color(0xffE5EAD7),
            textColor: Color(0xff9BB168),
            width: double.infinity,
          ),
          ButtonWidget(
            onClick: () {
              Get.toNamed(AppRouter.routerChooseAge);
            },
            margin: EdgeInsets.only(top: 10),
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
