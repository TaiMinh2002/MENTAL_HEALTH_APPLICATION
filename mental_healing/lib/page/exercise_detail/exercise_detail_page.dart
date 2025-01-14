import 'package:mental_healing/common/app_bar_custom.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/exercise_detail/exercise_detail_controller.dart';
import 'package:video_player/video_player.dart';

class ExerciseDetailPage extends BaseScreen<ExerciseDetailController>
    with BaseMixin {
  ExerciseDetailPage({super.key});

  @override
  Widget builder() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        appBar: AppBarCustom(
          elevation: 0,
          titleAppBar: LocaleKeys.expert.tr,
          centerTitle: false,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _videoPlayerWidget(),
            Expanded(child: _infoSection()),
          ],
        ),
      ),
    );
  }

  Widget _videoPlayerWidget() {
    return Container(
      height: 250,
      width: double.infinity,
      color: Colors.black,
      child: Obx(() {
        final videoController = controller.videoPlayerController.value;
        if (videoController != null && videoController.value.isInitialized) {
          return GestureDetector(
            onTap: () => controller.playOrPauseVideo(),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: videoController.value.aspectRatio,
                  child: VideoPlayer(videoController),
                ),
                if (!videoController.value.isPlaying &&
                    !videoController.value.isBuffering)
                  const Icon(
                    Icons.play_circle_fill,
                    color: Colors.white,
                    size: 50,
                  ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }

  Widget _infoSection() {
    return Obx(() => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.dataList.first.title ?? "No Title",
                style: textStyle.bold(size: 22, color: color.blackColor),
              ),
              const SizedBox(height: 10),
              Text(
                controller.dataList.first.description ?? "No Description",
                style: textStyle.medium(size: 16, color: color.blackColor),
              ),
            ],
          ),
        ));
  }

  @override
  ExerciseDetailController? putController() => ExerciseDetailController();
}
