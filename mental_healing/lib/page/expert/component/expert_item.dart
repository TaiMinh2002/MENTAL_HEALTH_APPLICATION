import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/import.dart';

class ExpertItem extends StatelessWidget with BaseMixin {
  const ExpertItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              _avatarWidget(),
              _infoWidget(),
              const Expanded(child: SizedBox()),
              _starWidget()
            ],
          ),
          Row(
            children: [
              _avatarWidget(),
              _infoWidget(),
              const Expanded(child: SizedBox()),
              _starWidget()
            ],
          ),
          Row(
            children: [
              _avatarWidget(),
              _infoWidget(),
              const Expanded(child: SizedBox()),
              _starWidget()
            ],
          ),
          Row(
            children: [
              _avatarWidget(),
              _infoWidget(),
              const Expanded(child: SizedBox()),
              _starWidget()
            ],
          ),
        ],
      ),
    );
  }

  Widget _avatarWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(AssetImages.doctor),
    );
  }

  Widget _infoWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name',
            style: textStyle.extraBold(size: 16),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              'specialization',
              style: textStyle.medium(size: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _starWidget() {
    return Row(
      children: [
        Text(
          '5',
          style: textStyle.medium(size: 12, color: color.mainColor),
        ),
        SvgPicture.asset(
          AssetIcons.star,
          height: 25,
          width: 25,
        )
      ],
    );
  }
}
