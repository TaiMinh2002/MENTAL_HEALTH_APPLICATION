import 'package:get/get.dart';
import 'package:mental_healing/app_router.dart';

class IntroController extends GetxController {
  Future<void> moveToIntro() async {
    Get.offNamed(AppRouter.routerIntroItem);
  }
}
