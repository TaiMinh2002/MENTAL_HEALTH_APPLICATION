import 'package:mental_healing/common/app_bar_custom.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/exercise_start/exercise_start_controller.dart';

class ExerciseStart extends BaseScreen<ExerciseStartController> with BaseMixin {
  ExerciseStart({super.key});

  @override
  Widget builder() {
    return Scaffold(
      backgroundColor: color.backgroundColor,
      appBar: AppBarCustom(
        elevation: 0,
        titleAppBar: LocaleKeys.choose_type.tr,
        centerTitle: false,
        backgroundColor: color.backgroundColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _item(AssetImages.meditation, LocaleKeys.meditation.tr,
              LocaleKeys.meditation_benefits.tr, 1),
          _item(AssetImages.breatheDeeply, LocaleKeys.breathe_deeply.tr,
              LocaleKeys.breathe_deeply_benefits.tr, 2),
          _item(AssetImages.yoga, LocaleKeys.yoga.tr,
              LocaleKeys.yoga_benefits.tr, 3),
        ],
      ),
    );
  }

  Widget _item(String image, String title, String description, int type) {
    return GestureDetector(
      onTap: () {
        controller.moveToListExercise(type);
      },
      child: Container(
        padding: EdgeInsets.all(10.r),
        margin: EdgeInsets.all(10.r),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
                child: Image.asset(
                  image,
                  height: 120,
                  width: 120,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.r),
                    child: Text(
                      title,
                      style: textStyle.bold(size: 16, color: color.blackColor),
                    ),
                  ),
                  Text(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle.bold(size: 16, color: color.blackColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ExerciseStartController? putController() => ExerciseStartController();
}
