import 'dart:io';

import 'package:mental_healing/base_widget/app_bar_custom.dart';
// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';
import 'package:mental_healing/common/widget_components/button/widget_button.dart';
import 'package:mental_healing/common/widget_components/input_field/widget_input_text.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/forum_create/component/select_cover_image.dart';
import 'package:mental_healing/page/forum_create/forum_create_controller.dart';

class ForumCreatePage extends BaseScreen<ForumCreateController> with BaseMixin {
  ForumCreatePage({super.key});

  @override
  Widget builder() {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarCustom(
          leadingIcon: AssetIcons.back,
          titleAppBar: LocaleKeys.create_forum.tr,
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [_coverImage(), _formInput(), _createButton()],
            ),
          ),
        ),
      ),
    );
  }

  Widget _formInput() {
    return Form(
      key: controller.formKey,
      autovalidateMode: controller.firstValidation.value
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      child: Column(
        children: [
          _titleInput(),
          _descriptionInput(),
        ],
      ),
    );
  }

  Widget _coverImage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.add_cover_photo.tr,
          style: textStyle.extraBold(size: 16, color: color.blackColor),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2.0, bottom: 10),
          child: Text(
            LocaleKeys.add_intro_image.tr,
            style: textStyle.regular(size: 14, color: color.blackColor),
          ),
        ),
        Obx(
          () => Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: controller.coverImageFile.value != null
                    ? Image.file(File(controller.coverImageFile.value!.path))
                    : Image.asset(AssetImages.constCoverImage),
              ),
              Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: color.whiteColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: GestureDetector(
                      onTap: showChooseImgPickerModal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: SvgPicture.asset(
                              AssetIcons.edit,
                              height: 15,
                              width: 15,
                            ),
                          ),
                          Text(
                            LocaleKeys.edit.tr,
                            style: textStyle.extraBold(size: 16),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ],
    );
  }

  Widget _titleInput() {
    return WidgetInputText(
      marginTop: 40.h,
      hintText: LocaleKeys.enter_your_title.tr,
      controller: controller.titleController,
      validator: controller.validateTitle,
      showRequired: true,
      title: 'Title',
    );
  }

  Widget _descriptionInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Description', style: textStyle.semiBold(size: 12)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(LocaleKeys.describe_your_forum.tr,
                    style: textStyle.regular(size: 10)),
              )
            ],
          ),
          WidgetInputText(
            minLines: 3,
            maxLines: 3,
            textInputType: TextInputType.multiline,
            hintText: LocaleKeys.enter_your_description.tr,
            validator: controller.validateDescription,
            controller: controller.descriptionController,
            iconNextTextInputAction: TextInputAction.newline,
          ),
        ],
      ),
    );
  }

  Widget _createButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 35, right: 16, left: 16, bottom: 20),
      child: WidgetButton(
        title: LocaleKeys.create_forum.tr,
        onClick: controller.handleCreateForum,
        width: Get.width,
        margin: EdgeInsets.symmetric(vertical: 40.h),
      ),
    );
  }

  void showChooseImgPickerModal() {
    showModalBottomSheet(
        context: context,
        backgroundColor: color.whiteColor,
        builder: (context) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              child: Wrap(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.w),
                            child: Text(LocaleKeys.selectPhotoMethod.tr,
                                style: textStyle.semiBold(size: 18)),
                          ),
                        ),
                        GestureDetector(
                            onTap: Get.back,
                            child: Icon(Icons.close,
                                size: 22, color: color.blackColor))
                      ],
                    ),
                  ),
                  appDivider(),
                  SelectCoverImage(
                      title: LocaleKeys.take_photo.tr,
                      onTapItem: () {
                        controller.pickImage(imageSource: ImageSource.camera);
                        Get.back();
                      }),
                  appDivider(),
                  SelectCoverImage(
                      title: LocaleKeys.choose_from_gallery.tr,
                      onTapItem: () {
                        controller.pickImage(imageSource: ImageSource.gallery);
                        Get.back();
                      }),
                  appDivider(),
                  SizedBox(height: 60.h),
                ],
              ),
            ),
          );
        });
  }

  @override
  ForumCreateController? putController() => ForumCreateController();
}
