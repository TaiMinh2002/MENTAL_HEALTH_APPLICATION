import 'package:mental_healing/controller/global_data_manager.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/import.dart';

class BoardingController extends BaseController {
  final GlobalDataManager _globalDataManager = GlobalDataManager();
  PageController pageController = PageController();
  RxInt currentPage = 0.obs;
  RxString currentTitle = LocaleKeys.personalize_journey.obs;
  RxString currentStep = LocaleKeys.step_1.obs;
  RxString currentHeaderImage = AssetImages.boarding1.obs;

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void handleNextPage() {
    if (currentPage.value < 3) {
      currentPage.value += 1;
      changeCurrentText();
      _animatedPage();
    } else {
      Get.offNamed(AppRouter.routerSignIn);
    }
  }

  void backPage() {
    if (currentPage.value > 0) {
      currentPage.value -= 1;
      changeCurrentText();
      _animatedPage();
    }
  }

  void moveToIndex(index) {
    currentPage.value = index;
    changeCurrentText();
    _animatedPage();
  }

  void _animatedPage() {
    pageController.animateToPage(
      currentPage.value,
      curve: Curves.decelerate,
      duration: const Duration(milliseconds: 200),
    );
  }

  void changeCurrentText() {
    switch (currentPage.value) {
      case 0:
        currentTitle.value = LocaleKeys.personalize_journey;
        currentStep.value = LocaleKeys.step_1;
        currentHeaderImage.value = AssetImages.boarding1;
        break;
      case 1:
        currentTitle.value = LocaleKeys.smart_tracking;
        currentStep.value = LocaleKeys.step_2;
        currentHeaderImage.value = AssetImages.boarding2;
        break;
      case 2:
        currentTitle.value = LocaleKeys.personal_mental_journaling;
        currentStep.value = LocaleKeys.step_3;
        currentHeaderImage.value = AssetImages.boarding3;
        break;
      case 3:
        currentTitle.value = LocaleKeys.mindful_resources;
        currentStep.value = LocaleKeys.step_4;
        currentHeaderImage.value = AssetImages.boarding4;
        break;
    }
  }
}
