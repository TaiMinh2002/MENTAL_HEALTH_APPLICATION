import 'package:mental_healing/base_widget/header_app_widget.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/personal_information/component/edit_info.dart';

class PersonalInformationPage extends StatelessWidget {
  const PersonalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF7F4F2),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: SubtleCurveClipper(),
                    child: Container(
                      color: const Color(0xff9BB168),
                      height: MediaQuery.of(context).size.height / 3,
                    ),
                  ),
                  const Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: HeaderAppWidget(
                      title: 'Personal Information',
                      titleColor: Colors.white,
                      iconColor: Colors.white,
                      titleSize: 16,
                    ),
                  ),
                  Positioned(
                    top: (MediaQuery.of(context).size.height / 3.6) - 79,
                    left: MediaQuery.of(context).size.width / 2 - 50,
                    child: _avatarWidget(),
                  ),
                ],
              ),
              EditInfo()
            ],
          ),
        ),
      ),
    );
  }
}

Widget _avatarWidget() {
  return Stack(
    alignment: Alignment.bottomRight,
    children: [
      CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        radius: 60,
        backgroundImage: AssetImage(AssetImages.noPerson),
      ),
      SvgPicture.asset(AssetIcons.edit)
    ],
  );
}

class SubtleCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 70);
    var controlPoint = Offset(size.width / 2, size.height);
    var endPoint = Offset(size.width, size.height - 70);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
