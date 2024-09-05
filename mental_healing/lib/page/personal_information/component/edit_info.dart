import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/base_widget/custom_dropdown.dart';
import 'package:mental_healing/base_widget/widget_input_text.dart';
import 'package:mental_healing/global/app_enum_ex.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/personal_information/component/edit_age.dart';
import 'package:mental_healing/page/personal_information/personal_information_controller.dart';
import 'package:mental_healing/global/app_enum.dart';
import 'package:mental_healing/utils/cache_manager.dart';

class EditInfo extends StatelessWidget {
  final PersonalInformationController controller =
      Get.put(PersonalInformationController());

  EditInfo({super.key});

  @override
  Widget build(BuildContext context) {
    if (controller.user != null) {
      controller.initializeUserInfoFromDb(controller.user?.mood ?? 0,
          controller.user?.sleep ?? 0, controller.user?.stress ?? 0);
    }
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
    return Obx(() => CustomDropdown(
          title: 'Mood',
          items: Mood.values.map((mood) => mood.title).toList(),
          initialValue: controller.selectedMood.value.title,
          onChanged: (String title) {
            final mood = Mood.values.firstWhere((mood) => mood.title == title);
            controller.updateMood(mood);
          },
        ));
  }

  Widget _sleepWidget(BuildContext context) {
    return Obx(() => CustomDropdown(
          title: 'Sleep',
          items: Sleep.values.map((sleep) => sleep.title).toList(),
          initialValue: controller.selectedSleep.value.title,
          onChanged: (String title) {
            final sleep =
                Sleep.values.firstWhere((sleep) => sleep.title == title);
            controller.updateSleep(sleep);
          },
        ));
  }

  Widget _stressWidget(BuildContext context) {
    return Obx(() => CustomDropdown(
          title: 'Stress',
          items: Stress.values.map((stress) => stress.title).toList(),
          initialValue: controller.selectedStress.value.title,
          onChanged: (String title) {
            final stress =
                Stress.values.firstWhere((stress) => stress.title == title);
            controller.updateStress(stress);
          },
        ));
  }

  Widget _userNameWidget() {
    return WidgetInputText(
      hintText: CacheManager.getStoredUser()?.username ?? '',
      controller: controller.usernameController,
      validator: controller.checkUsernameValidator,
      textCapitalization: TextCapitalization.none,
      title: 'Username',
      borderRadius: 20,
    );
  }

  Widget _passwordWidget() {
    return WidgetInputText(
      hintText: LocaleKeys.enter_new_password.tr,
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
        onClick: controller.handleSaveSetting,
        textSize: 18,
        title: LocaleKeys.save_setting.tr,
        suffixIcon: AssetIcons.next,
        height: 55,
        width: double.infinity,
      ),
    );
  }
}
