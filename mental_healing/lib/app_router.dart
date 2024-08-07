import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/intro/component/page_view_intro.dart';
import 'package:mental_healing/page/intro/intro_page.dart';
import 'package:mental_healing/page/sign_in/sign_in_page.dart';
import 'package:mental_healing/page/splash/splash_page.dart';

class AppRouter {
  static const String routerSplash = '/splash';
  static const String routerIntro = '/intro';
  static const String routerPageViewIntro = '/page_view_intro';
  static const String routerSignIn = '/sign_in';

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
    GetPage<PageViewIntro>(
      name: routerPageViewIntro,
      page: () => PageViewIntro(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<SignInPage>(
      name: routerSignIn,
      page: () => SignInPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
  ];
}
