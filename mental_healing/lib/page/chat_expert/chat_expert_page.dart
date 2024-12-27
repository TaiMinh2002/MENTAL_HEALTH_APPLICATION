import 'package:intl/intl.dart';
import 'package:mental_healing/base_widget/app_bar_custom.dart';
import 'package:mental_healing/controller/global_data_manager.dart';
import 'package:mental_healing/data/model/chat_expert_info.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/chat_expert/chat_expert_controller.dart';

class ChatExpertPage extends BaseScreen<ChatExpertController> with BaseMixin {
  ChatExpertPage({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget builder() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        appBar: AppBarCustom(
          titleAppBar: controller.listConversions.isNotEmpty
              ? _getReceiverName(controller)
              : LocaleKeys.chat.tr,
          centerTitle: false,
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                final messages = controller.listConversions;

                return ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.all(16.r),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isMe = message.sender_id ==
                        GlobalDataManager().userInfo.value.id;

                    return Align(
                      alignment:
                          isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(12.r),
                        margin: EdgeInsets.only(bottom: 10.r),
                        decoration: BoxDecoration(
                          color: isMe ? color.colorA5D6A7 : Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          crossAxisAlignment: isMe
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Text(
                              message.message ?? '',
                            ),
                            const SizedBox(height: 5),
                            Text(
                              _formatTimestamp(message.created_at),
                              style: textStyle.regular(
                                  size: 10, color: color.blackColor),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),

            // Thanh nhập tin nhắn
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
                            onTap: () {
                              // Mở giao diện cảm xúc (nếu cần)
                            },
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
                              onSubmitted: (value) async {
                                if (value.trim().isNotEmpty) {
                                  await controller.sendMessage(value.trim());
                                  _scrollToBottom();
                                }
                              },
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
                            _scrollToBottom();
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

  String _getReceiverName(ChatExpertController controller) {
    final currentUserId = GlobalDataManager().userInfo.value.id;

    final receiverMessage = controller.listConversions.firstWhere(
      (msg) => true,
      orElse: () => ChatExpertInfo(
          receiver: LocaleKeys.chat.tr, sender: LocaleKeys.chat.tr),
    );

    if (receiverMessage.sender_id == currentUserId) {
      return receiverMessage.receiver ?? LocaleKeys.chat.tr;
    } else {
      return receiverMessage.sender ?? LocaleKeys.chat.tr;
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      Future.delayed(const Duration(milliseconds: 300), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  String _formatTimestamp(String? timestamp) {
    final utcDate = DateTime.parse(timestamp ?? '');
    final localDate = utcDate.toLocal();
    return DateFormat('HH:mm').format(localDate);
  }

  @override
  ChatExpertController? putController() => ChatExpertController();
}
