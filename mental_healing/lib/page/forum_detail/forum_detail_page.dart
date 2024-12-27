import 'package:mental_healing/base_widget/back_button_widget.dart';
import 'package:mental_healing/controller/global_data_manager.dart';
import 'package:mental_healing/data/model/post_info.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/forum_detail/forum_detail_controller.dart';

class ForumDetailPage extends BaseScreen<ForumDetailController> with BaseMixin {
  ForumDetailPage({super.key});

  @override
  Widget builder() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _coverImage(),
              _headerWidget(context),
              _createPost(),
              _text(),
              _allPost(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _coverImage() {
    return Obx(() {
      final coverImage = controller.forumDetail.value.cover_image;
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: coverImage != null
                ? Image.network(coverImage)
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

  Widget _headerWidget(BuildContext context) {
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
                controller.forumDetail.value.title ?? '',
                style: textStyle.extraBold(size: 20),
              ),
              Text(
                  '${controller.forumDetail.value.member_count} ${LocaleKeys.member.tr}'),
              Text(
                controller.forumDetail.value.description ?? '',
                style: textStyle.medium(size: 12),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _createPost() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRouter.routerCreatePost,
            arguments: controller.forumDetail.value.id);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        color: color.whiteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            Text(
              LocaleKeys.want_to_share_story.tr,
              style: textStyle.bold(size: 14, color: color.color3C3D37),
            ),
            SvgPicture.asset(
              AssetIcons.picture,
              height: 25,
              width: 25,
            )
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
      final posts = controller.forumDetail.value.posts ?? [];

      // Hiển thị danh sách bài viết
      return ListView.builder(
        shrinkWrap: true, // Cho phép cuộn trong SingleChildScrollView
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
                        post.created_at ?? '',
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
          Text(
            post.content ?? 'No content',
            style: textStyle.medium(size: 14, color: color.blackColor),
          ),
        ],
      ),
    );
  }

  Widget _content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Content',
            style: textStyle.bold(size: 13),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(bottom: 10.0),
        //   child: _contentImages(),
        // ),
        // _count()
      ],
    );
  }

  // Widget _contentImages() {
  //   return Image.asset(AssetImages.contentImage);
  // }

  // Widget _count() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Row(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Image.asset(
  //             AssetImages.favoriteImage,
  //             height: 20,
  //             width: 20,
  //           ),
  //           Text(
  //             ' like_count',
  //             style: textStyle.bold(size: 14),
  //           )
  //         ],
  //       ),
  //       Row(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             'comment_count ',
  //             style: textStyle.bold(size: 14),
  //           ),
  //           Text(
  //             LocaleKeys.commentLowerCase.tr,
  //             style: textStyle.bold(size: 14),
  //           )
  //         ],
  //       )
  //     ],
  //   );
  // }

  // Widget _action() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       _actionItem(AssetIcons.unFavorite, LocaleKeys.favorite.tr),
  //       _actionItem(AssetIcons.comment, LocaleKeys.commentUpperCase.tr),
  //       _actionItem(AssetIcons.sharePost, LocaleKeys.share.tr),
  //     ],
  //   );
  // }

  // Widget _actionItem(String icon, String text) {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 10.0),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         SvgPicture.asset(
  //           icon,
  //           height: 20,
  //           width: 20,
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.only(left: 10.0),
  //           child: Text(
  //             text,
  //             style: textStyle.extraBold(size: 14),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  @override
  ForumDetailController? putController() => ForumDetailController();
}
