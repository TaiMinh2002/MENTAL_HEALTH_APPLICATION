import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/base_widget/header_app_widget.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/complete_account/complete_account_controller.dart';
import 'package:mental_healing/page/complete_account/component/choose_age.dart';
import 'package:mental_healing/page/complete_account/component/choose_gender.dart';
import 'package:mental_healing/page/complete_account/component/choose_mood.dart';
import 'package:mental_healing/page/complete_account/component/choose_sleep.dart';
import 'package:mental_healing/page/complete_account/component/choose_stress.dart';
import 'package:mental_healing/page/complete_account/component/professional_help_request.dart';

class CompleteAccountPage extends StatelessWidget with BaseMixin {
  final List<Widget> pages = [
    ChooseGender(),
    ChooseAge(),
    ChooseMood(),
    ChooseSleep(),
    ChooseStress(),
    ProfessionalHelpRequest(),
  ];
  CompleteAccountPage({super.key});

  final CompleteAccountController _controller =
      Get.put(CompleteAccountController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        body: Obx(() => SingleChildScrollView(
              child: Column(
                children: [
                  HeaderAppWidget(
                    title: 'Assessment',
                    text:
                        '${_controller.currentPage.value + 1}/${pages.length}',
                    onTap: _controller.onContinue,
                    onTapBack: _controller.onBack,
                  ),
                  _pageViewWidget(context),
                ],
              ),
            )),
      ),
    );
  }

  Widget _pageViewWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      child: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller.pageController,
        onPageChanged: _controller.onPageChanged,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
    );
  }
}
