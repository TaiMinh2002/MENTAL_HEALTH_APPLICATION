import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mental_healing/common/helpers/snack_bar_helper.dart';
import 'package:mental_healing/import.dart';

double doubleInRange({required num start, required num end}) =>
    math.Random().nextDouble() * (end - start) + start;

int intInRange({required int min, required int max}) =>
    min + math.Random().nextInt(max - min);

class KeyboardLifecycleEventHandler extends WidgetsBindingObserver {
  KeyboardLifecycleEventHandler({required this.onKeyboardVisibilityChanged});
  final Function(bool) onKeyboardVisibilityChanged;

  @override
  void didChangeMetrics() {
    final bool keyboardVisible =
        // ignore: deprecated_member_use
        WidgetsBinding.instance.window.viewInsets.bottom > 0;
    onKeyboardVisibilityChanged(keyboardVisible);
  }
}

void copyText(String text) {
  Clipboard.setData(ClipboardData(text: text)).then((_) {
    SnackBarHelper.showMessage('コピーされました。');
  });
}

void shareText(String text) {}

void openBrowser(path) {
  launchUrl(
    Uri.parse(path),
    mode: LaunchMode.externalApplication,
    webViewConfiguration: const WebViewConfiguration(enableJavaScript: true),
  );
}

void openBrowserInApp(path) {
  launchUrl(
    Uri.parse(path),
    mode: LaunchMode.inAppWebView,
    webOnlyWindowName: '',
    webViewConfiguration: const WebViewConfiguration(enableJavaScript: true),
  );
}

int? numberOfLines(TextStyle style, String text) {
  final Size sizeFull = (TextPainter(
    text: TextSpan(
      text: text,
      style: style,
    ),
    textScaler: TextScaler.noScaling,
    textDirection: TextDirection.ltr,
  )..layout())
      .size;
  final numberOfLineBreak = text.split('\n').length;
  final numberOfLine = sizeFull.width / (Get.width - 92);
  final int numberOfLines = numberOfLine.round() + numberOfLineBreak;
  return numberOfLines;
}
