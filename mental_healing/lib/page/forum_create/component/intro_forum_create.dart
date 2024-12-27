import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/forum_create/forum_create_controller.dart';

class IntroForumCreate extends BaseScreen<ForumCreateController>
    with BaseMixin {
  IntroForumCreate({super.key});

  @override
  Widget builder() {
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

  @override
  ForumCreateController? putController() => ForumCreateController();
}
