// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:mental_healing/page/webview/webview_controller.dart';

class WebviewPage extends StatelessWidget {
  final WebviewController controller = Get.put(WebviewController());
  WebviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.webViewParams.title!),
        centerTitle: true,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(controller.webViewParams.url!),
        ),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(useShouldOverrideUrlLoading: true),
          android: AndroidInAppWebViewOptions(
            useHybridComposition: true,
          ),
        ),
      ),
    );
  }
}
