import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/import.dart';

class CompleteAccountController extends GetxController {
  final RxInt currentPage = 0.obs;
  final PageController pageController = PageController();

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void onContinue() {
    if (currentPage.value < 5) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAllNamed(AppRouter.routerSignIn);
    }
  }

  void onBack() {
    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAllNamed(AppRouter.routerSignIn);
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
