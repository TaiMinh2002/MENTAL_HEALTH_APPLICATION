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
        'text': 'Personalize Your Mental Health State With AI',
        'step': 'Step 1',
        'indicator': AssetImages.indicatorIntro1,
      },
      {
        'image': AssetImages.intro2,
        'text': 'Intelligent Mood Tracking & AI Emotion Insights',
        'step': 'Step 2',
        'indicator': AssetImages.indicatorIntro2,
      },
      {
        'image': AssetImages.intro3,
        'text': 'Mindful Resources That Makes You Happy',
        'step': 'Step 3',
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
