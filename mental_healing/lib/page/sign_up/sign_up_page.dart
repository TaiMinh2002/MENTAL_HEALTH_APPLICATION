import 'package:flutter/gestures.dart';
import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/base_widget/widget_input_text.dart';
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
              _formInput(),
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
          fontSize: 30,
          fontWeight: FontWeight.w900,
          color: Color(0xff4F3422),
        ),
      ),
    );
  }

  Widget _formInput() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Obx(
          () => Form(
            key: controller.formKey,
            autovalidateMode: controller.firstValidation.value
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            child: Column(children: [
              _emailWidget(),
              _passwordWidget(),
              _confirmPasswordWidget()
            ]),
          ),
        ));
  }

  Widget _emailWidget() {
    return WidgetInputText(
      hintText: 'Enter your email...',
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
      hintText: 'Enter your password...',
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
      hintText: 'Enter your confirm password...',
      controller: controller.confirmPasswordController,
      title: 'Confirm Password',
      validator: controller.checkPasswordValidator,
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
        title: 'Sign Up',
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
            const TextSpan(
              text: 'Already have an account? ',
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff736B66),
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: 'Sign In',
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
