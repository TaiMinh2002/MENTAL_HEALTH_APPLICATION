import 'package:mental_healing/data/model/expert_info.dart';
import 'package:mental_healing/import.dart';

class ExpertItem extends BaseWidget with BaseMixin {
  final Color backgroundColor;
  final Color textColor;
  final ExpertInfo expert;
  final Function(int id) handleDetail;

  ExpertItem({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.expert,
    required this.handleDetail,
  });

  @override
  Widget builder() {
    return GestureDetector(
      onTap: () {
        handleDetail(expert.id ?? 0);
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            _avatarWidget(),
            _infoWidget(),
            const Expanded(child: SizedBox()),
            _starWidget(),
          ],
        ),
      ),
    );
  }

  Widget _avatarWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        expert.avatar ?? '',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(AssetImages.doctor, width: 100, height: 100);
        },
      ),
    );
  }

  Widget _infoWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            expert.name ?? '',
            style: textStyle.extraBold(size: 16, color: textColor),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              expert.specialization_string ?? '',
              style: textStyle.medium(size: 16, color: textColor),
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
