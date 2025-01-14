import 'package:mental_healing/common/helpers/snack_bar_helper.dart';
import 'package:mental_healing/data/model/post/create_post_params.dart';
import 'package:mental_healing/data/model/post/create_post_result.dart';
import 'package:mental_healing/data/use_case/post_use_case.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/forum_detail/forum_detail_controller.dart';
import 'package:mental_healing/page/forum_list/forum_list_controller.dart';

class CreatePostController extends BaseController {
  final formKey = GlobalKey<FormState>();

  CreatePostParams _params = const CreatePostParams();
  final PostUseCase _useCase = PostUseCase();
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  RxBool firstValidation = false.obs;
  late int forum_id;

  @override
  void onInit() {
    forum_id = Get.arguments;
    super.onInit();
  }

  void handelCreatePost() {
    if (validation()) {
      final title = titleController.text.trim();
      final content = contentController.text.trim();
      _params =
          _params.copyWith(title: title, content: content, forum_id: forum_id);
      showLoading();
      _useCase
          .createPost(
            params: _params,
            onSuccess: (CreatePostResult result) async {
              await Get.find<ForumDetailController>().onRefresh();
              Get.offNamed(AppRouter.routerForumDetailPage,
                  arguments: result.forum_id);
            },
            onFailure: (err) {
              SnackBarHelper.showError(err.message);
            },
          )
          .whenComplete(() => hideLoading());
    }
  }

  bool validation() {
    if (formKey.currentState?.validate() == true) {
      formKey.currentState!.save();
    }
    if (!firstValidation.value) {
      firstValidation.value = true;
    }

    return formKey.currentState?.validate() ?? false;
  }

  String? checkTitleValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return LocaleKeys.requiredTitle.tr;
    }
    return null;
  }

  String? checkContentValidator(String? value) {
    if (isNullOrEmpty(value?.trim())) {
      return 'content required';
    }

    return null;
  }

  @override
  void onClose() {
    Get.find<ForumListController>().onRefresh();
    super.onClose();
  }
}
