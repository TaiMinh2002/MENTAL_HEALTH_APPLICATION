import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/model/webview_param.dart';
import 'package:mental_healing/base_widget/loading_helper.dart';
import 'package:mental_healing/base_widget/snack_bar_helper.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mental_healing/utils/cache_manager.dart';
import 'package:mental_healing/utils/config.dart';

class SettingController extends GetxController {
  Future<void> handlePersonInfo() async {
    Get.toNamed(AppRouter.routerPersonInfo);
  }

  Future<void> handleHelpCenter() async {
    Get.toNamed(
      AppRouter.routerWebview,
      arguments: WebViewParams(
          title: LocaleKeys.help_center.tr,
          url: 'http://192.168.1.47:3000/webview/help-center'),
    );
  }

  Future<void> handleSignOut() async {
    const String url = '${Config.apiUrl}/logout';
    final String? refreshToken = CacheManager.getStoredRefreshToken();

    if (refreshToken == null || refreshToken.isEmpty) {
      SnackBarHelper.showError(LocaleKeys.token_missing.tr);
      return;
    }

    final Map<String, dynamic> data = {
      'refreshToken': refreshToken,
    };

    try {
      LoadingHelper.showLoading();
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        SnackBarHelper.showMessage(LocaleKeys.logout_success.tr);

        // Xóa token và thông tin user đã lưu trong CacheManager
        await CacheManager.clearStoredToken();
        await CacheManager.clearUser(); // Xóa thông tin người dùng

        // Điều hướng về trang đăng nhập
        Get.offAllNamed(AppRouter.routerSignIn);
      } else if (response.statusCode == 401) {
        SnackBarHelper.showError(LocaleKeys.invalid_token.tr);
      } else {
        final errorResponse = jsonDecode(response.body);
        SnackBarHelper.showError(
            errorResponse['error'] ?? LocaleKeys.logout_failed.tr);
      }
    } catch (e) {
      LoadingHelper.hideLoading();
      SnackBarHelper.showError(e.toString());
    } finally {
      LoadingHelper.hideLoading();
    }
  }
}
