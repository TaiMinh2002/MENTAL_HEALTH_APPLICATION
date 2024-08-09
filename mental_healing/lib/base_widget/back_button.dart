import 'package:mental_healing/import.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? Get.back,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SvgPicture.asset(AssetIcons.back),
      ),
    );
  }
}
