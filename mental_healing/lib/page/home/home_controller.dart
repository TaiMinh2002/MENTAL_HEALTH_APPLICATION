import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/import.dart';

class HomeController extends GetxController {
  Future<void> handleCommunity() async {
    Get.toNamed(AppRouter.routerForum);
  }
}
