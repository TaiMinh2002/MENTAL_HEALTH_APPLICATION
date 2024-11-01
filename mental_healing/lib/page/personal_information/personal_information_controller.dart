import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:mental_healing/base_widget/loading_helper.dart';
import 'package:mental_healing/base_widget/snack_bar_helper.dart';
import 'package:mental_healing/global/app_enum.dart';
import 'package:mental_healing/global/app_enum_ex.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/model/user_info.dart';
import 'package:mental_healing/utils/cache_manager.dart';
import 'package:mental_healing/utils/config.dart';
import 'package:mental_healing/utils/function.dart';
import 'package:mental_healing/utils/string.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

class PersonalInformationController extends GetxController {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final editFormKey = GlobalKey<FormState>();
  RxBool firstValidation = false.obs;
  RxInt selectedAge = (CacheManager.getStoredUser()?.age ?? 20).obs;
  final ImagePicker _picker = ImagePicker();
  Rx<XFile?> imageFile = Rx<XFile?>(null);
  Rx<Mood> selectedMood = Mood.great.obs;
  Rx<Sleep> selectedSleep = Sleep.sevenToNineHours.obs;
  Rx<Stress> selectedStress = Stress.notStressed.obs;
  final user = CacheManager.getStoredUser();

  void initializeUserInfoFromDb(int moodId, int sleepId, int stressId) {
    selectedMood.value = Mood.values
        .firstWhere((mood) => mood.id == moodId, orElse: () => Mood.great);
    selectedSleep.value = Sleep.values.firstWhere(
        (sleep) => sleep.id == sleepId,
        orElse: () => Sleep.sevenToNineHours);
    selectedStress.value = Stress.values.firstWhere(
        (stress) => stress.id == stressId,
        orElse: () => Stress.notStressed);
  }

  void updateMood(Mood mood) {
    selectedMood.value = mood;
  }

  void updateSleep(Sleep sleep) {
    selectedSleep.value = sleep;
  }

  void updateStress(Stress stress) {
    selectedStress.value = stress;
  }

  String? checkUsernameValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return LocaleKeys.enter_username.tr;
    }
    return null;
  }

  String? checkEmailValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return LocaleKeys.enter_email_or_phone_number.tr;
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
            itemExtent: 50.0,
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

  Future<void> handleSaveSetting() async {
    final Map<String, String> updateData = {
      'age': selectedAge.value.toString(),
      'username': usernameController.text.trim(),
      'mood': selectedMood.value.id.toString(),
      'sleep': selectedSleep.value.id.toString(),
      'stress': selectedStress.value.id.toString(),
    };

    final String? token = CacheManager.getStoredToken();
    if (token == null) {
      SnackBarHelper.showError(LocaleKeys.token_is_missing.tr);
      return;
    }

    String updateUrl =
        '${Config.apiUrl}/users/${CacheManager.getStoredUser()?.id}/update';

    try {
      LoadingHelper.showLoading();

      var request = http.MultipartRequest('POST', Uri.parse(updateUrl))
        ..headers['Authorization'] = 'Bearer $token';

      updateData.forEach((key, value) {
        request.fields[key] = value;
      });

      if (imageFile.value != null) {
        var mimeType = lookupMimeType(imageFile.value!.path);

        if (mimeType != null && mimeType.startsWith('image/')) {
          var image = await http.MultipartFile.fromPath(
            'avatar',
            imageFile.value!.path,
            contentType: MediaType.parse(mimeType),
          );
          request.files.add(image);
        } else {
          SnackBarHelper.showError(LocaleKeys.only_images_allowed.tr);
          return;
        }
      } else {
        request.fields['avatar'] = 'null';
      }

      // Gửi request
      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await http.Response.fromStream(response);
        var data = jsonDecode(responseData.body)['data'];
        var user = UserInfo.fromJson(data['user']);
        await CacheManager.storeUser(user);

        LoadingHelper.hideLoading();
        Get.back();
      } else {
        LoadingHelper.hideLoading();
        var errorResponse = await http.Response.fromStream(response);
        SnackBarHelper.showError(jsonDecode(errorResponse.body)['message']);
      }
    } catch (e) {
      LoadingHelper.hideLoading();
      SnackBarHelper.showError(e.toString());
    }
  }
}
