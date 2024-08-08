import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/base_widget/loading_helper.dart';
import 'package:mental_healing/base_widget/snack_bar_helper.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/utils/function.dart';
import 'package:mental_healing/utils/string.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignUpController extends GetxController {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
  RxBool firstValidation = false.obs;

  String? checkUsernameValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return 'Please enter your username address';
    }
    return null;
  }

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
    if (value!.trim().length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!value.trim().validatePassword()) {
      return 'Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character';
    }
    return null;
  }

  String? checkConFirmPasswordValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return 'Please confirm your password';
    }
    if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      return 'Passwords do not match';
    }
    return null;
  }

  Future<void> handleSignUp() async {
    if (!signUpFormKey.currentState!.validate()) {
      return;
    }

    final String username = usernameController.text.trim();
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    final Map<String, dynamic> userData = {
      'username': username,
      'email': email,
      'password': password,
    };

    const String url = 'http://192.168.1.23:3000/api/signup';

    try {
      LoadingHelper.showLoading();
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userData),
      );

      if (response.statusCode == 201) {
        SnackBarHelper.showMessage('Sign up success');
        Get.toNamed(AppRouter.routerSignIn);
      } else {
        final errorResponse = jsonDecode(response.body);
        SnackBarHelper.showError(
            errorResponse['message'] ?? 'Failed to sign up');
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
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        confirmPasswordController.text.trim().isEmpty) {
      return false;
    }
    return signUpFormKey.currentState?.validate() ?? false;
  }
}
