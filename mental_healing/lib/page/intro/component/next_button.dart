import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/intro/intro_controller.dart';

class NextButton extends StatelessWidget with BaseMixin {
  final IntroController controller = Get.put(IntroController());
  NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.handleNexPage,
      child: Container(
        padding: const EdgeInsets.all(28),
        margin: const EdgeInsets.only(top: 40),
        decoration:
            BoxDecoration(color: color.mainColor, shape: BoxShape.circle),
        child: Center(child: SvgPicture.asset(AssetIcons.next)),
      ),
    );
  }
}
