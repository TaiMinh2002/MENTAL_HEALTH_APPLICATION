import 'package:mental_healing/import.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget(
      {super.key, this.onTap, this.iconColor = const Color(0xff4F3422)});

  final Function()? onTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? Get.back,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SvgPicture.asset(
          AssetIcons.back,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
      ),
    );
  }
}
