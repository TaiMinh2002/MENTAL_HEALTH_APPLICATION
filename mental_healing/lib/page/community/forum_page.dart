import 'package:lottie/lottie.dart';
import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/base_widget/app_bar_custom.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/community/component/forum_item.dart';
import 'forum_controller.dart';

class ForumPage extends StatelessWidget with BaseMixin {
  ForumPage({super.key});

  final ForumController controller = Get.put(ForumController());
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        controller.loadMore();
      }
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        appBar: AppBarCustom(
          leadingIcon: AssetIcons.back,
          titleAppBar: LocaleKeys.forum.tr,
          suffixIcon1: AssetIcons.createCommunity,
          suffixIcon2: AssetIcons.searchIcon,
          suffixPressed1: controller.handleIntroForum,
          centerTitle: false,
        ),
        body: Obx(() {
          if (controller.isLoading.value && controller.forumList.isEmpty) {
            return Lottie.asset(AssetLotties.appLoading);
          }

          return ListView.builder(
            controller: scrollController,
            itemCount: controller.hasMore.value
                ? controller.forumList.length + 1
                : controller.forumList.length,
            itemBuilder: (context, index) {
              if (index < controller.forumList.length) {
                final forum = controller.forumList[index];
                return ForumItem(
                  forum: forum,
                  onJoin: () {
                    controller.handleJoinForum(forum.id ?? 0);
                  },
                  onLeave: () {
                    controller.handleOutForum(forum.id ?? 0);
                  },
                );
              } else {
                return Lottie.asset(AssetLotties.loadMore,
                    height: 100, width: 100);
              }
            },
          );
        }),
      ),
    );
  }
}
