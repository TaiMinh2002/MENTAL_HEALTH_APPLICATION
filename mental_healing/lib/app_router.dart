import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/community/forum_page.dart';
import 'package:mental_healing/page/complete_account/complete_account_page.dart';
import 'package:mental_healing/page/dashboard/dashboardpage.dart';
import 'package:mental_healing/page/intro/component/page_view_intro.dart';
import 'package:mental_healing/page/intro/intro_page.dart';
import 'package:mental_healing/page/personal_information/personal_information_page.dart';
import 'package:mental_healing/page/sign_in/sign_in_page.dart';
import 'package:mental_healing/page/sign_up/sign_up_page.dart';
import 'package:mental_healing/page/splash/splash_page.dart';
import 'package:mental_healing/page/webview/webview_page.dart';

class AppRouter {
  static const String routerSplash = '/splash';
  static const String routerIntro = '/intro';
  static const String routerPageViewIntro = '/page_view_intro';
  static const String routerSignIn = '/sign_in';
  static const String routerSignUp = '/sign_up';
  static const String routerCompleteAccountPage = '/complete_account_page';
  static const String routerDashboard = '/dashboard';
  static const String routerPersonInfo = '/person_info';
  static const String routerWebview = '/webview';
  static const String routerForum = '/forum';

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
    GetPage<SignUpPage>(
      name: routerSignUp,
      page: () => SignUpPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<CompleteAccountPage>(
      name: routerCompleteAccountPage,
      page: () => CompleteAccountPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<DashboardPage>(
      name: routerDashboard,
      page: () => DashboardPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<PersonalInformationPage>(
      name: routerPersonInfo,
      page: () => PersonalInformationPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<WebviewPage>(
      name: routerWebview,
      page: () => WebviewPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<ForumPage>(
      name: routerForum,
      page: () => ForumPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
  ];
}
