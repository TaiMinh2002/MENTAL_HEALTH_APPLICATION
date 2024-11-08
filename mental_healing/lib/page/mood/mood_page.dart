import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/base_widget/header_app_widget.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/dashboard/dashboard_controller.dart';
import 'package:mental_healing/page/mood/component/mood_chart.dart';

class MoodPage extends StatelessWidget with BaseMixin {
  const MoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: BackgroundClipper(),
                  child: Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: color.colorD5C2B9,
                    ),
                    child: Column(
                      children: [
                        HeaderAppWidget(
                          onTapBack: () {
                            Get.find<DashboardController>()
                                .changePageIndex(index: 0);
                          },
                          title: LocaleKeys.mood.tr,
                          titleSize: 20,
                        ),
                        Text(
                          LocaleKeys.your_mood_is.tr,
                          style: textStyle.semiBold(
                              size: 20, color: color.mainColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: SvgPicture.asset(
                            AssetIcons.neutralIcon,
                            height: 60,
                            width: 60,
                          ),
                        ),
                        Text(
                          LocaleKeys.neutral.tr,
                          style: textStyle.extraBold(
                              size: 72, color: color.mainColor),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRouter.routerSetMoodItem);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: color.mainColor),
                        child: Center(
                          child: SvgPicture.asset(
                            AssetIcons.setMoodIcon,
                            colorFilter: ColorFilter.mode(
                                color.whiteColor, BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
            const Expanded(child: MoodChart())
          ],
        ),
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 70);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 70);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
