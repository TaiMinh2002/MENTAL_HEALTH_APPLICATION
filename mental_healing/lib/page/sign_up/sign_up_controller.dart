import 'package:mental_healing/common/helpers/snack_bar_helper.dart';
import 'package:mental_healing/data/model/sign_up_params.dart';
import 'package:mental_healing/data/use_case/auth_use_case.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/import.dart';

class SignUpController extends BaseController {
  final formKey = GlobalKey<FormState>();

  SignUpParams _params = const SignUpParams();
  final AuthUseCase _authUseCase = AuthUseCase();
  final usernameController = TextEditingController();
  final identifierController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  RxBool firstValidation = false.obs;
  void moveToForgotPassword() {}

  void handleSignIn() {
    Get.offNamed(AppRouter.routerSignIn);
  }

  void handleSignUp() {
    if (validation()) {
      final identifier = identifierController.text.trim();
      final username = usernameController.text.trim();
      _params = _params.copyWith(
        username: username,
        identifier: identifier,
        password: passwordController.text.trim(),
        confirm_password: confirmPasswordController.text.trim(),
      );
      showLoading();
      _authUseCase
          .signUp(
            params: _params,
            onSuccess: () {
              // Get.offNamed(
              //   AppRouter.routerVerifyEmail,
              //   arguments: VerifyArgument(
              //       type: VerifyType.verifyAccount, email: email),
              // );
              Get.offNamed(AppRouter.routerSignIn);
              print('a');
            },
            onFailure: (err) {
              SnackBarHelper.showError(err.message);
            },
          )
          .whenComplete(() => hideLoading());
    }
  }

  bool validation() {
    if (formKey.currentState?.validate() == true) {
      formKey.currentState!.save();
    }
    if (!firstValidation.value) {
      firstValidation.value = true;
    }
    if (identifierController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      return false;
    }
    return formKey.currentState?.validate() ?? false;
  }

  String? checkEmailValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return LocaleKeys.requiredEmail.tr;
    }
    if (!value!.trim().validateEmail()) {
      return LocaleKeys.emailWrongFormat.tr;
    }
    if (value.trim().contains('+')) {
      return LocaleKeys.emailContain.tr;
    }
    if (value.length > 255) {
      return LocaleKeys.emailLess255.tr;
    }
    return null;
  }

  String? checkPasswordValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return LocaleKeys.requiredPassword.tr;
    }
    if (value!.length < 8) {
      return LocaleKeys.passwordGreater.tr;
    }
    if (value.length > 40) {
      return LocaleKeys.passwordLess.tr;
    }
    if (!value.validatePassword()) {
      return LocaleKeys.passwordFormat.tr;
    }
    return null;
  }

  String? checkUsernameValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return LocaleKeys.enter_username.tr;
    }
    return null;
  }

  String? checkConfirmPasswordValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return LocaleKeys.requiredConfirmPassword.tr;
    }
    if (value != passwordController.text.trim()) {
      return LocaleKeys.confirmPasswordNotMatch.tr;
    }
    return null;
  }
}
