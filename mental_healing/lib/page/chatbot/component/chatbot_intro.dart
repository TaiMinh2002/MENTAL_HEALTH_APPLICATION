import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/base_widget/app_bar_custom.dart';
import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/import.dart';

class ChatbotIntro extends StatelessWidget with BaseMixin {
  const ChatbotIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarCustom(
          titleAppBar: LocaleKeys.ai_chatbot.tr,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetImages.chatbotIntro),
            Padding(
              padding: const EdgeInsets.only(top: 50.0, bottom: 10),
              child: Text(
                LocaleKeys.talk_to_doctor_ai.tr,
                style: textStyle.extraBold(size: 24),
              ),
            ),
            Text(
              LocaleKeys.no_ai_conversations.tr,
              textAlign: TextAlign.center,
              style: textStyle.medium(size: 16),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0, right: 10, left: 10),
              child: ButtonWidget(
                onClick: () {
                  Get.offNamed(AppRouter.routerChatbotPage);
                },
                textSize: 18,
                textColor: color.whiteColor,
                title: LocaleKeys.start_talking.tr,
                height: 55,
                width: double.infinity,
                bgColor: color.colorFE814B,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
