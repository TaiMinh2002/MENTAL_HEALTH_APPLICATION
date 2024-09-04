import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/complete_account/complete_account_controller.dart';
import 'package:mental_healing/page/complete_account/component/select_sleep.dart';

class ChooseSleep extends StatelessWidget with BaseMixin {
  final CompleteAccountController controller =
      Get.put(CompleteAccountController());
  ChooseSleep({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [_bodyWidget(), SelectSleep()],
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
