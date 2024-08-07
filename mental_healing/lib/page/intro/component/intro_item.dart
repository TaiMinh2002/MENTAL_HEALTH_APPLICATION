import 'package:flutter/material.dart';
import 'package:mental_healing/page/intro/component/step_item.dart';
import 'package:mental_healing/r.dart';

class IntroItem extends StatelessWidget {
  const IntroItem({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double imageHeight = screenHeight / 1.6;
    final double containerHeight = screenHeight - imageHeight + 75;
    return Scaffold(
      backgroundColor: const Color(0xffE5EAD7),
      body: Stack(
        children: [
          Image.asset(
            AssetImages.intro1,
            height: imageHeight,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const StepItem(title: 'Step 1'),
                _bottomWidget(containerHeight)
              ],
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
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Personalize Your Mental Health State With AI',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Icon(Icons.arrow_forward, size: 40, color: Colors.brown),
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
