import 'package:mental_healing/import.dart';

class SignInController extends BaseController {
  final formKey = GlobalKey<FormState>();
  RxBool firstValidation = false.obs;
  RxBool autoLogin = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // void moveToForgotPassword() {
  //   Get.toNamed(AppRouter.routerForgotPassword);
  // }

  // void moveToSignUp() {
  //   Get.offNamed(AppRouter.routerSignUp);
  // }

  void handleChangeCheckBox(bool value) {
    autoLogin.value = value;
  }

  // void handleSignIn() {
  //   Get.toNamed(AppRouter.routerDashboard);
  //   return;
  //   // if (validation()) {
  //   //   _params = _params.copyWith(
  //   //     auto_login: autoLogin.value,
  //   //     email: emailController.text.trim(),
  //   //     password: passwordController.text.trim(),
  //   //   );
  //   //   showLoading();
  //   //   _authUseCase
  //   //       .signIn(
  //   //         params: _params,
  //   //         onSuccess: (UserInfo data) async {
  //   //           saveToken('token');
  //   //           await saveUserInfo(data);
  //   //         },
  //   //         onFailure: (err) {
  //   //           SnackBarHelper.showError(err.message);
  //   //         },
  //   //       )
  //   //       .whenComplete(() => hideLoading());
  //   // }
  // }

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

  String? checkEmailValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return 'Email không được để trống';
    }
    return null;
  }

  String? checkPasswordValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return 'Mật khẩu không được để trống';
    }
    return null;
  }
}
