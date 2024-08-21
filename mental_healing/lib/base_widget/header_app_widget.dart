import 'package:mental_healing/base_widget/back_button.dart';
import 'package:mental_healing/generated/locales.g.dart';
import 'package:mental_healing/import.dart';

class HeaderAppWidget extends StatelessWidget {
  const HeaderAppWidget(
      {super.key, this.text, this.title, this.onTap, this.onTapBack});
  final String? text;
  final String? title;
  final Function()? onTap;
  final Function()? onTapBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BackButtonWidget(
          onTap: onTapBack ?? Get.back,
        ),
        _centerWidget(),
        _continueWidget(onTap)
      ],
    );
  }

  Widget _centerWidget() {
    return Expanded(
      child: Row(
        children: [
          Text(
            title ?? '',
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w900,
                color: Color(0xff4F3422)),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.symmetric(vertical: 5.5, horizontal: 10),
            decoration: const BoxDecoration(
                color: Color(0xffE8DDD9),
                borderRadius: BorderRadius.all(Radius.circular(32))),
            child: Text(
              text ?? '',
            ),
          ),
        ],
      ),
    );
  }

  Widget _continueWidget(Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Text(
          LocaleKeys.btn_continue.tr,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xff4F3422)),
        ),
      ),
    );
  }
}
