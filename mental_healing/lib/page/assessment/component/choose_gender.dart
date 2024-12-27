import 'package:mental_healing/import.dart';

class ChooseGender extends StatefulWidget with BaseMixin {
  ChooseGender({super.key, required this.gender, required this.onChange});

  final int gender;
  final Function(int value) onChange;

  @override
  _ChooseGenderState createState() => _ChooseGenderState();
}

class _ChooseGenderState extends State<ChooseGender> {
  int selectedGender = -1;

  @override
  void initState() {
    super.initState();
    selectedGender = widget.gender;
  }

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
                value: 1),
            _chooseWidget(
                text: LocaleKeys.i_am_female.tr,
                icon: AssetIcons.female,
                image: AssetImages.woman,
                value: 2),
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
    required int value,
  }) {
    bool selected = selectedGender == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedGender == value) {
            selectedGender = 0;
            widget.onChange(0);
          } else {
            selectedGender = value;
            widget.onChange(value);
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
