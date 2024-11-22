import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/model/expert_model.dart';
import 'package:mental_healing/page/expert_list/expert_list_controller.dart';

class ExpertItem extends StatelessWidget with BaseMixin {
  final Color backgroundColor;
  final Color textColor;
  final ExpertModel expert;
  final ExpertListController controller = Get.put(ExpertListController());

  ExpertItem({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.expert,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.moveToExpertDetail(expert.id);
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
        expert.avatar,
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
            expert.name,
            style: textStyle.extraBold(size: 16, color: textColor),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              expert.specializationString,
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
