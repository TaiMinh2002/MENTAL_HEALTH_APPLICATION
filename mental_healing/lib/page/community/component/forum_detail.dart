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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_coverImage(), _headerWidget(context), _createPost()],
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
}
