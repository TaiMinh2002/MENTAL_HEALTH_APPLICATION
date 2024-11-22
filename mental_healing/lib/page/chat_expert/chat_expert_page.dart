import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/base_widget/app_bar_custom.dart';
import 'package:mental_healing/import.dart';

class ChatExpertPage extends StatelessWidget with BaseMixin {
  const ChatExpertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        appBar: const AppBarCustom(
          titleAppBar: 'Name User',
          centerTitle: false,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      margin: const EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Text("Hello! How can I help you?"),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      margin: const EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                        color: color.colorA5D6A7,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Text("I need some assistance."),
                    ),
                  ),
                ],
              ),
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
                        child: SvgPicture.asset(AssetIcons.sendMessage)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
