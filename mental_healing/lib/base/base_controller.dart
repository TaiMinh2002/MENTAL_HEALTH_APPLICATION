import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:mental_healing/base/base_common_widgets.dart';
import 'package:mental_healing/base/loading_wrapper.dart';
import 'package:mental_healing/controller/controller_manager.dart';
import 'package:mental_healing/import.dart';

export 'package:flutter/material.dart';

abstract class BaseController extends GetxController with BaseCommonWidgets {
  LoadingController get loading => Get.find<LoadingController>();
  RxBool pageLoading = false.obs;

  @override
  void onInit() {
    ControllerManager().currentController.value = Get.currentRoute;
    hideKeyBoard();
    //debugPrint('BaseController');
    super.onInit();
  }

  @override
  void onClose() {
    ControllerManager().handleOnClose(runtimeType.toString());
  }

  void onResumed() {}

  Future<void> showLoading() async {
    await 0.01.seconds.delay();
    FocusManager.instance.primaryFocus?.unfocus();
    loading.show();
  }

  void showLoadingWhenInit() {
    SchedulerBinding.instance.addPostFrameCallback((_) => loading.show());
  }

  void hideLoading() {
    loading.hide();
  }

  void showLoadingPage() {
    pageLoading.value = true;
  }

  void hideLoadingPage() {
    pageLoading.value = false;
  }

  void hideKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void hideInput() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  Future<void> delayHideLoading() async {
    await 0.1.seconds.delay();
    hideLoading();
  }

  @override
  void dispose() {
    pageLoading.value = false;
    loading.hideAll();
    hideKeyBoard();
    super.dispose();
  }
}
