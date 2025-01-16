import 'package:mental_healing/common/widget_components/button/widget_button.dart';
import 'package:mental_healing/data/model/forums/forum_info.dart';
import 'package:mental_healing/import.dart';

class ForumItem extends BaseWidget with BaseMixin {
  final String title;
  final ForumInfo forum;
  final String? coverImage;
  final int memberCount;
  final int postCount;
  final Function()? onJoin;
  final Function()? onLeave;
  final Function(int id) handleDetail;
  final int isYour;

  ForumItem(
      {super.key,
      this.onJoin,
      this.onLeave,
      this.coverImage,
      required this.memberCount,
      required this.postCount,
      required this.handleDetail,
      required this.forum,
      required this.isYour,
      required this.title});

  @override
  Widget builder() {
    return GestureDetector(
      onTap: () {
        handleDetail(forum.id ?? 0);
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  _coverImageWidget(),
                  Expanded(child: _infoWidget()),
                ],
              ),
            ),
            _joinButton(),
          ],
        ),
      ),
    );
  }

  Widget _coverImageWidget() {
    return coverImage != null
        ? Image.network(coverImage!, height: 50, width: 50)
        : Image.asset(AssetImages.constCoverImage, height: 50, width: 50);
  }

  Widget _infoWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textStyle.bold(size: 18, color: color.blackColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '$memberCount ${LocaleKeys.member.tr} • $postCount ${LocaleKeys.post.tr}',
            overflow: TextOverflow.ellipsis,
            style: textStyle.regular(size: 12, color: color.blackColor),
          ),
        ],
      ),
    );
  }

  Widget _joinButton() {
    return isYour == 0
        ? Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: WidgetButton(
              title: LocaleKeys.join.tr,
              onClick: onJoin ?? () {},
              width: 100,
              height: 30,
              borderRadius: 8,
              backgroundColor: color.mainColor,
            ),
          )
        : const SizedBox();
  }
}
