import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/base_widget/back_button_widget.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/utils/cache_manager.dart';

class ForumDetail extends StatelessWidget with BaseMixin {
  const ForumDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
    return Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(AssetImages.constCoverImage)),
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
                'Title',
                style: textStyle.extraBold(size: 20),
              ),
              Text('1 ${LocaleKeys.member.tr}'),
              _member(context)
            ],
          ),
          Text(
            'Description',
            style: textStyle.medium(size: 12),
          )
        ],
      ),
    );
  }

  Widget _member(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(CacheManager.getStoredUser()?.avatar ?? ''),
    );
  }

  Widget _createPost() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      color: color.whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundImage:
                NetworkImage(CacheManager.getStoredUser()?.avatar ?? ''),
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
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 10),
      color: color.whiteColor,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    NetworkImage(CacheManager.getStoredUser()?.avatar ?? ''),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User Name',
                        style: textStyle.extraBold(
                            size: 14, color: color.blackColor),
                      ),
                      Row(
                        children: [
                          Text(
                            'Time',
                            style: textStyle.extraBold(
                                size: 12, color: color.colorCCCCCC),
                          ),
                          SvgPicture.asset(AssetIcons.dot,
                              height: 15,
                              width: 15,
                              colorFilter: ColorFilter.mode(
                                  color.colorCCCCCC, BlendMode.srcIn)),
                          SvgPicture.asset(
                            AssetIcons.global,
                            height: 12,
                            width: 12,
                            colorFilter: ColorFilter.mode(
                                color.colorCCCCCC, BlendMode.srcIn),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              SvgPicture.asset(
                AssetIcons.threeDot,
                height: 15,
                width: 15,
              )
            ],
          ),
          _content(),
          _action()
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
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: _contentImages(),
        ),
        _count()
      ],
    );
  }

  Widget _contentImages() {
    return Image.asset(AssetImages.contentImage);
  }

  Widget _count() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AssetImages.favoriteImage,
              height: 20,
              width: 20,
            ),
            Text(
              ' like_count',
              style: textStyle.bold(size: 14),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'comment_count ',
              style: textStyle.bold(size: 14),
            ),
            Text(
              LocaleKeys.commentLowerCase.tr,
              style: textStyle.bold(size: 14),
            )
          ],
        )
      ],
    );
  }

  Widget _action() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _actionItem(AssetIcons.unFavorite, LocaleKeys.favorite.tr),
        _actionItem(AssetIcons.comment, LocaleKeys.commentUpperCase.tr),
        _actionItem(AssetIcons.sharePost, LocaleKeys.share.tr),
      ],
    );
  }

  Widget _actionItem(String icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            icon,
            height: 20,
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              text,
              style: textStyle.extraBold(size: 14),
            ),
          )
        ],
      ),
    );
  }
}
