import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/model/webview_param.dart';

class WebViewController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool canGoBack = false.obs;
  RxBool canGoForward = false.obs;
  RxBool isValidLink = false.obs;
  late WebViewParams webViewParams;
  final List<String> schemeLink = [
    'https',
    'http',
    'file',
    'chrome',
    'data',
    'javascript',
    'about'
  ];
  Map<String, String> webHeader = {};
  InAppWebViewController? webViewController;
  @override
  void onInit() {
    webViewParams = Get.arguments;
    _handleWebview();
    super.onInit();
  }

  @override
  void onClose() {
    webViewController?.dispose();
    super.onClose();
  }

  Future<void> hideLoadingWebView() async {
    await 0.5.seconds.delay();
    isLoading.value = false;
  }

  Future<void> handlePageFinish(InAppWebViewController ctl) async {
    canGoBack.value = await ctl.canGoBack();
    canGoForward.value = await ctl.canGoForward();
  }

  void _handleWebview() {
    isValidLink.value = Uri.parse(webViewParams.url!).isAbsolute;
    if (!isValidLink.value) {
      return;
    }
  }

  Future<void> goForward() async {
    if (webViewController != null) {
      if (await webViewController!.canGoForward()) {
        webViewController!.goForward();
      }
    }
  }

  Future<void> goBack() async {
    if (webViewController != null) {
      if (await webViewController!.canGoBack()) {
        webViewController!.goBack();
      }
    }
  }

  void reload() {
    if (webViewController != null) {
      isLoading.value = true;
      webViewController!.reload();
    }
  }
}
