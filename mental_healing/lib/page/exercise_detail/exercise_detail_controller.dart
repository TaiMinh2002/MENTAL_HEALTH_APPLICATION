import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/data/model/exercise/exercise_info.dart';
import 'package:mental_healing/data/use_case/exercise_use_case.dart';
import 'package:mental_healing/import.dart';
import 'package:video_player/video_player.dart';

class ExerciseDetailController extends BaseController {
  final ExerciseUseCase _exerciseUseCase = ExerciseUseCase();
  late int id;

  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  RxBool isLoading = true.obs;
  Rx<ApiError?> apiErr = RxNullable<ApiError?>().setNull();
  Rx<ExerciseInfo?> exerciseDetail = Rxn<ExerciseInfo>();
  RxBool videoLoading = true.obs;

  @override
  void onInit() {
    id = Get.arguments;
    _initData();
    super.onInit();
  }

  void _initData() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _getDetailData();
    });
  }

  Future<void> _getDetailData() async {
    isLoading.value = true;
    await _exerciseUseCase.getExerciseDetail(
      id: id,
      onSuccess: (data) {
        apiErr.value = null;
        exerciseDetail.value = data;
        _initVideoController(data.media_url);
      },
      onFailure: (err) {
        apiErr.value = err;
      },
    ).whenComplete(() {
      isLoading.value = false;
    });
  }

  Future<void> _initVideoController(String? url) async {
    if (url != null && url.isNotEmpty) {
      videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
      await videoPlayerController!.initialize();
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        autoPlay: false,
        looping: false,
        aspectRatio: 16 / 9,
        allowFullScreen: true,
        optionsTranslation: OptionsTranslation(
          cancelButtonText: "Cancel",
          playbackSpeedButtonText: "Speed",
        ),
        deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
        deviceOrientationsOnEnterFullScreen: [DeviceOrientation.landscapeLeft],
        materialProgressColors: ChewieProgressColors(
          playedColor: Colors.blue,
          handleColor: Colors.blueAccent,
          backgroundColor: Colors.grey,
          bufferedColor: Colors.lightBlue,
        ),
      );
    }
    Future.delayed(const Duration(milliseconds: 500),
              () => videoLoading.value = false);
  }

  void playOrPauseVideo() {
    if (videoPlayerController?.value.isPlaying == true) {
      videoPlayerController?.pause();
    } else {
      videoPlayerController?.play();
    }
    update();
  }

  @override
  void onClose() {
    videoPlayerController?.dispose();
    chewieController?.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.onClose();
  }
}
