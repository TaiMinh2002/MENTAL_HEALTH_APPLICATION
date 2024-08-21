import 'package:mental_healing/generated/locales.g.dart';
import 'package:mental_healing/import.dart';

class SelectSleep extends StatefulWidget {
  const SelectSleep({super.key});

  @override
  _SelectSleepState createState() => _SelectSleepState();
}

class _SelectSleepState extends State<SelectSleep> {
  double _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _rowWidget(
                  level: LocaleKeys.excellent.tr,
                  hours: LocaleKeys.seven_nine_hours.tr,
                  moodIcons: AssetIcons.greatIcon,
                  iconsColor: _currentValue.toInt() == 4
                      ? const Color(0xff9BB168)
                      : const Color(0xffACA9A5),
                  icons: AssetIcons.clock,
                  textColors: _currentValue.toInt() == 4
                      ? const Color(0xff9BB168)
                      : const Color(0xffACA9A5),
                ),
                _rowWidget(
                  level: LocaleKeys.good.tr,
                  hours: LocaleKeys.six_seven_hours.tr,
                  iconsColor: _currentValue.toInt() == 3
                      ? const Color(0xffFFCE5C)
                      : const Color(0xffACA9A5),
                  icons: AssetIcons.clock,
                  moodIcons: AssetIcons.goodIcon,
                  textColors: _currentValue.toInt() == 3
                      ? const Color(0xffFFCE5C)
                      : const Color(0xffACA9A5),
                ),
                _rowWidget(
                    level: LocaleKeys.fair.tr,
                    hours: LocaleKeys.five_hours.tr,
                    iconsColor: _currentValue.toInt() == 2
                        ? const Color(0xffC0A091)
                        : const Color(0xffACA9A5),
                    icons: AssetIcons.clock,
                    moodIcons: AssetIcons.neutralIcon,
                    textColors: _currentValue.toInt() == 2
                        ? const Color(0xffC0A091)
                        : const Color(0xffACA9A5)),
                _rowWidget(
                    level: LocaleKeys.poor.tr,
                    hours: LocaleKeys.three_four_hours.tr,
                    iconsColor: _currentValue.toInt() == 1
                        ? const Color(0xffED7E1C)
                        : const Color(0xffACA9A5),
                    icons: AssetIcons.clock,
                    moodIcons: AssetIcons.sadIcon,
                    textColors: _currentValue.toInt() == 1
                        ? const Color(0xffED7E1C)
                        : const Color(0xffACA9A5)),
                _rowWidget(
                    level: LocaleKeys.worst.tr,
                    hours: LocaleKeys.less_than_three_hours.tr,
                    iconsColor: _currentValue.toInt() == 0
                        ? const Color(0xffA694F5)
                        : const Color(0xffACA9A5),
                    icons: AssetIcons.clock,
                    moodIcons: AssetIcons.tiredIcon,
                    textColors: _currentValue.toInt() == 0
                        ? const Color(0xffA694F5)
                        : const Color(0xffACA9A5)),
              ],
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 15,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: RotatedBox(
                quarterTurns: 3,
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 20.0,
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 30.0),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 10.0),
                  ),
                  child: Slider(
                    value: _currentValue,
                    min: 0,
                    max: 4,
                    divisions: 4,
                    activeColor: _getActiveColor(),
                    inactiveColor: const Color(0xffEDE9E6),
                    onChanged: (double value) {
                      setState(() {
                        _currentValue = value;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rowWidget({
    required String level,
    required String hours,
    required String moodIcons,
    required Color textColors,
    required Color iconsColor,
    required String icons,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                level,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: textColors,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    icons,
                    colorFilter: ColorFilter.mode(iconsColor, BlendMode.srcIn),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    hours,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: textColors,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SvgPicture.asset(moodIcons),
        ],
      ),
    );
  }

  Color _getActiveColor() {
    switch (_currentValue.toInt()) {
      case 4:
        return const Color(0xff9BB168);
      case 3:
        return const Color(0xffFFCE5C);
      case 2:
        return const Color(0xffC0A091);
      case 1:
        return const Color(0xffED7E1C);
      case 0:
        return const Color(0xffA694F5);
      default:
        return const Color(0xffACA9A5);
    }
  }
}
