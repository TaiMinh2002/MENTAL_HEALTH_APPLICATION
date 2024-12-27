import 'package:mental_healing/base_widget/app_bar_custom.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/chatbot/chatbot_controller.dart';

class ChatbotPage extends BaseScreen<ChatbotController> with BaseMixin {
  ChatbotPage({super.key});

  @override
  Widget builder() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        appBar: AppBarCustom(
          titleAppBar: LocaleKeys.doctor_ai.tr,
          centerTitle: false,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Obx(() {
                final messages = controller.listConversions;
                return ListView.builder(
                  padding: EdgeInsets.all(16.r),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: EdgeInsets.all(12.r),
                            margin: EdgeInsets.only(bottom: 10.r),
                            decoration: BoxDecoration(
                              color: color.colorA5D6A7,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Text(message.user_message ?? ''),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.all(12.r),
                            margin: EdgeInsets.only(bottom: 10.r),
                            decoration: BoxDecoration(
                              color: color.whiteColor,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Text(message.bot_reply ?? ''),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, bottom: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: SvgPicture.asset(
                                AssetIcons.insertEmotion,
                                colorFilter: ColorFilter.mode(
                                    color.blackColor, BlendMode.srcIn),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: controller.messageController,
                              decoration: InputDecoration(
                                hintText: LocaleKeys.type_to_chat.tr,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: CircleAvatar(
                      backgroundColor: color.color9BB068,
                      child: GestureDetector(
                        onTap: () async {
                          final userMessage =
                              controller.messageController.text.trim();
                          if (userMessage.isNotEmpty) {
                            await controller.sendMessage(userMessage);
                            controller.messageController.clear();
                          }
                        },
                        child: SvgPicture.asset(AssetIcons.sendMessage),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ChatbotController? putController() => ChatbotController();
}
