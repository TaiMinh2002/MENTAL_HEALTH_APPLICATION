import 'package:mental_healing/base_widget/app_bar_custom.dart';
import 'package:mental_healing/controller/global_data_manager.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/forum_list/component/forum_item.dart';
import 'forum_list_controller.dart';

class ForumListPage extends BaseScreen<ForumListController> with BaseMixin {
  ForumListPage({super.key});

  @override
  Widget builder() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        appBar: AppBarCustom(
          leadingIcon: AssetIcons.back,
          titleAppBar: LocaleKeys.forum.tr,
          suffixIcon1: AssetIcons.createCommunity,
          suffixIcon2: AssetIcons.searchIcon,
          suffixPressed1: controller.moveToIntroForumCreate,
          centerTitle: false,
        ),
        body: ListView.builder(
          itemCount: controller.listForums.length,
          itemBuilder: (context, index) {
            final forum = controller.listForums[index];
            return Obx(() => ForumItem(
                  join: GlobalDataManager().userInfo.value.id ==
                          forum.created_user_id
                      ? 'Admin'
                      : forum.is_joined == 1
                          ? "Joined"
                          : LocaleKeys.join.tr,
                  title: forum.title ?? '',
                  memberCount: forum.member_count ?? 0,
                  postCount: forum.post_count ?? 0,
                  coverImage: forum.cover_image,
                  onJoin: () {},
                  onLeave: () {},
                  forum: controller.listForums[index],
                  handleDetail: (id) {
                    controller.moveToExpertDetail(
                        controller.listForums[index].id ?? 0);
                  },
                ));
          },
        ),
      ),
    );
  }

  @override
  ForumListController? putController() => ForumListController();
}
