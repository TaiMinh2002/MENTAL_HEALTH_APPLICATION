import 'package:chewie/chewie.dart';
import 'package:mental_healing/base_widget/app_bar_custom.dart';
import 'package:mental_healing/common/widget_components/image/widget_network_image.dart';
import 'package:mental_healing/common/widget_components/loading/custom_loading.dart';
import 'package:mental_healing/common/widget_components/no_data/error_message.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/exercise_detail/exercise_detail_controller.dart';

class ExerciseDetailPage extends BaseScreen<ExerciseDetailController>
    with BaseMixin {
  ExerciseDetailPage({super.key});

  @override
  Widget builder() {
    return Obx(() {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        child: controller.isLoading.value
            ? Scaffold(
                key: const ValueKey('loading'),
                backgroundColor: color.backgroundColor,
                appBar: AppBarCustom(
                  elevation: 0,
                  titleAppBar: LocaleKeys.exerciseDetail.tr,
                  centerTitle: false,
                ),
                body: CustomLoading(
                  color: appThemes.mainColor,
                  type: CustomLoadingType.start,
                ),
              )
            : (controller.apiErr.value != null
                ? Scaffold(
                    key: const ValueKey('error'),
                    backgroundColor: color.backgroundColor,
                    appBar: AppBarCustom(
                      elevation: 0,
                      titleAppBar: LocaleKeys.exerciseDetail.tr,
                      centerTitle: false,
                    ),
                    body: ErrorMessage(err: controller.apiErr.value),
                  )
                : _buildPage()),
      );
    });
  }

  Widget _buildPage() {
    return Scaffold(
      backgroundColor: color.backgroundColor,
      appBar: AppBarCustom(
        elevation: 0,
        titleAppBar: LocaleKeys.exerciseDetail.tr,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => AspectRatio(
                aspectRatio: 16 / 9,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  switchInCurve: Curves.easeIn,
                  switchOutCurve: Curves.easeOut,
                  child: !controller.videoLoading.value &&
                          controller.chewieController!.videoPlayerController
                              .value.isInitialized
                      ? Chewie(controller: controller.chewieController!)
                      : Stack(
                          children: [
                            WidgetNetworkImage(
                              fit: BoxFit.cover,
                              width: double.infinity,
                              imageUrl: controller
                                  .exerciseDetail.value?.thumbnail_url,
                            ),
                            const Center(
                                child: CircularProgressIndicator(
                              color: Colors.white,
                            ))
                          ],
                        ),
                ),
              ),
            ),
            _infoSection()
          ],
        ),
      ),
    );
  }

  Widget _infoSection() {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.exerciseDetail.value?.title ?? "No Title",
              style: textStyle.bold(size: 22, color: color.blackColor),
            ),
            const SizedBox(height: 10),
            Text(
              controller.exerciseDetail.value?.description ?? "No Description",
              style: textStyle.medium(size: 16, color: color.blackColor),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ExerciseDetailController? putController() => ExerciseDetailController();
}
