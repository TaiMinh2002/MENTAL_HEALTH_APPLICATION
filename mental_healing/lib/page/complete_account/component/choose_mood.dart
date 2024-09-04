import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/complete_account/complete_account_controller.dart';
import 'package:mental_healing/page/complete_account/component/select_mood.dart';

class ChooseMood extends StatelessWidget with BaseMixin {
  final CompleteAccountController controller =
      Get.put(CompleteAccountController());
  ChooseMood({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [_bodyWidget(), SelectMood()],
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
