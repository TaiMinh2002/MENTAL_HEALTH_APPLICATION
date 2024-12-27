import 'package:mental_healing/global/app_enum.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/assessment/component/select_mood.dart';

class ChooseMood extends BaseWidget with BaseMixin {
  ChooseMood({super.key, required this.onChange});

  final Function(Mood value) onChange;

  @override
  Widget builder() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [_bodyWidget(), SelectMood(onChange: onChange)],
          ),
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 10, right: 10),
      child: Text(
        LocaleKeys.describe_mood.tr,
        textAlign: TextAlign.center,
        style: textStyle.extraBold(size: 28, color: color.mainColor),
      ),
    );
  }
}
