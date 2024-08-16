import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/complete_account/complete_account_controller.dart';
import 'package:mental_healing/page/complete_account/component/select_mood.dart';

class ChooseMood extends StatelessWidget {
  final CompleteAccountController controller =
      Get.put(CompleteAccountController());
  ChooseMood({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF7F4F2),
        body: SingleChildScrollView(
          child: Column(
            children: [_bodyWidget(), SelectMood()],
          ),
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return const Padding(
      padding: EdgeInsets.only(top: 25.0, left: 10, right: 10),
      child: Text(
        'How would you\n describe your mood?',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: Color(0xff4F3422)),
      ),
    );
  }
}
