import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_controller.dart';
import 'package:mental_healing/data/model/forum_params.dart';
import 'package:mental_healing/data/model/mood_info.dart';
import 'package:mental_healing/data/use_case/mood_use_case.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/dashboard/dashboard_controller.dart';
import 'package:mental_healing/page/mood_list/mood_list_controller.dart';

class SetMoodController extends BaseController
    with SmartLoadListController<Widget> {
  final MoodUseCase _useCase = MoodUseCase();
  final TextEditingController noteController = TextEditingController();

  ForumParams param = ForumParams(page: 1, limit: 20);

  RxList<MoodInfo> listForums = <MoodInfo>[].obs;

  Future<void> setMood(String userMessage) async {
    final userMessage = noteController.text.trim();
    if (userMessage.isEmpty) return;

    try {
      await _useCase.setMood(
        message: userMessage,
        onSuccess: (data) {
          Get.find<MoodListController>().onRefresh();
          Get.find<DashboardController>().changePageIndex(index: 1);
        },
        onFailure: (err) {
          error.value = err.toString() as ApiError?;
        },
      );
    } catch (err) {
      error.value = err.toString() as ApiError?;
    }
  }

  @override
  void onLoadMore() {}

  @override
  Future<void> onRefresh() async {
    refreshController.refreshCompleted();
  }
}
