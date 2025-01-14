import 'package:mental_healing/common/helpers/snack_bar_helper.dart';
import 'package:mental_healing/controller/global_data_manager.dart';
import 'package:mental_healing/data/model/user/user_update_params.dart';
import 'package:mental_healing/data/use_case/auth_use_case.dart';
import 'package:mental_healing/global/app_enum.dart';
import 'package:mental_healing/global/app_enum_ex.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/import.dart';

class AssessmentController extends BaseController {
  RxInt currentPage = 0.obs;
  final PageController pageController = PageController();
  RxInt gender = 0.obs;
  RxInt age = 20.obs;
  RxInt mood = 1.obs;
  RxInt sleep = 0.obs;
  RxInt stress = 1.obs;
  RxInt isProfessionalRequest = 0.obs;

  final AuthUseCase _authUseCase = AuthUseCase();

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void setAge(int value) {
    age.value = value;
  }

  void setGender(int value) {
    gender.value = value;
  }

  void setMood(Mood selectedMood) {
    mood.value = selectedMood.id;
  }

  void setSleep(Sleep selectedSleep) {
    sleep.value = selectedSleep.id;
  }

  void setStress(int value) {
    stress.value = value;
  }

  void setProfessionalRequest(int value) {
    isProfessionalRequest.value = value;
  }

  void onContinue() {
    if (currentPage.value < 5) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      handleAssessment();
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

  Future<void> handleAssessment() async {
    showLoading();
    final UserUpdateParams param = UserUpdateParams(
      id: GlobalDataManager().userInfo.value.id,
      gender: gender.value,
      age: age.value,
      mood: mood.value,
      sleep: sleep.value,
      stress: stress.value,
      is_professional_request: isProfessionalRequest.value,
    );
    await _authUseCase
        .updateUserInfo(
            param: param,
            onSuccess: (data) async {
              Get.offNamed(AppRouter.routerDashboard);
            },
            onFailure: (err) {
              SnackBarHelper.showError(err.message);
            })
        .whenComplete(() => hideLoading());
  }
}
