import 'package:flutter_animate/flutter_animate.dart';
import 'package:mental_healing/common/widget_components/button/widget_button.dart';
import 'package:mental_healing/common/widget_components/page_indicator.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/boarding/boarding_controller.dart';

class BoardingItem extends BaseWidget<BoardingController> with BaseMixin {
  BoardingItem(
      {super.key,
      required this.index,
      required this.backgroundColor,
      required this.stepContainerColor,
      required this.stepTextColor});
  final int index;
  final Color backgroundColor;
  final Color stepTextColor;
  final Color stepContainerColor;

  @override
  Widget builder() {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double imageHeight = screenHeight / 1.5;
    final double containerHeight = screenHeight - imageHeight + 75;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Obx(
            () => Image.asset(
              controller.currentHeaderImage.value,
              height: imageHeight,
              width: double.infinity,
              fit: BoxFit.cover,
            )
                .animate(key: ValueKey(controller.currentPage.value))
                .fade(duration: 300.ms)
                .scale(delay: 50.ms),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Padding(
                    padding: EdgeInsets.only(top: 30.r),
                    child: PageIndicator(
                      count: 4,
                      indicatorWidth: 15,
                      indicatorHeight: 15,
                      currentIndex: controller.currentPage.value,
                      activeColor: color.mainColor,
                      inActiveColor: color.whiteColor,
                      onPressed: controller.moveToIndex,
                    ),
                  ),
                ),
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
        color: color.whiteColor,
        height: height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 60.h),
                child: Obx(
                  () => Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.r, horizontal: 12.h),
                    decoration: BoxDecoration(
                        color: stepContainerColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      controller.currentStep.value.tr,
                      style:
                          textStyle.extraBold(size: 12, color: stepTextColor),
                      textAlign: TextAlign.center,
                    ),
                  )
                      .animate(key: ValueKey(controller.currentPage.value))
                      .fadeIn(duration: 600.ms, delay: 200.ms)
                      .shimmer(
                          blendMode: BlendMode.srcOver, color: Colors.white12)
                      .move(
                          begin: const Offset(100, 0),
                          curve: Curves.easeOutQuad),
                ),
              ),
            ),
            Obx(
              () => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25),
                child: Text(
                  controller.currentTitle.value.tr,
                  style: textStyle.extraBold(size: 30, color: color.mainColor),
                  textAlign: TextAlign.center,
                )
                    .animate(key: ValueKey(controller.currentPage.value))
                    .fadeIn(duration: 350.ms, delay: 100.ms)
                    .shimmer(
                        blendMode: BlendMode.srcOver, color: Colors.white12)
                    .move(
                        begin: const Offset(-125, 0),
                        curve: Curves.easeOutQuad,
                        end: const Offset(0, 0)),
              ),
            ),
            WidgetButton(
              title: LocaleKeys.next.tr,
              onClick: controller.handleNextPage,
              height: 50,
              width: 200,
              margin: EdgeInsets.only(bottom: 16.h),
            ),
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
