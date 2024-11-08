import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/utils/cache_manager.dart';

class HomeController extends GetxController {
  Future<void> handleCommunity() async {
    Get.toNamed(AppRouter.routerForum);
  }

  Future<void> handleChatbot() async {
    if (CacheManager.isFirstChatbotVisit()) {
      Get.toNamed(AppRouter.routerChatbotIntro);
      CacheManager.markFirstChatbotVisitComplete();
    } else {
      Get.toNamed(AppRouter.routerChatbotPage);
    }
  }
}
