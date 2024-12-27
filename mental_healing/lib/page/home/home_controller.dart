import 'package:mental_healing/controller/global_data_manager.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/import.dart';

class HomeController extends BaseController {
  final GlobalDataManager _globalDataManager = GlobalDataManager();

  Future<void> moveTChatbotPage() async {
    if (_globalDataManager.passChatbot) {
      Get.toNamed(AppRouter.routerIntroChatbot);
    } else {
      savePassChatbot(true);
      Get.toNamed(AppRouter.routerChatbotPage);
    }
  }
}
