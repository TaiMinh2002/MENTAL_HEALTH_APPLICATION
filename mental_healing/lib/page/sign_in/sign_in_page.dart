import 'package:flutter/gestures.dart';
import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/base_widget/widget_input_text.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/sign_in/sign_in_controller.dart';

class SignInPage extends StatelessWidget with BaseMixin {
  final SignInController controller = Get.put(SignInController());
  SignInPage({super.key});

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
              _formInput(),
              _signInButton(),
              _forgotPasswordWidget(),
              _signUpWidget(),
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
        LocaleKeys.sign_in_message.tr,
        textAlign: TextAlign.center,
        style: textStyle.extraBold(
          size: 25,
          color: color.mainColor,
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
            _identifierWidget(),
            _passwordWidget(),
          ],
        ),
      ),
    );
  }

  Widget _identifierWidget() {
    return WidgetInputText(
      hintText: LocaleKeys.email_or_phone_number.tr,
      controller: controller.identifierController,
      validator: controller.checkEmailValidator,
      textCapitalization: TextCapitalization.none,
      title: 'Email or Phone number',
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
            style: textStyle.bold(size: 14, color: color.colorED7E1C),
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
              text: '${LocaleKeys.no_account.tr}   ',
              style: textStyle.bold(size: 16, color: color.color736B66),
            ),
            TextSpan(
              text: LocaleKeys.sign_up.tr,
              style:
                  textStyle.boldUnderline(size: 16, color: color.colorED7E1C),
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
