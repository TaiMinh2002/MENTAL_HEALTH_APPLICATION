import 'package:mental_healing/common/widget_components/input_field/widget_input_text.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/sign_in/sign_in_controller.dart';

class SignInPage extends BaseScreen<SignInController> {
  SignInPage({super.key});

  @override
  Widget builder() {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              color: const Color(0xff9BB168),
              child: const Center(
                child: Icon(
                  Icons.flare,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
          ),
          Column(
            children: [
              textWidget(title: 'Sign In'),
              textWidget(title: 'Mental Health'),
              _emailInput()
            ],
          ),
        ],
      ),
    );
  }

  Widget textWidget({required String title}) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _emailInput() {
    return WidgetInputText(
      marginTop: 40.h,
      hintText: 'Email',
      iconLeading: AssetIcons.iconEmail,
      controller: controller.emailController,
      validator: controller.checkEmailValidator,
    );
  }

  @override
  SignInController? putController() => SignInController();
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      size.width / 2,
      size.height - 100,
      size.width,
      size.height,
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
