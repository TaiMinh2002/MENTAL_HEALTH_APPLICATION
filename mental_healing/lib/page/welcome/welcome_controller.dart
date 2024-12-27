import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/import.dart';

class WelcomeController extends BaseController {
  Future<void> handleBoarding() async {
    Get.offNamed(AppRouter.routerBoarding);
  }
}
