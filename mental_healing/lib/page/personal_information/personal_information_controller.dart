import 'package:flutter/cupertino.dart';
import 'package:mental_healing/generated/locales.g.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/utils/function.dart';
import 'package:mental_healing/utils/string.dart';
import 'package:image_picker/image_picker.dart';

class PersonalInformationController extends GetxController {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final editFormKey = GlobalKey<FormState>();
  RxBool firstValidation = false.obs;
  RxInt selectedAge = 20.obs;
  final ImagePicker _picker = ImagePicker();
  Rx<XFile?> imageFile = Rx<XFile?>(null);

  String? checkUsernameValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return LocaleKeys.enter_username.tr;
    }
    return null;
  }

  String? checkEmailValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return LocaleKeys.enter_email.tr;
    }
    return null;
  }

  String? checkPasswordValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return LocaleKeys.enter_password.tr;
    }
    if (value!.trim().length < 8) {
      return LocaleKeys.password_requirements.tr;
    }
    if (!value.trim().validatePassword()) {
      return LocaleKeys.password_complexity.tr;
    }
    return null;
  }

  String? checkConFirmPasswordValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return LocaleKeys.please_enter_confirm_password.tr;
    }
    if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      return LocaleKeys.passwords_no_match.tr;
    }
    return null;
  }

  bool validation() {
    if (editFormKey.currentState?.validate() == true) {
      editFormKey.currentState!.save();
    }
    if (!firstValidation.value) {
      firstValidation.value = true;
    }
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        confirmPasswordController.text.trim().isEmpty) {
      return false;
    }
    return editFormKey.currentState?.validate() ?? false;
  }

  void updateSelectedAge(int age) {
    selectedAge.value = age;
  }

  void showAgePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 250,
          child: CupertinoPicker(
            scrollController:
                FixedExtentScrollController(initialItem: selectedAge.value),
            onSelectedItemChanged: (int index) {
              updateSelectedAge(index);
            },
            itemExtent: 32.0,
            children: List<Widget>.generate(101, (int index) {
              return Center(child: Text('$index'));
            }),
          ),
        );
      },
    );
  }

  void showAvatarOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text(LocaleKeys.take_photo.tr),
                onTap: () async {
                  XFile? image =
                      await _picker.pickImage(source: ImageSource.camera);
                  if (image != null) {
                    imageFile.value = image;
                  }
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text(LocaleKeys.choose_from_gallery.tr),
                onTap: () async {
                  XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    imageFile.value = image;
                  }
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: Text(LocaleKeys.remove_avatar.tr),
                onTap: () {
                  imageFile.value = null;
                  Get.back();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
