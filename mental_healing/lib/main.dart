import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mental_healing/base/loading_wrapper.dart';
import 'package:mental_healing/base/locator.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/service/localization/localization_service.dart';

void main() async {
  await GetStorage.init();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget with BaseMixin {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      translations: LocalizationService(),
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      color: color.whiteColor,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      navigatorObservers: [CustomRouteObserver()],
      supportedLocales: LocalizationService.locales,
      debugShowCheckedModeBanner: false,
      title: 'Mental',
      theme: Get.find<AppThemeBase>().themeData,
      builder: (BuildContext context, Widget? child) {
        return ScreenUtilInit(
          designSize: const Size(430, 932),
          minTextAdapt: true,
          splitScreenMode: true,
          child: MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1)),
            child: LoadingWrapper(child: child),
          ),
        );
      },
      initialRoute: AppRouter.routerSplash,
      getPages: AppRouter.getPages,
      defaultTransition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 280),
    );
  }
}

class CustomRouteObserver extends NavigatorObserver {
  final List<String> screenHistory = [];

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (route.settings.name != null) {
      screenHistory.add(route.settings.name!);
      print(screenHistory);
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (route.settings.name != null) {
      screenHistory.remove(route.settings.name);
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (oldRoute?.settings.name != null) {
      screenHistory.remove(oldRoute?.settings.name);
    }
    if (newRoute?.settings.name != null) {
      screenHistory.add(newRoute!.settings.name!);
    }
  }
}
