import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/base_widget/custom_dropdown.dart';
import 'package:mental_healing/base_widget/widget_input_text.dart';
import 'package:mental_healing/generated/locales.g.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/personal_information/personal_information_controller.dart';
import 'package:mental_healing/global/app_enum.dart';
import 'package:mental_healing/global/app_enum_ex.dart';

class EditInfo extends StatelessWidget {
  final PersonalInformationController controller =
      Get.put(PersonalInformationController());

  EditInfo({super.key});

  final List<int> ageItems = List<int>.generate(101, (index) => index);
  final List<Mood> moodItems = Mood.values;
  final List<Sleep> sleepItems = Sleep.values;
  final List<Stress> stressItems = Stress.values;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          _userNameWidget(),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ageWidget(context),
                _moodWidget(context),
              ],
            ),
          ),
          _passwordWidget(),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _sleepWidget(context),
                _stressWidget(context),
              ],
            ),
          ),
          _saveSettingButton()
        ],
      ),
    );
  }

  Widget _userNameWidget() {
    return WidgetInputText(
      hintText: 'LocaleKeys.enter_username.tr',
      controller: controller.usernameController,
      validator: controller.checkUsernameValidator,
      textCapitalization: TextCapitalization.none,
      title: 'Username',
      borderRadius: 20,
    );
  }

  Widget _passwordWidget() {
    return WidgetInputText(
      hintText: 'LocaleKeys.password_placeholder.tr',
      controller: controller.passwordController,
      title: 'Password',
      validator: controller.checkPasswordValidator,
      textCapitalization: TextCapitalization.none,
      obscureText: true,
      borderRadius: 20,
    );
  }

  Widget _ageWidget(BuildContext context) {
    return CustomDropdown<int>(
      items: ageItems,
      hintText: 'Select Age',
      initialValue: 20,
      width: MediaQuery.of(context).size.width * 0.45,
      title: 'Age',
      onChanged: (value) {
        print('Selected Age: $value');
      },
    );
  }

  Widget _moodWidget(BuildContext context) {
    return CustomDropdown<Mood>(
      items: moodItems,
      hintText: 'Select Mood',
      initialValue: Mood.tired,
      width: MediaQuery.of(context).size.width * 0.45,
      title: 'Mood',
      onChanged: (value) {
        print('Selected Mood: ${value?.title}');
      },
    );
  }

  Widget _sleepWidget(BuildContext context) {
    return CustomDropdown<Sleep>(
      items: sleepItems,
      hintText: 'Select Sleep',
      initialValue: Sleep.lessThan3Hours,
      width: MediaQuery.of(context).size.width * 0.45,
      title: 'Sleep',
      onChanged: (value) {
        print('Selected Sleep: ${value?.title}');
      },
    );
  }

  Widget _stressWidget(BuildContext context) {
    return CustomDropdown<Stress>(
      items: stressItems,
      hintText: 'Select Stress',
      initialValue: Stress.notStressed,
      width: MediaQuery.of(context).size.width * 0.45,
      title: 'Stress',
      onChanged: (value) {
        print('Selected Stress: ${value?.title}');
      },
    );
  }

  Widget _saveSettingButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 35, right: 16, left: 16, bottom: 20),
      child: ButtonWidget(
        onClick: () {},
        textSize: 18,
        title: LocaleKeys.save_setting.tr,
        suffixIcon: AssetIcons.next,
        height: 55,
        width: double.infinity,
      ),
    );
  }
}
