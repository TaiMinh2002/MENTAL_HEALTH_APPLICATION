import 'package:mental_healing/generated/locales.g.dart';
import 'package:mental_healing/import.dart';

class SnackBarHelper {
  static void showMessage(
    String message, {
    String? title,
    Duration duration = const Duration(seconds: 1),
  }) {
    ScaffoldMessenger.of(Get.context!).clearSnackBars();
    final snackBar = SnackBar(
      content: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                Text(
                  message,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => ScaffoldMessenger.of(Get.context!)
                .hideCurrentSnackBar(reason: SnackBarClosedReason.action),
            child: Container(
              width: 50,
              height: 35,
              margin: const EdgeInsets.only(left: 10),
              child: const Icon(Icons.close, size: 26, color: Colors.white),
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.endToStart,
      margin: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      backgroundColor: const Color(0xff9BB168),
      duration: duration,
    );

    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  static void showError(
    String message, {
    Duration duration = const Duration(seconds: 3),
    String? title,
  }) {
    ScaffoldMessenger.of(Get.context!).clearSnackBars();
    final snackBar = SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      content: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                Text(
                  message,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => ScaffoldMessenger.of(Get.context!)
                .hideCurrentSnackBar(reason: SnackBarClosedReason.action),
            child: Container(
              width: 50,
              height: 35,
              margin: const EdgeInsets.only(left: 10),
              child: const Icon(Icons.close, size: 26, color: Colors.white),
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.endToStart,
      margin: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      backgroundColor: Colors.red,
      duration: duration,
    );

    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  void showNetworkError(
      {Duration duration = const Duration(seconds: 5), String? message}) {
    ScaffoldMessenger.of(Get.context!).clearSnackBars();
    final snackBar = SnackBar(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.communication_error.tr,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          Text(
            message ?? LocaleKeys.check_internet_connection.tr,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      action: SnackBarAction(
        label: 'OK',
        onPressed: () async {},
        textColor: Colors.white,
      ),
      duration: duration,
    );

    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
}
