import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/base_widget/snack_bar_helper.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/model/expert_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mental_healing/utils/cache_manager.dart';
import 'package:mental_healing/utils/config.dart';

class ExpertDetailController extends GetxController {
  Rx<ExpertModel?> expert = Rx<ExpertModel?>(null);
  RxBool isLoading = true.obs;
  late int expertId;

  @override
  void onInit() {
    super.onInit();
    expertId = Get.arguments; // Nhận expertId từ arguments
    getExpertById(expertId);
  }

  Future<void> getExpertById(int id) async {
    final String? token = CacheManager.getStoredToken();

    if (token == null || token.isEmpty) {
      SnackBarHelper.showError(LocaleKeys.token_missing.tr);
      return;
    }

    final String url = '${Config.apiUrl}/experts/$id/detail';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        expert.value = ExpertModel.fromJson(data);
      } else {
        final errorResponse = jsonDecode(response.body);
        SnackBarHelper.showError(errorResponse['error']);
      }
    } catch (e) {
      SnackBarHelper.showError(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> handleChatExpert() async {
    Get.toNamed(AppRouter.routerChatExpert);
  }
}
