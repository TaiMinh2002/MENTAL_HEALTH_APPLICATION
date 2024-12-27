import 'package:mental_healing/base_widget/app_bar_custom.dart';
import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/common/widget_components/input_field/widget_input_text.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/set_mood/set_mood_controller.dart';

class SetMoodPage extends BaseScreen<SetMoodController> with BaseMixin {
  SetMoodPage({super.key});

  @override
  Widget builder() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        appBar: AppBarCustom(
          backgroundColor: color.backgroundColor,
          elevation: 0,
          titleAppBar: LocaleKeys.mood.tr,
          centerTitle: false,
        ),
        body: Column(
          children: [
            Text(
              'How do you feel today?',
              style: textStyle.bold(size: 20, color: color.blackColor),
            ),
            WidgetInputText(
              minLines: 5,
              maxLines: 5,
              textInputType: TextInputType.multiline,
              hintText: LocaleKeys.writeYourMood.tr,
              controller: controller.noteController,
              iconNextTextInputAction: TextInputAction.newline,
            ),
            ButtonWidget(
              onClick: () {
                controller.setMood(controller.noteController.text.trim());
              },
              textSize: 18,
              textColor: color.whiteColor,
              title: LocaleKeys.set_mood.tr,
              height: 55,
              width: double.infinity,
              bgColor: color.color64B5F6,
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            ),
          ],
        ),
      ),
    );
  }

  @override
  SetMoodController? putController() => SetMoodController();
}
