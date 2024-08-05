import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/onboarding/onboarding_page.dart';
import 'package:mental_healing/page/sign_in/sign_in_page.dart';

class AppRouter {
  static const String routerBoarding = '/boarding';
  static const String routerSignIn = '/sign_in';

  static const curve = Curves.fastOutSlowIn;
  static const transition = Transition.rightToLeftWithFade;
  static const transitionDuration = Duration(milliseconds: 320);

  // Declare Pages

  static List<GetPage<dynamic>> getPages = <GetPage<dynamic>>[
    GetPage<SignInPage>(
      name: routerSignIn,
      page: () => SignInPage(),
      curve: curve,
      transition: transition,
      transitionDuration: transitionDuration,
    ),
    GetPage<OnboardingPage>(
      name: routerBoarding,
      page: () => OnboardingPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
  ];
}
