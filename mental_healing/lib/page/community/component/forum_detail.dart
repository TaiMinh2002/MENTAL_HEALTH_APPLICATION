import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/base_widget/back_button_widget.dart';
import 'package:mental_healing/import.dart';

class ForumDetail extends StatelessWidget with BaseMixin {
  const ForumDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_coverImage(), _headerWidget(), _member(context)],
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

  Widget _headerWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Title',
          style: textStyle.extraBold(size: 20),
        ),
        Text('1 ${LocaleKeys.member.tr}'),
      ],
    );
  }

  Widget _member(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage(AssetImages.goodMood),
    );
  }
}
