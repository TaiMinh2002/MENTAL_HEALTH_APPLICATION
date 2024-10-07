import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/import.dart';
import 'package:lottie/lottie.dart';
import 'package:mental_healing/page/splash/splash_controller.dart';

class SplashPage extends StatelessWidget with BaseMixin {
  final SplashController controller = Get.put(SplashController());

  SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.backgroundColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(AssetImages.splashLogo),
          Center(child: Lottie.asset(AssetLotties.splashLoading)),
        ],
      ),
    );
  }
}
