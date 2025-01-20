import 'package:mental_healing/base_widget/app_bar_custom.dart';
import 'package:mental_healing/common/widget_components/animated_list/widget_animated_list.dart';
import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_widget.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/forum_list/component/forum_item.dart';
import 'package:mental_healing/page/forum_list/forum_list_controller.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

class ForumListPage extends BaseScreen<ForumListController>
    with SmartLoadListWidget {
  ForumListPage({super.key});

  @override
  Widget builder() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: color.whiteColor,
        appBar: _buildAppBar,
        body: Column(
          children: [
            _buildTabs(),
            Expanded(child: _buildSmartList()),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget get _buildAppBar => PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarCustom(
          leadingIcon: AssetIcons.back,
          titleAppBar: LocaleKeys.forum.tr,
          suffixIcon1: AssetIcons.createCommunity,
          suffixIcon2: AssetIcons.searchIcon,
          suffixPressed1: controller.moveToIntroForumCreate,
          centerTitle: false,
        ),
      );

  Widget _buildTabs() {
    return ButtonsTabBar(
      backgroundColor: color.colorB1F0F7,
      unselectedBackgroundColor: color.backgroundColor,
      labelStyle: textStyle.extraBold(color: color.blackColor),
      unselectedLabelStyle: textStyle.extraBold(color: color.whiteColor),
      contentPadding: EdgeInsets.symmetric(horizontal: 10.r),
      buttonMargin: EdgeInsets.symmetric(horizontal: 30.r, vertical: 4),
      tabs: [
        Tab(text: LocaleKeys.recommend.tr),
        Tab(text: LocaleKeys.your_forum.tr),
      ],
      onTap: (index) {
        controller.switchTab(index == 1);
      },
    );
  }

  Widget _buildSmartList() {
    return Obx(() {
      return buildSmartList(controller,
          enablePullDown: true,
          enablePullUp: controller.hasMorePage.value,
          child: Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
            child: _buildList(),
          ));
    });
  }

  Widget _buildList() {
    return Obx(() => WidgetAnimatedList(
        itemCount: controller.dataList.length,
        isExpanded: false,
        isLoading: controller.loading.loadingCtrl.value,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          final forum = controller.dataList[index];
          return ForumItem(
            title: forum.title ?? '',
            memberCount: forum.member_count ?? 0,
            postCount: forum.post_count ?? 0,
            coverImage: forum.cover_image,
            onJoin: () {},
            onLeave: () {},
            forum: controller.dataList[index],
            isYour: forum.is_joined ?? -1,
            handleDetail: (id) {
              controller.moveToDetail(controller.dataList[index].id ?? 0);
            },
          );
        }));
  }

  @override
  ForumListController? putController() => ForumListController();
}
