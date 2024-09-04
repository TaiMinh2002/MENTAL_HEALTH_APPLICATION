import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/base_widget/custom_dropdown.dart';
import 'package:mental_healing/base_widget/widget_input_text.dart';
import 'package:mental_healing/generated/locales.g.dart';
import 'package:mental_healing/global/app_enum_ex.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/personal_information/component/edit_age.dart';
import 'package:mental_healing/page/personal_information/personal_information_controller.dart';
import 'package:mental_healing/global/app_enum.dart';

class EditInfo extends StatelessWidget {
  final PersonalInformationController controller =
      Get.put(PersonalInformationController());

  EditInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _sleepWidget(context),
              _stressWidget(context),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const EditAge(),
                _moodWidget(context),
              ],
            ),
          ),
          _userNameWidget(),
          _passwordWidget(),
          _saveSettingButton(),
        ],
      ),
    );
  }

  Widget _moodWidget(BuildContext context) {
    return CustomDropdown(
      title: 'Mood',
      items: Mood.values.map((mood) => mood.title).toList(),
      initialValue: Mood.values.first.title,
    );
  }

  Widget _sleepWidget(BuildContext context) {
    return CustomDropdown(
      title: 'Sleep',
      items: Sleep.values.map((sleep) => sleep.title).toList(),
      initialValue: Sleep.values.first.title,
    );
  }

  Widget _stressWidget(BuildContext context) {
    return CustomDropdown(
      title: 'Stress',
      items: Stress.values.map((stress) => stress.title).toList(),
      initialValue: Stress.values.first.title,
    );
  }

  Widget _userNameWidget() {
    return WidgetInputText(
      hintText: 'localeKeys.enter_username.tr',
      controller: controller.usernameController,
      validator: controller.checkUsernameValidator,
      textCapitalization: TextCapitalization.none,
      title: 'Username',
      borderRadius: 20,
    );
  }

  Widget _passwordWidget() {
    return WidgetInputText(
      hintText: 'localeKeys.password_placeholder.tr',
      controller: controller.passwordController,
      validator: controller.checkPasswordValidator,
      textCapitalization: TextCapitalization.none,
      title: 'Password',
      obscureText: true,
      borderRadius: 20,
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
