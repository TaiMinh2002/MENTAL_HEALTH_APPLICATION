import 'dart:convert';

import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/base_widget/loading_helper.dart';
import 'package:mental_healing/base_widget/snack_bar_helper.dart';
import 'package:mental_healing/global/app_enum.dart';
import 'package:mental_healing/global/app_enum_ex.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/utils/cache_manager.dart';
import 'package:mental_healing/utils/config.dart';
import 'package:http/http.dart' as http;

class CompleteAccountController extends GetxController {
  RxInt currentPage = 0.obs;
  final PageController pageController = PageController();
  RxInt gender = 0.obs;
  RxInt age = 20.obs;
  RxInt mood = 1.obs;
  RxInt sleep = 0.obs;
  RxInt stress = 1.obs;
  RxInt isProfessionalRequest = 0.obs;

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
      updateUserInfo();
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

  Future<void> updateUserInfo() async {
    final Map<String, dynamic> updateData = {
      'gender': gender.value,
      'age': age.value,
      'mood': mood.value,
      'sleep': sleep.value,
      'stress': stress.value,
      'is_professional_request': isProfessionalRequest.value,
    };

    // Lấy user ID và token từ CacheManager
    final int? userId = CacheManager.getStoredUser()?.id;
    final String? token = CacheManager.getStoredToken();

    if (userId == null || token == null || token.isEmpty) {
      SnackBarHelper.showError(LocaleKeys.token_missing.tr);
      return;
    }

    String updateUrl = '${Config.apiUrl}/users/users/$userId/update';

    try {
      LoadingHelper.showLoading();
      final http.Response response = await http.post(
        Uri.parse(updateUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Thêm Bearer token vào headers
        },
        body: jsonEncode(updateData),
      );

      if (response.statusCode == 200) {
        jsonDecode(response.body);
        LoadingHelper.hideLoading();
        Get.offAllNamed(AppRouter.routerDashboard);
      } else {
        LoadingHelper.hideLoading();
        final errorResponse = jsonDecode(response.body);
        SnackBarHelper.showError(errorResponse['message']);
      }
    } catch (e) {
      LoadingHelper.hideLoading();
      SnackBarHelper.showError(e.toString());
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
