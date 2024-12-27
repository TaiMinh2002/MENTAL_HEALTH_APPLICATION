import 'package:mental_healing/global/app_enum.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/assessment/component/select_sleep.dart';

class ChooseSleep extends BaseWidget with BaseMixin {
  ChooseSleep({super.key, required this.onChange});
  final Function(Sleep value) onChange;

  @override
  Widget builder() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [_bodyWidget(), SelectSleep(onChange: onChange)],
          ),
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 30.0, left: 10, right: 10, bottom: 30),
      child: Text(
        LocaleKeys.rate_sleep_quality.tr,
        textAlign: TextAlign.center,
        style: textStyle.extraBold(size: 28, color: color.mainColor),
      ),
    );
  }
}
