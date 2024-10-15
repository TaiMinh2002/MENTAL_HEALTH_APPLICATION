import 'dart:async';
import 'dart:math';

import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/base_widget/loading_helper.dart';
import 'package:mental_healing/base_widget/snack_bar_helper.dart';
import 'package:mental_healing/import.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mental_healing/model/forum_model.dart';
import 'package:mental_healing/utils/cache_manager.dart';
import 'package:mental_healing/utils/config.dart';
import 'package:mental_healing/utils/function.dart';
import 'package:mime/mime.dart';

class ForumController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxList<ForumModel> forumList = <ForumModel>[].obs;
  RxBool isLoading = false.obs;
  RxInt currentPage = 1.obs;
  RxBool hasMore = true.obs;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final createForumFormKey = GlobalKey<FormState>();
  RxBool firstValidation = false.obs;
  RxString displayedText = ''.obs;
  int _currentWordIndex = 0;
  late Timer _timer;
  late AnimationController animationController;
  List<String> words = [];
  final ImagePicker _picker = ImagePicker();
  Rx<XFile?> coverImageFile = Rx<XFile?>(null);

  @override
  void onInit() {
    super.onInit();
    getAllForums();
  }

  String? checkTitleValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return LocaleKeys.enter_username.tr;
    }
    return null;
  }

  String? checkDescriptionValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return LocaleKeys.enter_email.tr;
    }
    return null;
  }

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
      Get.offNamed(AppRouter.routerCreateForum);
    });
  }

  Future<void> getAllForums({bool isLoadMore = false}) async {
    final String? token = CacheManager.getStoredToken();

    if (token == null || token.isEmpty) {
      SnackBarHelper.showError(LocaleKeys.token_missing.tr);
      return;
    }

    const String forumUrl = '${Config.apiUrl}/forums';

    try {
      isLoading.value = true;

      final Map<String, String> queryParameters = {
        'page': currentPage.value.toString(),
        'limit': '10',
      };

      final uri = Uri.parse(forumUrl).replace(queryParameters: queryParameters);

      final http.Response response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final List<ForumModel> fetchedForums = (responseData['data'] as List)
            .map((item) => ForumModel.fromJson(item))
            .toList();

        fetchedForums.shuffle(Random());

        if (isLoadMore) {
          forumList.addAll(fetchedForums);
        } else {
          forumList.value = fetchedForums;
        }

        currentPage.value += 1;
        hasMore.value = responseData['has_more_pages'];
      } else {
        final errorResponse = jsonDecode(response.body);
        SnackBarHelper.showError(errorResponse['message']);
      }
    } catch (e) {
      SnackBarHelper.showError(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void loadMore() {
    if (hasMore.value && !isLoading.value) {
      getAllForums(isLoadMore: true);
    }
  }

  Future<void> handleJoinForum(int forumId) async {
    final String? token = CacheManager.getStoredToken();

    if (token == null || token.isEmpty) {
      SnackBarHelper.showError(LocaleKeys.token_is_missing.tr);
      return;
    }

    final String joinForumUrl = '${Config.apiUrl}/forums/join/$forumId';

    try {
      final response = await http.post(
        Uri.parse(joinForumUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        getAllForums();
      } else {
        final errorResponse = jsonDecode(response.body);
        SnackBarHelper.showError(errorResponse['error']);
      }
    } catch (e) {
      print('Error joining forum: $e');
      SnackBarHelper.showError(e.toString());
    }
  }

  Future<void> handleOutForum(int forumId) async {
    final String? token = CacheManager.getStoredToken();

    if (token == null || token.isEmpty) {
      SnackBarHelper.showError(LocaleKeys.token_is_missing.tr);
      return;
    }

    final String outForumUrl = '${Config.apiUrl}/forums/leave/$forumId';

    try {
      final response = await http.post(
        Uri.parse(outForumUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        getAllForums();
      } else {
        final errorResponse = jsonDecode(response.body);
        SnackBarHelper.showError(errorResponse['error']);
      }
    } catch (e) {
      SnackBarHelper.showError(e.toString());
    }
  }

  Future<void> handleIntroForum() async {
    Get.toNamed(AppRouter.routerIntroForum);
  }

  bool validation() {
    if (createForumFormKey.currentState?.validate() == true) {
      createForumFormKey.currentState!.save();
    }
    if (!firstValidation.value) {
      firstValidation.value = true;
    }
    if (titleController.text.trim().isEmpty ||
        descriptionController.text.trim().isEmpty) {
      return false;
    }
    return createForumFormKey.currentState?.validate() ?? false;
  }

  Future<void> handleToDetail() async {
    Get.offNamed(AppRouter.routerForumDetail);
  }

  void showCoverImageOptions(BuildContext context) {
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
                    coverImageFile.value = image;
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
                    coverImageFile.value = image;
                  }
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: Text(LocaleKeys.remove_avatar.tr),
                onTap: () {
                  coverImageFile.value = null;
                  Get.back();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> handleCreateForum() async {
    final Map<String, String> createData = {
      'title': titleController.text.trim(),
      'description': descriptionController.text.trim(),
    };

    final String? token = CacheManager.getStoredToken();
    if (token == null) {
      SnackBarHelper.showError(LocaleKeys.token_is_missing.tr);
      return;
    }

    String createUrl = '${Config.apiUrl}/forums/create';

    try {
      LoadingHelper.showLoading();

      var request = http.MultipartRequest('POST', Uri.parse(createUrl))
        ..headers['Authorization'] = 'Bearer $token';

      createData.forEach((key, value) {
        request.fields[key] = value;
      });

      if (coverImageFile.value != null) {
        var mimeType = lookupMimeType(coverImageFile.value!.path);

        if (mimeType != null && mimeType.startsWith('image/')) {
          var image = await http.MultipartFile.fromPath(
            'cover_image',
            coverImageFile.value!.path,
            contentType: MediaType.parse(mimeType),
          );
          request.files.add(image);
        } else {
          SnackBarHelper.showError(LocaleKeys.only_images_allowed.tr);
          return;
        }
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await http.Response.fromStream(response);
        var data = jsonDecode(responseData.body);
        SnackBarHelper.showMessage(LocaleKeys.forum_created_successfully.tr);
        handleToDetail();
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

  Future<void> handleUpdateForum(int forumId) async {
    final Map<String, String> updateData = {
      'title': titleController.text.trim(),
      'description': descriptionController.text.trim(),
    };

    final String? token = CacheManager.getStoredToken();
    if (token == null) {
      SnackBarHelper.showError(LocaleKeys.token_is_missing.tr);
      return;
    }

    String updateUrl = '${Config.apiUrl}/forum/$forumId/update';

    try {
      LoadingHelper.showLoading();

      var request = http.MultipartRequest('POST', Uri.parse(updateUrl))
        ..headers['Authorization'] = 'Bearer $token';

      updateData.forEach((key, value) {
        request.fields[key] = value;
      });

      if (coverImageFile.value != null) {
        var mimeType = lookupMimeType(coverImageFile.value!.path);

        if (mimeType != null && mimeType.startsWith('image/')) {
          var image = await http.MultipartFile.fromPath(
            'file',
            coverImageFile.value!.path,
            contentType: MediaType.parse(mimeType),
          );
          request.files.add(image);
        } else {
          SnackBarHelper.showError(LocaleKeys.only_images_allowed.tr);
          return;
        }
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await http.Response.fromStream(response);
        SnackBarHelper.showMessage(LocaleKeys.forum_updated_successfully.tr);
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

  @override
  void onClose() {
    _timer.cancel();
    animationController.dispose();
    super.onClose();
  }
}
