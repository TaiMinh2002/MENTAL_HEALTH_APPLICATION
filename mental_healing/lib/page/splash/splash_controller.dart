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
    Get.offNamed(AppRouter.routerIntro);

    bool isFirstRun = CacheManager.isFirstRun();
    print('Is first run: $isFirstRun');

    if (CacheManager.isFirstRun()) {
      CacheManager.markFirstRunComplete();
      Get.offNamed(AppRouter.routerIntro);
    } else if (CacheManager.isFirstLogin()) {
      Get.offNamed(AppRouter.routerSignIn);
    } else {
      final user = CacheManager.getStoredUser();
      if (user != null && CacheManager.getStoredToken() != null) {
        Get.offAllNamed(AppRouter.routerDashboard); // Nếu đã đăng nhập
      } else {
        Get.offNamed(AppRouter.routerSignIn); // Nếu không có user hoặc token
      }
    }
  }
}
