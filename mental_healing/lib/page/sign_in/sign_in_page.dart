import 'package:flutter/gestures.dart';
import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/base_widget/widget_input_text.dart';
import 'package:mental_healing/generated/locales.g.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/sign_in/sign_in_controller.dart';

class SignInPage extends StatelessWidget {
  final SignInController controller = Get.put(SignInController());
  SignInPage({super.key});

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
              _formInput(),
              _signInButton(),
              _forgotPasswordWidget(),
              _signUpWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 20),
      child: Text(
        LocaleKeys.sign_in_message.tr,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w900,
          color: Color(0xff4F3422),
        ),
      ),
    );
  }

  Widget _formInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: controller.signInFormKey,
        autovalidateMode: controller.firstValidation.value
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        child: Column(
          children: [
            _emailWidget(),
            _passwordWidget(),
          ],
        ),
      ),
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

  Widget _signInButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 35, right: 16, left: 16, bottom: 20),
      child: ButtonWidget(
        onClick: controller.handleSignIn,
        textSize: 18,
        title: LocaleKeys.sign_in.tr,
        suffixIcon: AssetIcons.next,
        height: 55,
        width: double.infinity,
      ),
    );
  }

  Widget _forgotPasswordWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            LocaleKeys.forgot_password.tr,
            style: const TextStyle(
                fontSize: 14,
                color: Color(0xffED7E1C),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _signUpWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: LocaleKeys.no_account.tr,
              style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff736B66),
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: LocaleKeys.sign_up.tr,
              style: const TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                  color: Color(0xffED7E1C),
                  fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  controller.handleSignUp();
                },
            ),
          ],
        ),
      ),
    );
  }
}
