import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/assessment/assessment_page.dart';
import 'package:mental_healing/page/boarding/boarding_page.dart';
import 'package:mental_healing/page/chat_expert/chat_expert_page.dart';
import 'package:mental_healing/page/chatbot/chatbot_page.dart';
import 'package:mental_healing/page/chatbot/component/chatbot_intro.dart';
import 'package:mental_healing/page/create_post/create_post_page.dart';
import 'package:mental_healing/page/dashboard/dashboard_page.dart';
import 'package:mental_healing/page/dashboard_expert/dashboard_expert_page.dart';
import 'package:mental_healing/page/exercise_detail/exercise_detail_page.dart';
import 'package:mental_healing/page/exercise_list/exercise_list_page.dart';
import 'package:mental_healing/page/expert/expert_page.dart';
import 'package:mental_healing/page/expert_detail/expert_detail_page.dart';
import 'package:mental_healing/page/expert_list/expert_list_page.dart';
import 'package:mental_healing/page/forum_create/component/intro_forum_create.dart';
import 'package:mental_healing/page/forum_create/forum_create_page.dart';
import 'package:mental_healing/page/forum_detail/forum_detail_page.dart';
import 'package:mental_healing/page/forum_list/forum_list_page.dart';
import 'package:mental_healing/page/mood_list/mood_list_page.dart';
import 'package:mental_healing/page/set_mood/set_mood_page.dart';
import 'package:mental_healing/page/sign_in/sign_in_page.dart';
import 'package:mental_healing/page/sign_up/sign_up_page.dart';
import 'package:mental_healing/page/splash/splash_page.dart';
import 'package:mental_healing/page/welcome/welcome_page.dart';

class AppRouter {
  static const String routerSplash = '/splash';
  static const String routerSignIn = '/sign_in';
  static const String routerBoarding = '/boarding';
  static const String routerWelcome = '/welcome';
  static const String routerSignUp = '/sign_up';
  static const String routerDashboard = '/dashboard';
  static const String routerIntroChatbot = '/intro_chatbot';
  static const String routerChatbotPage = '/chatbot_page';
  static const String routerAssessment = '/assessment';
  static const String routerExpertPage = '/expert_page';
  static const String routerExpertListPage = '/expert_list_page';
  static const String routerExpertDetailPage = '/expert_detail_page';
  static const String routerForumListPage = '/forum_list_page';
  static const String routerForumCreatePage = '/forum_create_page';
  static const String routerIntroForumCreate = '/intro_forum_create';
  static const String routerForumDetailPage = '/forum_detail_page';
  static const String routerMoodListPage = '/mood_list_page';
  static const String routerExerciseListPage = '/exercise_list_page';
  static const String routerExerciseDetailPage = '/exercise_detail_page';
  static const String routerChatExpert = '/chat_expert';
  static const String routerSetMoodPage = '/set_mood_page';
  static const String routerCreatePost = '/create_post';
  static const String routerDashboardExpert = '/dashboard_expert';

  static const curve = Curves.fastOutSlowIn;
  static var transition =
      GetPlatform.isAndroid ? Transition.native : Transition.cupertino;
  static const transitionDuration = Duration(milliseconds: 300);

  // Declare Pages

  static List<GetPage<dynamic>> getPages = <GetPage<dynamic>>[
    GetPage<SplashPage>(
      name: routerSplash,
      page: () => SplashPage(),
      curve: curve,
      transition: transition,
      transitionDuration: transitionDuration,
    ),
    GetPage<SignInPage>(
      name: routerSignIn,
      page: () => SignInPage(),
      curve: curve,
      transition: transition,
      transitionDuration: transitionDuration,
    ),
    GetPage<BoardingPage>(
      name: routerBoarding,
      page: () => BoardingPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<WelcomePage>(
      name: routerWelcome,
      page: () => WelcomePage(),
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
    GetPage<DashboardPage>(
      name: routerDashboard,
      page: () => DashboardPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<ChatbotIntro>(
      name: routerIntroChatbot,
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
    GetPage<AssessmentPage>(
      name: routerAssessment,
      page: () => AssessmentPage(),
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
    GetPage<ExpertListPage>(
      name: routerExpertListPage,
      page: () => ExpertListPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<ExpertDetailPage>(
      name: routerExpertDetailPage,
      page: () => ExpertDetailPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<ForumListPage>(
      name: routerForumListPage,
      page: () => ForumListPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<IntroForumCreate>(
      name: routerIntroForumCreate,
      page: () => IntroForumCreate(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<ForumCreatePage>(
      name: routerForumCreatePage,
      page: () => ForumCreatePage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<ForumDetailPage>(
      name: routerForumDetailPage,
      page: () => ForumDetailPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<MoodListPage>(
      name: routerMoodListPage,
      page: () => MoodListPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<ExerciseListPage>(
      name: routerExerciseListPage,
      page: () => ExerciseListPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<ExerciseDetailPage>(
      name: routerExerciseDetailPage,
      page: () => ExerciseDetailPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<ChatExpertPage>(
      name: routerChatExpert,
      page: () => ChatExpertPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<SetMoodPage>(
      name: routerSetMoodPage,
      page: () => SetMoodPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<CreatePostPage>(
      name: routerCreatePost,
      page: () => CreatePostPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
    GetPage<DashboardExpertPage>(
      name: routerDashboardExpert,
      page: () => DashboardExpertPage(),
      curve: curve,
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),
  ];
}
