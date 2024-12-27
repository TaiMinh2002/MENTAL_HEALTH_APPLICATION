import 'package:mental_healing/import.dart';

class BodyItem extends BaseWidget with BaseMixin {
  BodyItem({super.key, required this.title, required this.widget});

  final String title;
  final Widget widget;

  @override
  Widget builder() {
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
