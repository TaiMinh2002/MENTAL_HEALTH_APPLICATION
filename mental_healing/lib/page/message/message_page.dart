import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/base_widget/widget_input_text.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/message/component/message_list_item.dart';
import 'package:mental_healing/page/message/message_controller.dart';

class MessagePage extends StatelessWidget with BaseMixin {
  final MessageController controller = Get.put(MessageController());
  MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: color.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_headerWidget(), _searchWidget(), _messageWidget()],
        ),
      ),
    ));
  }

  Widget _headerWidget() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 12.0, right: 30, top: 25, bottom: 20),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.whiteColor,
            backgroundImage: const AssetImage(AssetImages.noPerson),
            radius: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Name',
              style: textStyle.bold(size: 20, color: color.blackColor),
            ),
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

  Widget _searchWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: WidgetInputText(
        hintText: LocaleKeys.search.tr,
        hintFontSize: 15,
        controller: controller.searchController,
        textCapitalization: TextCapitalization.none,
        title: 'Search',
        borderRadius: 20,
        suffixIcon: SvgPicture.asset(AssetIcons.messageSearch),
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
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return MessageListItem();
            },
          )
        ],
      ),
    );
  }
}
