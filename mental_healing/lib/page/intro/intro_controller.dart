import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/import.dart';

class IntroController extends GetxController {
  final pageController = PageController();

  void handleNexPage() {
    if (pageController.page!.toInt() == 2) {
      Get.offNamed(AppRouter.routerIntro);
    } else {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  Future<void> moveToIntro() async {
    Get.offNamed(AppRouter.routerPageViewIntro);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
