import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/utils/cache_manager.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    _moveToNextPage();
    super.onInit();
  }

  Future<void> _moveToNextPage() async {
    await 3.seconds.delay();
    if (CacheManager.isFirstLaunch()) {
      Get.offNamed(AppRouter.routerIntro);
      CacheManager.storeFirstLaunch();
    } else {
      Get.offNamed(AppRouter.routerSignIn);
    }
  }
}
