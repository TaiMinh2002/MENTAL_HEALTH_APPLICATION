import 'package:lottie/lottie.dart';
import 'package:mental_healing/base_widget/app_bar_custom.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/webview/webview_controller.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebviewPage extends StatelessWidget {
  final WebViewController controller = Get.put(WebViewController());
  WebviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar,
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Obx(
            () => !controller.isValidLink.value
                ? Text('Link error')
                : Stack(
                    children: [
                      InAppWebView(
                        initialUrlRequest: URLRequest(
                            url: WebUri(controller.webViewParams.url!),
                            headers: controller.webHeader),
                        onLoadStop: (_, url) {},
                        onProgressChanged: (webViewController, progress) {
                          if (progress == 100) {
                            controller.handlePageFinish(webViewController);
                            controller.hideLoadingWebView();
                          }
                        },
                        shouldOverrideUrlLoading:
                            (webViewController, navigationAction) async {
                          controller.webViewController ??= webViewController;
                          return NavigationActionPolicy.ALLOW;
                        },
                      ),
                      Visibility(
                        visible: controller.isLoading.value,
                        child: Center(
                          child: Lottie.asset(AssetLotties.appLoading),
                        ),
                      )
                    ],
                  ),
          ),
        ));
  }

  PreferredSizeWidget get _buildAppBar => PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Obx(
        () => AppBarCustom(
          titleAppBar: controller.webViewParams.title ?? '',
          backIconColor: Color(0xff4F3422),
          actions: [
            GestureDetector(
              onTap: controller.goBack,
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(
                  Icons.navigate_before,
                  size: 26.sp,
                  color: controller.canGoBack.value
                      ? Colors.black
                      : Color(0xff999999),
                ),
              ),
            ),
            GestureDetector(
              onTap: controller.goForward,
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(
                  Icons.navigate_next,
                  size: 26.sp,
                  color: controller.canGoForward.value
                      ? Colors.black
                      : Color(0xff999999),
                ),
              ),
            ),
            GestureDetector(
              onTap: controller.reload,
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(
                  Icons.refresh,
                  size: 22.sp,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ));
}
