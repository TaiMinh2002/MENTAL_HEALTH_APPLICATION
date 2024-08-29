import 'package:mental_healing/base_widget/back_button.dart';
import 'package:mental_healing/generated/locales.g.dart';
import 'package:mental_healing/import.dart';

class HeaderAppWidget extends StatelessWidget {
  const HeaderAppWidget(
      {super.key,
      this.iconColor = const Color(0xff4F3422),
      this.titleSize = 14,
      this.text,
      this.title,
      this.onTap,
      this.onTapBack,
      this.titleColor = const Color(0xff4F3422),
      this.isContinue = true});
  final Color? iconColor;
  final String? text;
  final String? title;
  final double? titleSize;
  final Color? titleColor;
  final Function()? onTap;
  final Function()? onTapBack;
  final bool isContinue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BackButtonWidget(
          onTap: onTapBack ?? Get.back,
          iconColor: iconColor,
        ),
        _centerWidget(),
        onTap != null ? _continueWidget(onTap) : Container()
      ],
    );
  }

  Widget _centerWidget() {
    return Expanded(
      child: Row(
        children: [
          Text(
            title ?? '',
            style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.w900,
                color: titleColor),
          ),
          text != null
              ? Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.5, horizontal: 10),
                  decoration: const BoxDecoration(
                      color: Color(0xffE8DDD9),
                      borderRadius: BorderRadius.all(Radius.circular(32))),
                  child: Text(
                    text ?? '',
                  ),
                )
              : SizedBox(),
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
