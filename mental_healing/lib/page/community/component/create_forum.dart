import 'package:mental_healing/base_widget/app_bar_custom.dart';
import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/base_widget/widget_input_text.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/community/forum_controller.dart';

class CreateForum extends StatelessWidget {
  final ForumController controller = Get.put(ForumController());
  CreateForum({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarCustom(
          leadingIcon: AssetIcons.back,
          titleAppBar: LocaleKeys.create_forum.tr,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _coverImage(),
              _titleInput(),
              _descriptionInput(),
              _createButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _coverImage() {
    return Image.asset(AssetImages.forumCoverImage);
  }

  Widget _titleInput() {
    return WidgetInputText(
      hintText: LocaleKeys.email_placeholder.tr,
      controller: controller.titleController,
      validator: controller.checkTitleValidator,
      textCapitalization: TextCapitalization.none,
      title: 'Title',
      borderRadius: 20,
      iconLeading: AssetIcons.iconEmail,
    );
  }

  Widget _descriptionInput() {
    return WidgetInputText(
      hintText: LocaleKeys.enter_your_description.tr,
      controller: controller.descriptionController,
      validator: controller.checkDescriptionValidator,
      textCapitalization: TextCapitalization.none,
      title: 'Description',
      borderRadius: 20,
      iconLeading: AssetIcons.iconEmail,
    );
  }

  Widget _createButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 35, right: 16, left: 16, bottom: 20),
      child: ButtonWidget(
        onClick: () {},
        textSize: 18,
        title: LocaleKeys.create_forum.tr,
        suffixIcon: AssetIcons.next,
        height: 55,
        width: double.infinity,
      ),
    );
  }
}
