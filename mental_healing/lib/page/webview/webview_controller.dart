import 'package:get/get.dart';
import 'package:mental_healing/model/webview_param.dart';

class WebviewController extends GetxController {
  late WebViewParams webViewParams;
  RxBool isValidLink = false.obs;

  @override
  void onInit() {
    webViewParams = Get.arguments;
    _handleWebview();
    super.onInit();
  }

  void _handleWebview() {
    isValidLink.value = Uri.parse(webViewParams.url!).isAbsolute;
    if (!isValidLink.value) {
      return;
    }
  }
}
