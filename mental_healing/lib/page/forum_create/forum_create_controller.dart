// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:mental_healing/common/helpers/snack_bar_helper.dart';
import 'package:mental_healing/data/model/forums/forum_create_params.dart';
import 'package:mental_healing/data/use_case/forum_use_case.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/forum_list/forum_list_controller.dart';
import 'package:dio/dio.dart' as dio;
import 'package:mime/mime.dart';

class ForumCreateController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final RxBool firstValidate = false.obs;
  int _currentWordIndex = 0;
  RxString displayedText = ''.obs;
  late Timer _timer;
  late AnimationController animationController;
  List<String> words = [];
  Rx<File?> coverImageFile = Rx<File?>(null);
  RxBool isDisableButton = true.obs;
  bool isChangeCoverImage = false;
  RxBool firstValidation = false.obs;

  final ForumUseCase _forumUseCase = ForumUseCase();

  void setupTextAnimation(String fullText) {
    words = fullText.split(' ');
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    startTextAnimation();
  }

  void startTextAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (_currentWordIndex < words.length) {
        displayedText.value += '${words[_currentWordIndex]} ';
        _currentWordIndex++;
        animationController.forward(from: 0);
      } else {
        _timer.cancel();
        _moveToCreateForum();
      }
    });
  }

  void handleSkip() {
    _timer.cancel();
    displayedText.value = words.join(' ');
    _moveToCreateForum();
  }

  void _moveToCreateForum() {
    Future.delayed(const Duration(seconds: 1), () {
      Get.offNamed(AppRouter.routerForumCreatePage);
    });
  }

  Future<void> pickImage({required ImageSource imageSource}) async {
    final XFile? imgFile = await ImagePicker().pickImage(source: imageSource);
    if (imgFile != null) {
      coverImageFile.value = File(imgFile.path);
    }
  }

  void isChangeImage(String? initPath) {
    if (isNullOrEmpty(coverImageFile.value?.path)) {
      return;
    }
    if (coverImageFile.value?.path == initPath) {
      isChangeCoverImage = false;
    } else {
      isChangeCoverImage = true;
    }
  }

  String? validateTitle(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return LocaleKeys.requiredTitle.tr;
    }
    return null;
  }

  String? validateDescription(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return LocaleKeys.requiredDescription.tr;
    }
    return null;
  }

  bool validation() {
    if (formKey.currentState?.validate() == true) {
      formKey.currentState!.save();
    }
    if (!firstValidation.value) {
      firstValidation.value = true;
    }
    if (titleController.text.trim().isEmpty ||
        descriptionController.text.trim().isEmpty) {
      return false;
    }
    return formKey.currentState?.validate() ?? false;
  }

  Future<void> handleCreateForum() async {
    if (validation()) {
      dio.MultipartFile? coverImageMultipart;
      if (coverImageFile.value != null) {
        final mimeType = lookupMimeType(coverImageFile.value!.path);
        final extension = mimeType?.split('/').last ?? 'jpg';
        coverImageMultipart = await dio.MultipartFile.fromFile(
          coverImageFile.value!.path,
          filename: coverImageFile.value!.path.split('/').last,
          contentType: dio.DioMediaType.parse('image/$extension'),
        );
      }

      final params = ForumCreateParams(
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        cover_image: coverImageMultipart,
      );
      showLoading();

      await _forumUseCase
          .createForum(
            param: params,
            onSuccess: (data) {
              print('Forum created successfully');
              Get.offNamed(AppRouter.routerForumDetailPage, arguments: data.id);
            },
            onFailure: (error) {
              SnackBarHelper.showError(error.message);
            },
          )
          .whenComplete(() => hideLoading());
    }
  }

  @override
  void onClose() {
    _timer.cancel();
    animationController.dispose();
    if (Get.isRegistered<ForumListController>()) {
      Get.find<ForumListController>().onRefresh();
    }

    super.onClose();
  }
}
