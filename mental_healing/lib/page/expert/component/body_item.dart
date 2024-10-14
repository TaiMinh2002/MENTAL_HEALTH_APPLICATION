import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/import.dart';

class BodyItem extends StatelessWidget with BaseMixin {
  const BodyItem({super.key, required this.title, required this.widget});

  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 16, right: 16, top: title == LocaleKeys.categories.tr ? 50 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textStyle.bold(size: 16, color: color.mainColor),
          ),
          widget
        ],
      ),
    );
  }
}
