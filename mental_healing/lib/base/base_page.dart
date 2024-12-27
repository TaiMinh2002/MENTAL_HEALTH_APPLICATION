import 'package:mental_healing/base/base_common_widgets.dart';
import 'package:mental_healing/base/loading_wrapper.dart';
import 'package:mental_healing/controller/controller_manager.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/exercise_list/exercise_list_controller.dart';
import 'package:mental_healing/page/home/home_controller.dart';
import 'package:mental_healing/page/message/message_controller.dart';
import 'package:mental_healing/page/mood_list/mood_list_controller.dart';
import 'package:mental_healing/page/setting/setting_controller.dart';

abstract class BaseScreen<T extends GetxController> extends StatelessWidget
    with BaseMixin, RouteAware, BaseCommonWidgets {
  BaseScreen({T? screenController, this.tag, bool isKeep = false, Key? key})
      : super(key: key) {
    if (screenController == null) {
      setController(isKeep: isKeep);
    } else {
      setController(screenController: screenController, isKeep: isKeep);
    }
  }

  late final String? tag;
  late final T controller;

  late final BuildContext context = Get.context!;

  T? putController();

  String? screenName() => '';

  String? get getTag => tag;

  void setController({T? screenController, bool isKeep = false}) {
    T? tempC;
    String? tag;
    if (screenController != null) {
      tempC = screenController;
    } else if (!Get.isRegistered<T>(tag: getTag)) {
      tempC = putController();
    } else {
      if (T != HomeController &&
          T != MoodListController &&
          T != ExerciseListController &&
          T != SettingController &&
          T != MessageController) {
        tag = '${T.toString()} ${ControllerManager().currentTagIndex}';
        ControllerManager().currentTagIndex += 1;
        ControllerManager().tags.add(tag);
      }
    }

    if (tempC != null) {
      controller = GetInstance().put<T>(tempC, permanent: isKeep, tag: getTag);
    } else {
      if (T != LoadingController) {
        controller =
            GetInstance().put<T>(putController()!, permanent: isKeep, tag: tag);
      } else {
        controller = GetInstance().find<T>(tag: getTag);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLoading = Get.find<LoadingController>().loadingCtrl.value;
      // ignore: deprecated_member_use
      return WillPopScope(
        onWillPop: isLoading
            ? () async {
                return false;
              }
            : null,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: builder(),
        ),
      );
    });
  }

  Widget builder();
}

abstract class BaseLoadingScreen<T extends BaseController>
    extends StatelessWidget with BaseMixin, RouteAware {
  BaseLoadingScreen(
      {T? screenController, this.tag, bool isKeep = false, Key? key})
      : super(key: key) {
    if (screenController == null) {
      setController(isKeep: isKeep);
    } else {
      setController(screenController: screenController, isKeep: isKeep);
    }
  }

  late final String? tag;
  late final T controller;

  late final BuildContext context = Get.context!;

  T? putController();

  String? screenName() => '';

  String? get getTag => tag;

  void setController({T? screenController, bool isKeep = false}) {
    T? tempC;
    String? tag;
    if (screenController != null) {
      tempC = screenController;
    } else if (!Get.isRegistered<T>(tag: getTag)) {
      tempC = putController();
    } else {
      if (T != HomeController &&
          T != MoodListController &&
          T != ExerciseListController &&
          T != SettingController &&
          T != MessageController) {
        ControllerManager().currentTagIndex += 1;
      }
    }

    if (tempC != null) {
      controller = GetInstance().put<T>(tempC, permanent: isKeep, tag: getTag);
    } else {
      if (T != LoadingController) {
        controller =
            GetInstance().put<T>(putController()!, permanent: isKeep, tag: tag);
      } else {
        controller = GetInstance().find<T>(tag: getTag);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color.whiteColor,
        floatingActionButton: floatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: appBar(),
        ),
        body: Stack(children: <Widget>[
          SafeArea(bottom: true, child: builder()),
          Obx(
            () => Visibility(
                visible: controller.pageLoading.value,
                child: const SafeArea(
                  child: ColoredBox(
                    color: Colors.transparent,
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.red),
                    ),
                  ),
                )),
          )
        ]));
  }

  Widget builder();
  Widget appBar() {
    return const SizedBox();
  }

  Widget? floatingActionButton() {
    return null;
  }

  @override
  void didPush() {
    _sendCurrentTabToAnalytics();
  }

  @override
  void didPopNext() {
    _sendCurrentTabToAnalytics();
  }

  void _sendCurrentTabToAnalytics() {}
}

abstract class BaseScreenStateful<SF extends StatefulWidget,
    T extends GetxController> extends State<SF> with BaseMixin {
  BaseScreenStateful({T? screenController, this.tag, bool isKeep = false}) {
    if (screenController == null) {
      setController(isKeep: isKeep);
    } else {
      setController(screenController: screenController, isKeep: isKeep);
    }
  }

  final String? tag;
  late final T controller;

  T? putController();

  void setController({T? screenController, bool isKeep = false}) {
    T? tempC;
    String? tagC;
    if (screenController != null) {
      tempC = screenController;
    } else if (!Get.isRegistered<T>(tag: tag)) {
      tempC = putController();
    } else {
      if (T != HomeController &&
          T != MoodListController &&
          T != ExerciseListController &&
          T != SettingController &&
          T != MessageController) {
        ControllerManager().currentTagIndex += 1;
      }
    }

    if (tempC != null) {
      controller = GetInstance().put<T>(tempC, permanent: isKeep, tag: tag);
    } else {
      if (T != LoadingController) {
        controller =
            GetInstance().put<T>(putController()!, permanent: isKeep, tag: tag);
      } else {
        controller = GetInstance().find<T>(tag: tagC);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return builder();
  }

  Widget builder();
}
