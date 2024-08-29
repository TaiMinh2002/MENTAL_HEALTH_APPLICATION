import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/intro/component/next_button.dart';
import 'package:mental_healing/page/intro/component/step_item.dart';

class IntroItem extends StatelessWidget with BaseMixin {
  const IntroItem(
      {super.key,
      required this.image,
      required this.step,
      required this.text,
      required this.indicator});
  final String image;
  final String text;
  final String step;
  final String indicator;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double imageHeight = screenHeight / 1.5;
    final double containerHeight = screenHeight - imageHeight + 75;
    return Scaffold(
      backgroundColor: color.backgroundColor,
      body: Stack(
        children: [
          Image.asset(
            image,
            height: imageHeight,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [StepItem(title: step), _bottomWidget(containerHeight)],
            ),
          )
        ],
      ),
    );
  }

  Widget _bottomWidget(double height) {
    return ClipPath(
      clipper: CustomClipPath(),
      child: Container(
        color: Colors.white,
        height: height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 90.0, bottom: 30),
              child: Image.asset(indicator),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                text,
                style: textStyle.bold(size: 20),
                textAlign: TextAlign.center,
              ),
            ),
            NextButton(),
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 50);
    var firstControlPoint = Offset(size.width / 2, 0);
    var firstEndPoint = Offset(size.width, 50);

    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
