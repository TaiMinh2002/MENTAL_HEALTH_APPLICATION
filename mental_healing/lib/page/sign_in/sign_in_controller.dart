import 'package:mental_healing/common/helpers/snack_bar_helper.dart';
import 'package:mental_healing/controller/global_data_manager.dart';
import 'package:mental_healing/data/model/sign_in_params.dart';
import 'package:mental_healing/data/model/sign_in_result.dart';
import 'package:mental_healing/data/use_case/auth_use_case.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/import.dart';

class SignInController extends BaseController {
  final formKey = GlobalKey<FormState>();
  SignInParams _params = const SignInParams(role: 2);
  RxBool firstValidation = false.obs;
  RxBool autoLogin = false.obs;
  final identifierController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthUseCase _authUseCase = AuthUseCase();
  late bool navigatedWithOffAll;
  final GlobalKey<PopupMenuButtonState<int>> glKey = GlobalKey();
  @override
  void onInit() {
    navigatedWithOffAll = Get.arguments ?? true;
    super.onInit();
  }

  // void moveToForgotPassword() {
  //   Get.toNamed(AppRouter.routerForgotPassword);
  // }

  void handleSignUp() {
    Get.offNamed(AppRouter.routerSignUp);
  }

  void handleChangeCheckBox(bool value) {
    autoLogin.value = value;
  }

  void handleSignIn() {
    if (validation()) {
      _params = _params.copyWith(
        identifier: identifierController.text.trim(),
        password: passwordController.text.trim(),
      );
      showLoading();
      _authUseCase
          .signIn(
            params: _params,
            onSuccess: (SignInResult data) async {
              saveToken(data.token);
              if (data.userInfo != null) {
                await saveUserInfo(data.userInfo!);
                await GlobalDataManager().getNewUserInfo();
              }
              if (GlobalDataManager().userInfo.value.role == 2) {
                if (GlobalDataManager().userInfo.value.age != null ||
                    GlobalDataManager().userInfo.value.gender != null ||
                    GlobalDataManager().userInfo.value.mood != null ||
                    GlobalDataManager().userInfo.value.sleep != null) {
                  Get.offAllNamed(AppRouter.routerDashboard);
                } else {
                  Get.offNamed(AppRouter.routerAssessment);
                }
              } else {
                // Get.offAllNamed(AppRouter.routerDashboard);
              }
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
    return null;
  }

  String? checkPasswordValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return LocaleKeys.requiredPassword.tr;
    }
    return null;
  }
}
