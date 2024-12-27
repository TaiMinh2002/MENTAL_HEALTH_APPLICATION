import 'package:mental_healing/controller/global_data_manager.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/import.dart';

class SplashController extends BaseController {
  final GlobalDataManager _globalDataManager = GlobalDataManager();
  @override
  void onInit() {
    _moveToBoardingPage();
    super.onInit();
  }

  Future<void> _moveToBoardingPage() async {
    await (2.5).seconds.delay();
    if (_globalDataManager.passBoarding) {
      _globalDataManager.checkLogin();
    } else {
      savePassBoarding(true);
      Get.offNamed(AppRouter.routerBoarding);
    }
  }
}
