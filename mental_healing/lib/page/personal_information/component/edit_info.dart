import 'package:mental_healing/base_widget/widget_input_text.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/personal_information/personal_information_controller.dart';

class EditInfo extends StatelessWidget {
  final PersonalInformationController controller =
      Get.put(PersonalInformationController());

  EditInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          _userNameWidget(),
          _passwordWidget(),
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
}
