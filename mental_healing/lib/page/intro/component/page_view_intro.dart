import 'package:mental_healing/generated/locales.g.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/intro/component/intro_item.dart';
import 'package:mental_healing/page/intro/intro_controller.dart';

class PageViewIntro extends StatelessWidget {
  final IntroController controller = Get.put(IntroController());
  PageViewIntro({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> introItems = [
      {
        'image': AssetImages.intro1,
        'text': LocaleKeys.personalize_journey.tr,
        'step': LocaleKeys.step_1.tr,
        'indicator': AssetImages.indicatorIntro1,
      },
      {
        'image': AssetImages.intro2,
        'text': LocaleKeys.smart_tracking.tr,
        'step': LocaleKeys.step_2.tr,
        'indicator': AssetImages.indicatorIntro2,
      },
      {
        'image': AssetImages.intro3,
        'text': LocaleKeys.mindful_resources.tr,
        'step': LocaleKeys.step_3.tr,
        'indicator': AssetImages.indicatorIntro3,
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
          indicator: item['indicator']!,
        );
      },
    );
  }
}
