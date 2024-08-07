import 'package:mental_healing/import.dart';
import 'package:lottie/lottie.dart';
import 'package:mental_healing/page/splash/splash_controller.dart';

class SplashPage extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AssetImages.splashLogo),
            Lottie.asset(AssetLotties.loading),
          ],
        ),
      ),
    );
  }
}
