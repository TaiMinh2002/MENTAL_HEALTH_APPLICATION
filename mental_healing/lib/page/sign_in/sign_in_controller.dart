import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/utils/function.dart';

class SignInController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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

  Future<void> handleSignIn({String? email, String? password}) async {
    if (validation() || (email != null && password != null)) {
      Get.toNamed(AppRouter.routerIntro);
    }
  }

  bool validation() {
    if (formKey.currentState?.validate() == true) {
      formKey.currentState!.save();
    }
    if (!firstValidation.value) {
      firstValidation.value = true;
    }
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      return false;
    }
    return formKey.currentState?.validate() ?? false;
  }
}
