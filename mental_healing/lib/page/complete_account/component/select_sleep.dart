import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/global/app_enum.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/complete_account/complete_account_controller.dart';

class SelectSleep extends StatefulWidget with BaseMixin {
  final CompleteAccountController controller =
      Get.put(CompleteAccountController());
  SelectSleep({super.key});

  @override
  _SelectSleepState createState() => _SelectSleepState();
}

class _SelectSleepState extends State<SelectSleep> {
  double _currentValue = 1; // Đặt giá trị mặc định là 1

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
                    level: LocaleKeys.worst.tr,
                    hours: LocaleKeys.less_than_three_hours.tr,
                    iconsColor: _currentValue.toInt() == 5
                        ? widget.color.colorA694F5
                        : widget.color.colorACA9A5,
                    icons: AssetIcons.clock,
                    moodIcons: AssetIcons.tiredIcon,
                    textColors: _currentValue.toInt() == 5
                        ? widget.color.colorA694F5
                        : widget.color.colorACA9A5),
                _rowWidget(
                    level: LocaleKeys.poor.tr,
                    hours: LocaleKeys.three_four_hours.tr,
                    iconsColor: _currentValue.toInt() == 4
                        ? widget.color.colorED7E1C
                        : widget.color.colorACA9A5,
                    icons: AssetIcons.clock,
                    moodIcons: AssetIcons.sadIcon,
                    textColors: _currentValue.toInt() == 4
                        ? widget.color.colorED7E1C
                        : widget.color.colorACA9A5),
                _rowWidget(
                    level: LocaleKeys.fair.tr,
                    hours: LocaleKeys.five_hours.tr,
                    iconsColor: _currentValue.toInt() == 3
                        ? widget.color.colorC0A091
                        : widget.color.colorACA9A5,
                    icons: AssetIcons.clock,
                    moodIcons: AssetIcons.neutralIcon,
                    textColors: _currentValue.toInt() == 3
                        ? widget.color.colorC0A091
                        : widget.color.colorACA9A5),
                _rowWidget(
                  level: LocaleKeys.good.tr,
                  hours: LocaleKeys.six_seven_hours.tr,
                  iconsColor: _currentValue.toInt() == 2
                      ? widget.color.colorFFCE5C
                      : widget.color.colorACA9A5,
                  icons: AssetIcons.clock,
                  moodIcons: AssetIcons.goodIcon,
                  textColors: _currentValue.toInt() == 2
                      ? widget.color.colorFFCE5C
                      : widget.color.colorACA9A5,
                ),
                _rowWidget(
                  level: LocaleKeys.excellent.tr,
                  hours: LocaleKeys.seven_nine_hours.tr,
                  moodIcons: AssetIcons.greatIcon,
                  iconsColor: _currentValue.toInt() == 1
                      ? widget.color.color9BB168
                      : widget.color.colorACA9A5,
                  icons: AssetIcons.clock,
                  textColors: _currentValue.toInt() == 1
                      ? widget.color.color9BB168
                      : widget.color.colorACA9A5,
                ),
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
                    min: 1,
                    max: 5,
                    divisions: 4,
                    activeColor: _getActiveColor(),
                    inactiveColor: widget.color.colorEDE9E6,
                    onChanged: (double value) {
                      setState(() {
                        _currentValue = value;
                        _setSleepValue(_currentValue.toInt());
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

  void _setSleepValue(int value) {
    // Cập nhật giá trị sleep theo đúng yêu cầu
    switch (value) {
      case 1:
        widget.controller.setSleep(Sleep.sevenToNineHours);
        break;
      case 2:
        widget.controller.setSleep(Sleep.sixToSevenHours);
        break;
      case 3:
        widget.controller.setSleep(Sleep.fiveHours);
        break;
      case 4:
        widget.controller.setSleep(Sleep.threeToFourHours);
        break;
      case 5:
        widget.controller.setSleep(Sleep.lessThan3Hours);
        break;
      default:
        widget.controller.setSleep(Sleep.sevenToNineHours);
    }
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
                style: widget.textStyle.extraBold(
                  size: 18,
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
                    style: widget.textStyle.extraBold(
                      size: 12,
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
    // Đổi lại ánh xạ màu theo giá trị của _currentValue
    switch (_currentValue.toInt()) {
      case 1:
        return widget.color.color9BB168;
      case 2:
        return widget.color.colorFFCE5C;
      case 3:
        return widget.color.colorC0A091;
      case 4:
        return widget.color.colorED7E1C;
      case 5:
        return widget.color.colorA694F5;
      default:
        return widget.color.colorACA9A5;
    }
  }
}
