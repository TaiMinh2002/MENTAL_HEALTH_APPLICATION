import 'package:mental_healing/base_widget/app_bar_custom.dart';
import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_widget.dart';
import 'package:mental_healing/data/model/exercise_info.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/exercise_list/exercise_list_controller.dart';

class ExerciseListPage extends BaseScreen<ExerciseListController>
    with SmartLoadListWidget {
  ExerciseListPage({super.key});

  @override
  Widget builder() {
    return Scaffold(
      backgroundColor: color.backgroundColor,
      appBar: AppBarCustom(
        elevation: 0,
        titleAppBar: LocaleKeys.expert.tr,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(top: 10, left: 20.r, right: 20.r, bottom: 20.r),
        child: Container(
          color: color.backgroundColor,
          height: 500,
          child: ListView.builder(
            itemCount: controller.listExercise.length,
            itemBuilder: (context, index) {
              return _bodyWidget(controller.listExercise[index]);
            },
          ),
        ),
      ),
    );
  }

  Widget _bodyWidget(ExerciseInfo exercise) {
    return GestureDetector(
      onTap: () {
        controller.moveToDetail(exercise.id ?? 0);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              exercise.thumbnail_url ?? '',
              height: 230,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          _infoVideo(exercise)
        ],
      ),
    );
  }

  Widget _infoVideo(ExerciseInfo exercise) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.title ?? '',
                  maxLines: 2,
                  style: textStyle.regular(
                    size: 14,
                    color: color.color030303,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    LocaleKeys.mental_health_admin.tr,
                    style:
                        textStyle.regular(size: 12, color: color.color606060),
                  ),
                )
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          SvgPicture.asset(AssetIcons.report,
              height: 25,
              width: 25,
              colorFilter: ColorFilter.mode(color.blackColor, BlendMode.srcIn))
        ],
      ),
    );
  }

  @override
  ExerciseListController? putController() => ExerciseListController();
}
