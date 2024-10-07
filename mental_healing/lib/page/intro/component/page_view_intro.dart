import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/intro/component/intro_item.dart';
import 'package:mental_healing/page/intro/intro_controller.dart';

class PageViewIntro extends StatelessWidget with BaseMixin {
  final IntroController controller = Get.put(IntroController());
  PageViewIntro({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> introItems = [
      {
        'image': AssetImages.introImage1,
        'text': LocaleKeys.personalize_journey.tr,
        'step': LocaleKeys.step_1.tr,
        'imageBackgroundColor': color.colorE5EAD7
      },
      {
        'image': AssetImages.introImage2,
        'text': LocaleKeys.smart_tracking.tr,
        'step': LocaleKeys.step_2.tr,
        'imageBackgroundColor': color.colorFFC89E
      },
      {
        'image': AssetImages.introImage3,
        'text': LocaleKeys.personal_mental_journaling.tr,
        'step': LocaleKeys.step_3.tr,
        'imageBackgroundColor': color.colorE1E1E0
      },
      {
        'image': AssetImages.introImage4,
        'text': LocaleKeys.mindful_resources.tr,
        'step': LocaleKeys.step_4.tr,
        'imageBackgroundColor': color.colorFFEBC2
      },
      {
        'image': AssetImages.introImage5,
        'text': LocaleKeys.caring_supportive_community.tr,
        'step': LocaleKeys.step_5.tr,
        'imageBackgroundColor': color.colorDDD1FF
      },
    ];

    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      itemCount: introItems.length,
      itemBuilder: (context, index) {
        final item = introItems[index];
        return IntroItem(
          image: item['image']!,
          text: item['text']!,
          step: item['step']!,
          indicator: controller.getIndicator(index),
          imageBackgroundColor: item['imageBackgroundColor'],
        );
      },
    );
  }
}
