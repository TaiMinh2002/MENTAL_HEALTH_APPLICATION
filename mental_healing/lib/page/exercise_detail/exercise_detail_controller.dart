import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_controller.dart';
import 'package:mental_healing/data/model/exercise/exercise_info.dart';
import 'package:mental_healing/data/use_case/exercise_use_case.dart';
import 'package:mental_healing/import.dart';
import 'package:video_player/video_player.dart';

class ExerciseDetailController extends BaseController
    with SmartLoadListController<ExerciseInfo> {
  final ExerciseUseCase _exerciseUseCase = ExerciseUseCase();
  late int id;

  Rxn<VideoPlayerController> videoPlayerController =
      Rxn<VideoPlayerController>();

  @override
  void onInit() {
    id = Get.arguments;
    super.onInit();
    _initData();
  }

  Future<void> _initData() async {
    isLoadingPage.value = true;
    await _getDetailData();
    _initializeVideoPlayer(); // Khởi tạo video player sau khi dữ liệu đã được tải
  }

  Future<void> _getDetailData() async {
    await _exerciseUseCase
        .getExerciseDetail(
            id: id,
            onSuccess: (data) {
              error.value = null;
              dataList.value = [data];
              dataList.refresh();
            },
            onFailure: (err) {
              error.value = err;
            })
        .whenComplete(() => isLoadingPage.value = false);
  }

  void _initializeVideoPlayer() {
    final url = dataList.first.media_url ?? '';
    if (url.isNotEmpty) {
      videoPlayerController.value = VideoPlayerController.network(url)
        ..initialize().then((_) {
          videoPlayerController.refresh();
          update(); // Cập nhật trạng thái UI
        });
    }
  }

  void playOrPauseVideo() {
    if (videoPlayerController.value?.value.isPlaying == true) {
      videoPlayerController.value?.pause();
    } else {
      videoPlayerController.value?.play();
    }
    update(); // Đảm bảo UI được cập nhật
  }

  @override
  void onClose() {
    videoPlayerController.value?.dispose();
    super.onClose();
  }

  @override
  void onLoadMore() {
    refreshController.loadComplete();
  }

  @override
  Future<void> onRefresh() async {
    await _getDetailData();
    refreshController.refreshCompleted();
  }
}
