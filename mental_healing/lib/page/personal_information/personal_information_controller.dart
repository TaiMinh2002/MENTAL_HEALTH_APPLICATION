import 'package:mental_healing/generated/locales.g.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/utils/function.dart';
import 'package:mental_healing/utils/string.dart';

class PersonalInformationController extends GetxController {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final editFormKey = GlobalKey<FormState>();
  RxBool firstValidation = false.obs;

  String? checkUsernameValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return LocaleKeys.enter_username.tr;
    }
    return null;
  }

  String? checkEmailValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return LocaleKeys.enter_email.tr;
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

  bool validation() {
    if (editFormKey.currentState?.validate() == true) {
      editFormKey.currentState!.save();
    }
    if (!firstValidation.value) {
      firstValidation.value = true;
    }
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        confirmPasswordController.text.trim().isEmpty) {
      return false;
    }
    return editFormKey.currentState?.validate() ?? false;
  }
}
