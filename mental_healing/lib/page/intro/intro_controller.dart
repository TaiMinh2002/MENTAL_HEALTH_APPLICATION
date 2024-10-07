import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/import.dart';

class IntroController extends GetxController {
  final pageController = PageController();

  void handleNexPage() {
    if (pageController.page!.toInt() == 4) {
      Get.offNamed(AppRouter.routerSignIn);
    } else {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  Future<void> moveToIntro() async {
    Get.offNamed(AppRouter.routerPageViewIntro);
  }

  Widget getIndicator(int pageIndex) {
    int totalSteps = 5;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalSteps,
        (index) => Container(
          width: 50,
          height: 10,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: index <= pageIndex ? Colors.brown : Colors.grey[300],
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
