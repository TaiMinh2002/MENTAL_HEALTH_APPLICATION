import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/base_widget/widget_input_text.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/sign_up/sign_up_controller.dart';

class SignUpPage extends StatelessWidget with BaseMixin {
  final SignUpController controller = Get.put(SignUpController());
  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              _headerWidget(),
              _title(),
              _inputWidget(),
              _signUpButton(),
              _signInWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerWidget() {
    return Stack(
      children: [
        ClipPath(
          clipper: GreenHeaderClipper(),
          child: Container(
            color: color.color9BB168,
            height: 200,
            width: double.infinity,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 60,
          child: SvgPicture.asset(AssetIcons.inUpLogo),
        ),
      ],
    );
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        LocaleKeys.sign_up_for_free.tr,
        textAlign: TextAlign.center,
        style: textStyle.extraBold(
          size: 25,
          color: color.mainColor,
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
      hintText: LocaleKeys.username_placeholder.tr,
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
      hintText: LocaleKeys.enter_confirm_password.tr,
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
              text: '${LocaleKeys.already_have_account.tr}   ',
              style: textStyle.bold(size: 16, color: color.color736B66),
            ),
            TextSpan(
              text: LocaleKeys.sign_in.tr,
              style: textStyle.bold(
                  size: 16,
                  decoration: TextDecoration.underline,
                  color: color.colorED7E1C),
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

class GreenHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 20,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
