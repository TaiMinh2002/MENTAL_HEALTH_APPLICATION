import 'package:flutter/cupertino.dart';
// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mental_healing/import.dart';

extension CameraImageEx on XFile {
  static Future<XFile?> handlePickImage({
    required ImageSource source,
    double maxHeight = 720,
    double maxWidth = 720,
  }) async {
    if (await requestPermission(source) == true) {
      final result = await ImagePicker().pickImage(
        maxHeight: maxHeight,
        maxWidth: maxWidth,
        source: source,
      );
      return result;
    } else {
      return null;
    }
  }

  static Future<bool> requestPermission(ImageSource source) async {
    final PermissionStatus? permission;
    switch (source) {
      case ImageSource.camera:
        await Permission.camera.request();
        permission = await Permission.camera.status;
        break;
      case ImageSource.gallery:
        await Permission.photos.request();
        permission = await Permission.photos.status;
        break;
    }

    switch (permission) {
      case PermissionStatus.granted:
      case PermissionStatus.limited:
        return true;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.provisional:
        _showRequestPermission(
            source == ImageSource.camera ? 'Camera' : 'Thu vien');
        return false;
    }
  }

  static void _showRequestPermission(String message) {
    showCupertinoDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (context) => CupertinoAlertDialog(
        content: Text(
          message,
          style: AppTextStyle().regular(size: 14),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              'Di toi setting',
              style: AppTextStyle().regular(size: 16, color: Colors.blue),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings();
            },
          ),
          CupertinoDialogAction(
            child: Text(
              'Thoat',
              style: AppTextStyle().regular(size: 16, color: Colors.red),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
