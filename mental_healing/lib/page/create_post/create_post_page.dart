import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/base_widget/widget_input_text.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/create_post/create_post_controller.dart';

class CreatePostPage extends BaseScreen<CreatePostController> with BaseMixin {
  CreatePostPage({super.key});

  @override
  Widget builder() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              _headerWidget(),
              _inputWidget(),
              _createButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerWidget() {
    return Text(
      'Create Post',
      style: textStyle.bold(size: 24, color: color.blackColor),
    );
  }

  Widget _inputWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: controller.formKey,
        autovalidateMode: controller.firstValidation.value
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        child: Column(
          children: [
            _titleInput(),
            _contentInput(),
          ],
        ),
      ),
    );
  }

  Widget _titleInput() {
    return WidgetInputText(
      hintText: LocaleKeys.username_placeholder.tr,
      controller: controller.titleController,
      validator: controller.checkTitleValidator,
      textCapitalization: TextCapitalization.none,
      title: 'Title',
      borderRadius: 20,
      iconLeading: AssetIcons.person,
    );
  }

  Widget _contentInput() {
    return WidgetInputText(
      hintText: LocaleKeys.email_or_phone_number.tr,
      controller: controller.contentController,
      validator: controller.checkContentValidator,
      textCapitalization: TextCapitalization.none,
      title: 'Content',
      borderRadius: 20,
      iconLeading: AssetIcons.iconEmail,
    );
  }

  Widget _createButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 35, right: 16, left: 16, bottom: 20),
      child: ButtonWidget(
        onClick: controller.handelCreatePost,
        textSize: 18,
        title: 'Create Post',
        suffixIcon: AssetIcons.next,
        height: 55,
        width: double.infinity,
      ),
    );
  }

  @override
  CreatePostController? putController() => CreatePostController();
}
