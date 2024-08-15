import 'package:get/get.dart';
import 'package:mental_healing/app_router.dart';

class CompleteAccountController extends GetxController {
  void handleChooseMood() {
    Get.toNamed(AppRouter.routerChooseMood);
  }

  void handleChooseAge() {
    Get.toNamed(AppRouter.routerChooseAge);
  }
}
