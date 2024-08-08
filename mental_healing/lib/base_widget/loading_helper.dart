import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:mental_healing/import.dart';

class LoadingHelper {
  static void showLoading() {
    hideKeyboard();
    Get.dialog(
      Center(
        child: Lottie.asset(AssetLotties.appLoading),
      ),
      barrierDismissible: false,
    );
  }

  static void hideLoading() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }

  static void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}
