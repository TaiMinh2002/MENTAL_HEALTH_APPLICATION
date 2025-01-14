import 'package:mental_healing/base_widget/back_button_widget.dart';
import 'package:mental_healing/controller/global_data_manager.dart';
import 'package:mental_healing/data/model/post/post_info.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/page/forum_detail/forum_detail_controller.dart';
import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_widget.dart';
import 'package:mental_healing/import.dart';

class ForumDetailPage extends BaseScreen<ForumDetailController>
    with SmartLoadListWidget {
  ForumDetailPage({super.key});

  @override
  Widget builder() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        body: buildSmartList(
          controller,
          enablePullUp: false,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _coverImage(),
                _headerWidget(),
                _createPost(),
                _text(),
                _allPost()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _coverImage() {
    return Obx(() {
      final item = controller.dataList.first;
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: item.cover_image != null
                ? Image.network(item.cover_image!)
                : Image.asset(AssetImages.constCoverImage),
          ),
          const Positioned(child: BackButtonWidget()),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  color: color.whiteColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: SvgPicture.asset(
                      AssetIcons.edit,
                      height: 15,
                      width: 15,
                    ),
                  ),
                  Text(
                    LocaleKeys.edit.tr,
                    style: textStyle.extraBold(size: 16),
                  )
                ],
              ),
            ),
          )
        ],
      );
    });
  }

  Widget _headerWidget() {
    return Obx(() {
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        color: color.whiteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.dataList.first.title ?? '',
                  style: textStyle.extraBold(size: 20),
                ),
                Text(
                    '${controller.dataList.first.member_count} ${LocaleKeys.member.tr}'),
                Text(
                  controller.dataList.first.description ?? '',
                  style: textStyle.medium(size: 12),
                )
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget _createPost() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRouter.routerCreatePost,
            arguments: controller.dataList.first.id);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        color: color.whiteColor,
        child: Row(
          children: [
            GlobalDataManager().userInfo.value.avatar != null
                ? CircleAvatar(
                    backgroundColor: color.colorCCCCCC,
                    backgroundImage: NetworkImage(
                        GlobalDataManager().userInfo.value.avatar ?? ''),
                  )
                : CircleAvatar(
                    backgroundImage: const AssetImage(AssetImages.noPerson),
                    backgroundColor: color.colorCCCCCC,
                  ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                LocaleKeys.want_to_share_story.tr,
                style: textStyle.bold(size: 14, color: color.color3C3D37),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _text() {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 10),
      color: color.whiteColor,
      width: double.infinity,
      child: Text(
        LocaleKeys.all_posts.tr,
        style: textStyle.extraBold(size: 14, color: color.blackColor),
      ),
    );
  }

  Widget _allPost() {
    return Obx(() {
      final posts = controller.dataList.first.posts ?? [];

      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return _postItem(post);
        },
      );
    });
  }

  Widget _postItem(PostInfo post) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 10),
      color: color.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: color.colorCCCCCC,
                backgroundImage: GlobalDataManager().userInfo.value.avatar !=
                        null
                    ? NetworkImage(
                        GlobalDataManager().userInfo.value.avatar ?? '')
                    : const AssetImage(AssetImages.noPerson) as ImageProvider,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.username ?? 'Unknown User',
                        style: textStyle.extraBold(
                            size: 14, color: color.blackColor),
                      ),
                      Text(
                        post.formattedCreatedAt,
                        style: textStyle.medium(
                            size: 12, color: color.colorCCCCCC),
                      ),
                    ],
                  ),
                ),
              ),
              SvgPicture.asset(
                AssetIcons.threeDot,
                height: 15,
                width: 15,
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            post.title ?? 'No content',
            style: textStyle.bold(size: 16, color: color.blackColor),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.r),
            child: Text(
              post.content ?? 'No content',
              style: textStyle.medium(size: 14, color: color.blackColor),
            ),
          ),
        ],
      ),
    );
  }

  @override
  ForumDetailController? putController() => ForumDetailController();
}
