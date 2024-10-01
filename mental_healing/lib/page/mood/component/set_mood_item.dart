import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/import.dart';

class SetMoodItem extends StatefulWidget with BaseMixin {
  const SetMoodItem({super.key});

  @override
  State<SetMoodItem> createState() => _SetMoodItemState();
}

class _SetMoodItemState extends State<SetMoodItem> {
  int selectedMoodIndex = 0;
  final List<String> moodDescriptions = [
    LocaleKeys.feeling_depressed.tr,
    LocaleKeys.feeling_sad.tr,
    LocaleKeys.feeling_neutral.tr,
    LocaleKeys.feeling_happy.tr,
    LocaleKeys.feeling_overjoyed.tr,
  ];
  final List<String> moodIcons = [
    AssetIcons.tiredEmotion,
    AssetIcons.sadEmotion,
    AssetIcons.neutralEmotion,
    AssetIcons.happyEmotion,
    AssetIcons.greatEmotion,
  ];
  final List<Color> backgroundColors = [
    const Color(0xffA18FFF),
    const Color(0xffFE814B),
    const Color(0xff926247),
    const Color(0xffFFCE5C),
    const Color(0xff9BB068),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColors[selectedMoodIndex],
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.how_feeling_today.tr,
                  textAlign: TextAlign.center,
                  style: widget.textStyle
                      .extraBold(size: 36, color: widget.color.whiteColor),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: SvgPicture.asset(
                    moodIcons[selectedMoodIndex],
                  ),
                ),
                Text(
                  moodDescriptions[selectedMoodIndex],
                  style: widget.textStyle
                      .semiBold(size: 24, color: widget.color.whiteColor),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Slider(
                    value: selectedMoodIndex.toDouble(),
                    min: 0,
                    max: 4,
                    divisions: 4,
                    onChanged: (value) {
                      setState(() {
                        selectedMoodIndex = value.toInt();
                      });
                    },
                  ),
                ),
                ButtonWidget(
                  onClick: () {},
                  textSize: 18,
                  textColor: widget.color.mainColor,
                  title: LocaleKeys.set_mood.tr,
                  suffixIcon: AssetIcons.tick,
                  height: 55,
                  width: double.infinity,
                  bgColor: widget.color.whiteColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
