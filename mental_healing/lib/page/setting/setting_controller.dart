import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/model/webview_param.dart';

class SettingController extends GetxController {
  Future<void> handlePersonInfo() async {
    Get.toNamed(AppRouter.routerPersonInfo);
  }

  Future<void> handleHelpCenter() async {
    Get.toNamed(
      AppRouter.routerWebview,
      arguments: WebViewParams(
          title: 'LocaleKeys.contact.tr',
          url: 'http://192.168.1.47:3000/webview/help-center'),
    );
  }
}
