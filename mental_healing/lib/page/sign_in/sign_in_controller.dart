import 'dart:convert';

import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/base_widget/loading_helper.dart';
import 'package:mental_healing/base_widget/snack_bar_helper.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/utils/function.dart';
import 'package:mental_healing/utils/config.dart';
import 'package:http/http.dart' as http;
import 'package:mental_healing/utils/token_storage.dart';

class SignInController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final signInFormKey = GlobalKey<FormState>();
  RxBool firstValidation = false.obs;

  String? checkEmailValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return 'Please enter your email address';
    }
    return null;
  }

  String? checkPasswordValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return 'Please enter your password';
    }
    return null;
  }

  Future<void> handleSignIn() async {
    if (!signInFormKey.currentState!.validate()) {
      return;
    }

    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    final Map<String, dynamic> credentials = {
      'email': email,
      'password': password,
    };

    const String signInUrl = '${Config.apiUrl}/users/login';

    try {
      LoadingHelper.showLoading();
      final http.Response response = await http.post(
        Uri.parse(signInUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(credentials),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final token = responseData['token'];
        final refreshToken = responseData['refreshToken'];

        await TokenStorage.storeToken(token, refreshToken);

        Get.toNamed(AppRouter.routerChooseGender);
      } else if (response.statusCode == 403 || response.statusCode == 498) {
        await refreshToken();
        return handleSignIn();
      } else if (response.statusCode == 401) {
        SnackBarHelper.showError('Incorrect email or password');
      } else {
        final errorResponse = jsonDecode(response.body);
        SnackBarHelper.showError(
            errorResponse['message'] ?? 'Failed to sign in');
      }
    } catch (e) {
      LoadingHelper.hideLoading();
      SnackBarHelper.showError(e.toString());
    }
  }

  Future<void> refreshToken() async {
    const String refreshTokenUrl = '${Config.apiUrl}/refresh-token';

    try {
      final String? storedRefreshToken = TokenStorage.getStoredRefreshToken();

      if (storedRefreshToken == null) {
        return handleSignOut();
      }

      final Map<String, dynamic> body = {
        'refreshToken': storedRefreshToken,
      };

      final http.Response response = await http.post(
        Uri.parse(refreshTokenUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final newToken = responseData['token'];
        final newRefreshToken = responseData['refreshToken'];

        await TokenStorage.storeToken(newToken, newRefreshToken);
      } else {
        return handleSignOut();
      }
    } catch (e) {
      SnackBarHelper.showError('Failed to refresh token: ${e.toString()}');
    }
  }

  Future<void> handleSignOut() async {
    await TokenStorage.clearStoredToken();
    Get.offAllNamed(AppRouter.routerSignIn);
  }

  bool validation() {
    if (signInFormKey.currentState?.validate() == true) {
      signInFormKey.currentState!.save();
    }
    if (!firstValidation.value) {
      firstValidation.value = true;
    }
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      return false;
    }
    return signInFormKey.currentState?.validate() ?? false;
  }

  Future<void> handleSignUp() async {
    Get.offAllNamed(AppRouter.routerSignUp);
  }
}
