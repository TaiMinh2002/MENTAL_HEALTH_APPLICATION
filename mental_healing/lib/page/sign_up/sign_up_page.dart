import 'package:flutter/gestures.dart';
import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/base_widget/widget_input_text.dart';
import 'package:mental_healing/generated/locales.g.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/sign_up/sign_up_controller.dart';

class SignUpPage extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());
  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF7F4F2),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(AssetImages.signInImage),
              _headerWidget(),
              _inputWidget(),
              _signUpButton(),
              _signInWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerWidget() {
    return const Padding(
      padding: EdgeInsets.only(top: 30.0, bottom: 20),
      child: Text(
        'Sign Up For Free',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w900,
          color: Color(0xff4F3422),
        ),
      ),
    );
  }

  Widget _inputWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: controller.signUpFormKey,
        autovalidateMode: controller.firstValidation.value
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        child: Column(
          children: [
            _userNameWidget(),
            _emailWidget(),
            _passwordWidget(),
            _confirmPasswordWidget(),
          ],
        ),
      ),
    );
  }

  Widget _userNameWidget() {
    return WidgetInputText(
      hintText: LocaleKeys.enter_username.tr,
      controller: controller.usernameController,
      validator: controller.checkUsernameValidator,
      textCapitalization: TextCapitalization.none,
      title: 'Username',
      borderRadius: 20,
      iconLeading: AssetIcons.person,
    );
  }

  Widget _emailWidget() {
    return WidgetInputText(
      hintText: LocaleKeys.email_placeholder.tr,
      controller: controller.emailController,
      validator: controller.checkEmailValidator,
      textCapitalization: TextCapitalization.none,
      title: 'Email',
      borderRadius: 20,
      iconLeading: AssetIcons.iconEmail,
    );
  }

  Widget _passwordWidget() {
    return WidgetInputText(
      hintText: LocaleKeys.password_placeholder.tr,
      controller: controller.passwordController,
      title: 'Password',
      validator: controller.checkPasswordValidator,
      textCapitalization: TextCapitalization.none,
      iconLeading: AssetIcons.iconPassword,
      obscureText: true,
      borderRadius: 20,
    );
  }

  Widget _confirmPasswordWidget() {
    return WidgetInputText(
      hintText: LocaleKeys.username_placeholder.tr,
      controller: controller.confirmPasswordController,
      title: 'Confirm Password',
      validator: controller.checkConFirmPasswordValidator,
      textCapitalization: TextCapitalization.none,
      iconLeading: AssetIcons.iconPassword,
      obscureText: true,
      borderRadius: 20,
    );
  }

  Widget _signUpButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 35, right: 16, left: 16, bottom: 20),
      child: ButtonWidget(
        onClick: controller.handleSignUp,
        textSize: 18,
        title: LocaleKeys.sign_up.tr,
        suffixIcon: AssetIcons.next,
        height: 55,
        width: double.infinity,
      ),
    );
  }

  Widget _signInWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: LocaleKeys.already_have_account.tr,
              style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff736B66),
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: LocaleKeys.sign_in.tr,
              style: const TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                  color: Color(0xffED7E1C),
                  fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  controller.handleSignIn();
                },
            ),
          ],
        ),
      ),
    );
  }
}
