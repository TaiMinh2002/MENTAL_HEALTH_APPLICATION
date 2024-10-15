import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/community/forum_controller.dart';

class IntroForum extends StatelessWidget with BaseMixin {
  final ForumController controller = Get.put(ForumController());

  IntroForum({super.key});

  @override
  Widget build(BuildContext context) {
    // Khởi tạo text animation khi vào IntroForum
    controller.setupTextAnimation(LocaleKeys.welcome_forum_message.tr);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(AssetImages.introForum, fit: BoxFit.fill),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Obx(() => Text(
                      controller.displayedText.value,
                      style: textStyle.bold(size: 15, color: color.whiteColor),
                    )),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: GestureDetector(
                onTap: controller.handleSkip,
                child: Text(
                  LocaleKeys.skip.tr,
                  style: textStyle.bold(size: 14, color: color.whiteColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
