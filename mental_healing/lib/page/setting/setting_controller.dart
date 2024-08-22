import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/import.dart';

class SettingController extends GetxController {
  Future<void> handlePersonInfo() async {
    Get.toNamed(AppRouter.routerPersonInfo);
  }
}
