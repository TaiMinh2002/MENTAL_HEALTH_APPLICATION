import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/base_widget/loading_helper.dart';
import 'package:mental_healing/base_widget/snack_bar_helper.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/utils/function.dart';
import 'package:mental_healing/utils/string.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mental_healing/utils/config.dart';

class SignUpController extends GetxController {
  final usernameController = TextEditingController();
  final identifierController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
  RxBool firstValidation = false.obs;

  String? checkUsernameValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return LocaleKeys.enter_username.tr;
    }
    return null;
  }

  String? checkEmailValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return LocaleKeys.enter_email_or_phone_number.tr;
    }
    return null;
  }

  String? checkPasswordValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return LocaleKeys.enter_password.tr;
    }
    if (value!.trim().length < 8) {
      return LocaleKeys.password_requirements.tr;
    }
    if (!value.trim().validatePassword()) {
      return LocaleKeys.password_complexity.tr;
    }
    return null;
  }

  String? checkConFirmPasswordValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return LocaleKeys.please_enter_confirm_password.tr;
    }
    if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      return LocaleKeys.passwords_no_match.tr;
    }
    return null;
  }

  Future<void> handleSignUp() async {
    if (!signUpFormKey.currentState!.validate()) {
      return;
    }

    final String username = usernameController.text.trim();
    final String identifier = identifierController.text.trim();
    final String password = passwordController.text.trim();

    final Map<String, dynamic> userData = {
      'username': username,
      'identifier': identifier,
      'password': password,
    };

    const String url = '${Config.apiUrl}/signup';

    try {
      LoadingHelper.showLoading();
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userData),
      );

      if (response.statusCode == 201) {
        SnackBarHelper.showMessage(LocaleKeys.signup_success.tr);
        Get.toNamed(AppRouter.routerSignIn);
      } else if (response.statusCode == 400) {
        SnackBarHelper.showError(LocaleKeys.enter_email_or_phone_number.tr);
      } else {
        LoadingHelper.hideLoading();
        final errorResponse = jsonDecode(response.body);
        SnackBarHelper.showError(
            errorResponse['error'] ?? LocaleKeys.signup_failed.tr);
      }
    } catch (e) {
      LoadingHelper.hideLoading();
      SnackBarHelper.showError(e.toString());
    }
  }

  Future<void> handleSignIn() async {
    Get.toNamed(AppRouter.routerSignIn);
  }

  bool validation() {
    if (signUpFormKey.currentState?.validate() == true) {
      signUpFormKey.currentState!.save();
    }
    if (!firstValidation.value) {
      firstValidation.value = true;
    }
    if (identifierController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        confirmPasswordController.text.trim().isEmpty) {
      return false;
    }
    return signUpFormKey.currentState?.validate() ?? false;
  }
}
