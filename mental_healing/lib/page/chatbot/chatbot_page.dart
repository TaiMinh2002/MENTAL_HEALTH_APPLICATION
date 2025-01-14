import 'package:mental_healing/base_widget/app_bar_custom.dart';
import 'package:mental_healing/common/widget_components/animated_list/widget_animated_list.dart';
import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_widget.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/chatbot/chatbot_controller.dart';

class ChatbotPage extends BaseScreen<ChatbotController>
    with SmartLoadListWidget {
  ChatbotPage({super.key});

  @override
  Widget builder() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        appBar: _buildAppBar,
        body: Column(
          children: [
            _buildSmartList(),
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

  PreferredSizeWidget get _buildAppBar => PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarCustom(
          elevation: 0,
          titleAppBar: LocaleKeys.doctor_ai.tr,
          centerTitle: false,
        ),
      );

  Widget _buildSmartList() {
    return buildSmartListExpanded(controller,
        enablePullDown: true,
        enablePullUp: controller.hasMorePage.value,
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, top: 30.h, bottom: 30.h),
          child: _buildList(),
        ));
  }

  Widget _buildList() {
    return Obx(
      () => WidgetAnimatedList(
        itemCount: controller.dataList.length,
        isExpanded: false,
        isLoading: controller.loading.loadingCtrl.value,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: Get.width * 4 / 5,
                  ),
                  padding: EdgeInsets.all(12.r),
                  margin: EdgeInsets.only(bottom: 10.r),
                  decoration: BoxDecoration(
                    color: color.colorA5D6A7,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(controller.dataList[index].user_message ?? ''),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: Get.width * 4 / 5,
                  ),
                  padding: EdgeInsets.all(12.r),
                  margin: EdgeInsets.only(bottom: 10.r),
                  decoration: BoxDecoration(
                    color: color.whiteColor,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(controller.dataList[index].bot_reply ?? ''),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  ChatbotController? putController() => ChatbotController();
}
