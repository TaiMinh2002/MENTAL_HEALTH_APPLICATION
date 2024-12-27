import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_controller.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/import.dart';

class ExerciseStartController extends BaseController
    with SmartLoadListController<Widget> {
  Future<void> moveToListExercise(int type) async {
    Get.toNamed(AppRouter.routerExerciseListPage, arguments: type);
  }

  @override
  void onLoadMore() {
    // TODO: implement onLoadMore
  }

  @override
  void onRefresh() {
    // TODO: implement onRefresh
  }
}
