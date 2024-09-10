import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/model/forum_model.dart';

class ForumItem extends StatelessWidget with BaseMixin {
  final ForumModel forum;
  final Function()? onJoin;
  final Function()? onLeave;

  const ForumItem({required this.forum, super.key, this.onJoin, this.onLeave});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _coverImageWidget(),
                Expanded(child: _infoWidget()),
              ],
            ),
          ),
          _joinButton(),
        ],
      ),
    );
  }

  Widget _coverImageWidget() {
    return forum.coverImage != null
        ? Image.network(forum.coverImage!, height: 50, width: 50)
        : Image.asset(AssetImages.forumCoverImage, height: 50, width: 50);
  }

  Widget _infoWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            forum.title ?? '',
            style: textStyle.bold(size: 18, color: color.blackColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '${forum.memberCount} ${LocaleKeys.member.tr} • ${forum.postCount} ${LocaleKeys.post.tr}',
            overflow: TextOverflow.ellipsis,
            style: textStyle.regular(size: 12, color: color.blackColor),
          ),
        ],
      ),
    );
  }

  Widget _joinButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: ButtonWidget(
        title: LocaleKeys.join.tr,
        onClick: onJoin ?? () {},
        width: 100,
        height: 30,
        borderRadius: 8,
      ),
    );
  }

  Widget _outButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: ButtonWidget(
        title: LocaleKeys.joined.tr,
        onClick: onLeave ?? () {},
        width: 100,
        height: 50,
        borderRadius: 8,
      ),
    );
  }
}
