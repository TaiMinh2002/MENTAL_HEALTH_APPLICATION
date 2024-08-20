import 'package:mental_healing/import.dart';

class DashboardController extends GetxController {
  RxInt currentTabIndex = 0.obs;

  @override
  Future<void> onInit() async {
    await 0.1.seconds.delay();
    super.onInit();
  }

  Future<void> changePageIndex({required int index}) async {
    if (index != currentTabIndex.value) {
      currentTabIndex.value = index;
    }
  }
}
