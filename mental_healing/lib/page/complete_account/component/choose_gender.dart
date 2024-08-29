import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/complete_account/complete_account_controller.dart';

class ChooseGender extends StatefulWidget with BaseMixin {
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
        backgroundColor: widget.color.backgroundColor,
        body: Column(
          children: [
            _bodyWidget(),
            _chooseWidget(
                text: LocaleKeys.i_am_male.tr,
                icon: AssetIcons.male,
                image: AssetImages.man,
                value: 'male'),
            _chooseWidget(
                text: LocaleKeys.i_am_female.tr,
                icon: AssetIcons.female,
                image: AssetImages.woman,
                value: 'female'),
          ],
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 10, right: 10),
      child: Text(
        LocaleKeys.official_gender.tr,
        textAlign: TextAlign.center,
        style:
            widget.textStyle.extraBold(size: 28, color: widget.color.mainColor),
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
            border: Border.all(color: widget.color.color3F3C36),
            borderRadius: const BorderRadius.all(Radius.circular(32)),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: widget.color.mainColor.withOpacity(0.5),
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
