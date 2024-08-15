import 'package:mental_healing/base_widget/header_app_widget.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/complete_account/component/select_mood.dart';

class ChooseMood extends StatelessWidget {
  const ChooseMood({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF7F4F2),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderAppWidget(title: 'Assessment', text: '3 of 5'),
              _bodyWidget(),
              SelectMood()
            ],
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
