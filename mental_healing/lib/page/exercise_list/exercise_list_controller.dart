import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_controller.dart';
import 'package:mental_healing/data/model/exercise_info.dart';
import 'package:mental_healing/data/model/exercise_params.dart';
import 'package:mental_healing/data/use_case/exercise_use_case.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/import.dart';

class ExerciseListController extends BaseController
    with SmartLoadListController<Widget> {
  final ExerciseUseCase _exerciseUseCase = ExerciseUseCase();

  late int type;

  late ExerciseParams param;

  RxList<ExerciseInfo> listExercise = <ExerciseInfo>[].obs;

  @override
  void onInit() {
    type = Get.arguments;
    param = ExerciseParams(page: 1, limit: 20, type: type);
    super.onInit();
    _initData();
  }

  Future<void> _initData() async {
    isLoadingPage.value = true;
    await _getListExercise();
  }

  Future<void> _getListExercise() async {
    await _exerciseUseCase
        .getListExercises(
          params: param,
          onSuccess: (List<ExerciseInfo> data) {
            if (data.isNotEmpty) {
              listExercise.value = data;
              error.value = null;
            } else {
              error.value = ApiError(message: "No data available");
            }
          },
          onFailure: (err) {
            error.value = err;
          },
        )
        .whenComplete(() => isLoadingPage.value = false);
  }

  Future<void> moveToDetail(int exerciseId) async {
    Get.toNamed(
      AppRouter.routerExerciseDetailPage,
      arguments: exerciseId,
    );
  }

  @override
  void onLoadMore() {
    // param.page += 1;
    _getListExercise();
  }

  @override
  Future<void> onRefresh() async {
    // param.page = 1;
    await _getListExercise();
    refreshController.refreshCompleted();
  }
}
