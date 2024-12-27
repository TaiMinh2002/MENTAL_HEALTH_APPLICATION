import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/splash/splash_controller.dart';

class SplashPage extends BaseScreen<SplashController> with BaseMixin {
  SplashPage({super.key});

  @override
  Widget builder() {
    return Stack(
      children: [
        Image.asset(AssetImages.imageSplash, fit: BoxFit.fill),
        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Text(
                LocaleKeys.splashText.tr,
                textAlign: TextAlign.center,
                style: textStyle.extraBold(size: 24, color: color.whiteColor),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.r),
                child: Text(
                  LocaleKeys.splashAuthor.tr,
                  style: textStyle.extraBold(size: 14, color: color.whiteColor),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  SplashController? putController() => SplashController();
}
