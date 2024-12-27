import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/common/helpers/snack_bar_helper.dart';
import 'package:mental_healing/data/use_case/auth_use_case.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/import.dart';

class SettingController extends BaseController {
  final AuthUseCase _authUseCase = AuthUseCase();
  // Future<void> handlePersonInfo() async {
  //   Get.toNamed(AppRouter.routerPersonInfo);
  // }

  void handleSignOut() {
    showCustomGeneralDialog(
      title: 'Signout',
      message: "want to sign out",
      onConfirm: () async {
        showLoadingWhenInit();
        await _authUseCase.signOut(
          onSuccess: () async {
            await removeAllCache();
            Get.offAllNamed(AppRouter.routerSignIn);
          },
          onFailure: (ApiError err) {
            SnackBarHelper.showError(err.message);
          },
        ).whenComplete(() => hideLoading());
      },
    );
  }
}
