import 'package:mental_healing/common/helpers/snack_bar_helper.dart';
import 'package:mental_healing/data/model/mood/mood_info.dart';
import 'package:mental_healing/data/use_case/mood_use_case.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/mood_list/mood_list_controller.dart';

class SetMoodController extends BaseController {
  final MoodUseCase _useCase = MoodUseCase();
  final TextEditingController noteController = TextEditingController();

  void setMood(String note) {
    final note = noteController.text.trim();
    showLoading();
    _useCase
        .setMood(
          note: note,
          onSuccess: (MoodInfo result) async {
            await Get.find<MoodListController>().onRefresh();
            Get.back();
          },
          onFailure: (err) {
            SnackBarHelper.showError(err.message);
          },
        )
        .whenComplete(() => hideLoading());
  }
}
