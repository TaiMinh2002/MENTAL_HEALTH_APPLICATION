import 'package:mental_healing/base/loading_wrapper.dart';
import 'package:mental_healing/controller/global_data_manager.dart';
import 'package:mental_healing/import.dart';

Future<void> setupLocator() async {
  Get.put<AppThemeBase>(AppThemeBase());

  Get.put<LoadingController>(LoadingController());

  Get.put<GlobalDataManager>(GlobalDataManager());
}
