import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/utils/function.dart';
import 'package:mental_healing/utils/string.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
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

  Future<void> handleSignUp(
      {String? email, String? password, String? confirmPassword}) async {
    if (validation() || (email != null && password != null)) {
      Get.toNamed(AppRouter.routerIntro);
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
