import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/chatbot/chatbot_page.dart';
import 'package:mental_healing/page/chatbot/component/chatbot_intro.dart';
import 'package:mental_healing/page/community/component/create_forum.dart';
import 'package:mental_healing/page/community/component/forum_detail.dart';
import 'package:mental_healing/page/community/component/intro_forum.dart';
import 'package:mental_healing/page/community/forum_page.dart';
import 'package:mental_healing/page/complete_account/complete_account_page.dart';
import 'package:mental_healing/page/dashboard/dashboard_page.dart';
import 'package:mental_healing/page/dashboard_expert/dashboard_expert_page.dart';
import 'package:mental_healing/page/expert/expert_page.dart';
import 'package:mental_healing/page/intro/component/page_view_intro.dart';
import 'package:mental_healing/page/intro/intro_page.dart';
import 'package:mental_healing/page/mood/component/set_mood_item.dart';
import 'package:mental_healing/page/personal_information/personal_information_page.dart';
import 'package:mental_healing/page/sign_in/sign_in_page.dart';
import 'package:mental_healing/page/sign_up/sign_up_page.dart';
import 'package:mental_healing/page/splash/splash_page.dart';

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
  static const String routerCreateForum = '/create_forum';
  static const String routerIntroForum = '/intro_forum';
  static const String routerForumDetail = '/forum_detail';
  static const String routerSetMoodItem = '/set_mood_item';
  static const String routerChatbotIntro = '/chatbot_intro';
  static const String routerChatbotPage = '/chatbot_page';
  static const String routerExpertPage = '/expert_page';
  static const String routerDashboardExpertPage = '/dashboard_expert_page';

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
    GetPage<ForumPage>(
      name: routerForum,
      page: () => ForumPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<CreateForum>(
      name: routerCreateForum,
      page: () => CreateForum(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<IntroForum>(
      name: routerIntroForum,
      page: () => IntroForum(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<ForumDetail>(
      name: routerForumDetail,
      page: () => ForumDetail(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<SetMoodItem>(
      name: routerSetMoodItem,
      page: () => SetMoodItem(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<ChatbotIntro>(
      name: routerChatbotIntro,
      page: () => ChatbotIntro(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<ChatbotPage>(
      name: routerChatbotPage,
      page: () => ChatbotPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<ExpertPage>(
      name: routerExpertPage,
      page: () => ExpertPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<DashboardExpertPage>(
      name: routerDashboardExpertPage,
      page: () => DashboardExpertPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
  ];
}
