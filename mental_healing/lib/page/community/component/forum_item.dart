import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/import.dart';

class ForumItem extends StatelessWidget with BaseMixin {
  const ForumItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
    );
  }

  Widget _coverImageWidget() {
    return Image.asset(AssetImages.intro3, height: 50, width: 50);
  }

  Widget _infoWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nameddddddhgfkegfjkrehrjksahfjklewhfkljhklhilh',
            style: textStyle.bold(size: 18, color: color.blackColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '... ${LocaleKeys.member.tr} • ... ${LocaleKeys.post.tr}feihjtklewjtldjsgiofejrwtiodjsghjtfgldshjfgnioew4hjiohjiohoihn',
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
        onClick: () {},
        width: 100,
        height: 50,
        borderRadius: 8,
      ),
    );
  }
}
