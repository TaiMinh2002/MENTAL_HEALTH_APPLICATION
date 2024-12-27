import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/assessment/component/select_stress.dart';

class ChooseStress extends BaseWidget with BaseMixin {
  ChooseStress({super.key, required this.onChange});

  final Function(int value) onChange;

  @override
  Widget builder() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [_bodyWidget(), SelectStress(onChange: onChange)],
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
        LocaleKeys.rate_stress_level.tr,
        textAlign: TextAlign.center,
        style: textStyle.extraBold(size: 28, color: color.mainColor),
      ),
    );
  }
}
