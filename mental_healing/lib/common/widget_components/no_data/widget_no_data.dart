import 'package:mental_healing/import.dart';

class WidgetNoData extends StatelessWidget with BaseMixin {
  const WidgetNoData({super.key, this.message});
  final String? message;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text(
            message != null ? message ?? '' : 'No Record(s) Found.',
            style: textStyle.semiBold(size: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
