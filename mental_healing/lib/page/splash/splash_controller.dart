import 'package:get/get.dart';
import 'package:mental_healing/app_router.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    _moveToBoardingPage();
    super.onInit();
  }

  Future<void> _moveToBoardingPage() async {
    await 2.5.seconds.delay();
    Get.offNamed(AppRouter.routerIntro);
  }
}
