import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/intro/component/intro_item.dart';
import 'package:mental_healing/page/intro/intro_page.dart';
import 'package:mental_healing/page/splash/splash_page.dart';

class AppRouter {
  static const String routerSplash = '/splash';
  static const String routerIntro = '/intro';
  static const String routerIntroItem = '/introItem';

  static const curve = Curves.fastOutSlowIn;
  static const transition = Transition.rightToLeftWithFade;
  static const transitionDuration = Duration(milliseconds: 320);

  // Declare Pages

  static List<GetPage<dynamic>> getPages = <GetPage<dynamic>>[
    GetPage<SplashPage>(
      name: routerSplash,
      page: () => SplashPage(),
      curve: curve,
      transition: transition,
      transitionDuration: transitionDuration,
    ),
    GetPage<IntroPage>(
      name: routerIntro,
      page: () => IntroPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<IntroItem>(
      name: routerIntroItem,
      page: () => IntroItem(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
  ];
}
