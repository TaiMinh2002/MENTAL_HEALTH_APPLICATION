import 'package:mental_healing/base_widget/header_app_widget.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/assessment/assessment_controller.dart';
import 'package:mental_healing/page/assessment/component/choose_age.dart';
import 'package:mental_healing/page/assessment/component/choose_gender.dart';
import 'package:mental_healing/page/assessment/component/choose_mood.dart';
import 'package:mental_healing/page/assessment/component/choose_sleep.dart';
import 'package:mental_healing/page/assessment/component/choose_stress.dart';
import 'package:mental_healing/page/assessment/component/professional_help_request.dart';

class AssessmentPage extends BaseScreen<AssessmentController> with BaseMixin {
  late final List<Widget> pages;

  AssessmentPage({super.key}) {
    pages = [
      ChooseGender(
        gender: controller.gender.value,
        onChange: controller.setGender,
      ),
      ChooseAge(
        age: controller.age.value,
        onChange: controller.setAge,
      ),
      ChooseMood(
        onChange: controller.setMood,
      ),
      ChooseSleep(
        onChange: controller.setSleep,
      ),
      ChooseStress(
        onChange: controller.setStress,
      ),
      ProfessionalHelpRequest(
        onChange: controller.setProfessionalRequest,
      ),
    ];
  }

  @override
  Widget builder() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        body: Obx(() => SingleChildScrollView(
              child: Column(
                children: [
                  HeaderAppWidget(
                    title: 'Assessment',
                    text: '${controller.currentPage.value + 1}/${pages.length}',
                    onTap: controller.onContinue,
                    onTapBack: controller.onBack,
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
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
    );
  }

  @override
  AssessmentController? putController() => AssessmentController();
}
