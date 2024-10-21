import 'dart:io';

import 'package:flutter/services.dart';
import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/base_widget/app_bar_custom.dart';
import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/base_widget/custom_input_text.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/community/forum_controller.dart';

class CreateForum extends StatelessWidget with BaseMixin {
  final ForumController controller = Get.put(ForumController());
  CreateForum({super.key});

  @override
  Widget build(BuildContext context) {
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
              children: [
                _coverImage(),
                _titleInput(),
                _descriptionInput(),
                _createButton()
              ],
            ),
          ),
        ),
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
        Stack(
          children: [
            Obx(() {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: controller.coverImageFile.value != null
                    ? Image.file(File(controller.coverImageFile.value!.path))
                    : Image.asset(AssetImages.constCoverImage),
              );
            }),
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
                    onTap: () {
                      controller.showCoverImageOptions(Get.context!);
                    },
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
      ],
    );
  }

  Widget _titleInput() {
    return CustomInputText(
      hintText: LocaleKeys.enter_your_title.tr,
      inputFormatters: [LengthLimitingTextInputFormatter(24)],
      showRequired: true,
      controller: controller.titleController,
      textInputType: TextInputType.text,
      marginTop: 10,
      fontSize: 14,
      hintFontSize: 14,
      title: 'Title',
      validator: controller.checkTitleValidator,
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
          CustomInputText(
            hintText: LocaleKeys.enter_your_description.tr,
            showRequired: false,
            controller: controller.descriptionController,
            textInputType: TextInputType.multiline,
            iconNextTextInputAction: TextInputAction.newline,
            inputFormatters: [LengthLimitingTextInputFormatter(500)],
            scrollPadding: const EdgeInsets.only(bottom: 150),
            marginTop: 10,
            minLines: 10,
            maxLines: 10,
            fontSize: 14,
            hintFontSize: 14,
            validator: controller.checkTitleValidator,
          ),
        ],
      ),
    );
  }

  Widget _createButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 35, right: 16, left: 16, bottom: 20),
      child: ButtonWidget(
        onClick: controller.handleCreateForum,
        textSize: 18,
        title: LocaleKeys.create_forum.tr,
        suffixIcon: AssetIcons.next,
        height: 55,
        width: double.infinity,
      ),
    );
  }
}
