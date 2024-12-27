import 'package:mental_healing/controller/global_data_manager.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/message/component/message_list_item.dart';
import 'package:mental_healing/page/message/message_controller.dart';

class MessagePage extends BaseScreen<MessageController> with BaseMixin {
  MessagePage({super.key});

  @override
  Widget builder() {
    return SafeArea(
      child: Scaffold(
          backgroundColor: color.backgroundColor,
          body: Obx(
            () => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_headerWidget(), _messageWidget()],
              ),
            ),
          )),
    );
  }

  Widget _headerWidget() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 12.0, right: 30, top: 25, bottom: 20),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.whiteColor,
            backgroundImage: GlobalDataManager().userInfo.value.avatar != null
                ? NetworkImage(GlobalDataManager().userInfo.value.avatar ?? '')
                : const AssetImage(AssetImages.noPerson) as ImageProvider,
            radius: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Obx(() => Text(
                  GlobalDataManager().userInfo.value.username ?? '',
                  style: textStyle.bold(size: 20, color: color.blackColor),
                )),
          ),
          const Expanded(child: SizedBox()),
          SvgPicture.asset(
            AssetIcons.notificationMessage,
            height: 30,
            width: 30,
          )
        ],
      ),
    );
  }

  Widget _messageWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 25, top: 42),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Text(
              LocaleKeys.messages.tr,
              style: textStyle.bold(size: 30),
            ),
          ),
          Obx(() => ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.listChats.length,
                itemBuilder: (context, index) {
                  final chat = controller.listChats[index];
                  return MessageListItem(
                    name: chat.expert_name ?? '',
                    avatar: chat.expert_avatar ?? '',
                    latestMessage: chat.latest_message ?? '',
                    onTap: () {
                      controller.moveToChat(chat);
                    },
                  );
                },
              )),
        ],
      ),
    );
  }

  @override
  MessageController? putController() => MessageController();
}
