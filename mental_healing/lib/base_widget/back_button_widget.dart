import 'package:mental_healing/import.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget(
      {super.key,
      this.onTap,
      this.iconColor = const Color(0xff4F3422),
      this.paddingSize = 15});

  final Function()? onTap;
  final Color? iconColor;
  final double? paddingSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? Get.back,
      child: Padding(
        padding: EdgeInsets.all(paddingSize ?? 15.0),
        child: SvgPicture.asset(
          AssetIcons.back,
          colorFilter: ColorFilter.mode(
              iconColor ?? const Color(0xff4F3422), BlendMode.srcIn),
        ),
      ),
    );
  }
}
