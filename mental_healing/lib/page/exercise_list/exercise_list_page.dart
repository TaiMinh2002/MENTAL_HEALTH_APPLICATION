import 'package:mental_healing/base_widget/app_bar_custom.dart';
import 'package:mental_healing/common/widget_components/animated_list/widget_animated_list.dart';
import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_widget.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/exercise_list/exercise_list_controller.dart';

class ExerciseListPage extends BaseScreen<ExerciseListController>
    with SmartLoadListWidget {
  ExerciseListPage({super.key});

  @override
  Widget builder() {
    return Scaffold(
      backgroundColor: color.whiteColor,
      appBar: _buildAppBar,
      body: _buildSmartList(),
    );
  }

  PreferredSizeWidget get _buildAppBar => PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarCustom(
          elevation: 0,
          titleAppBar: LocaleKeys.expert.tr,
          centerTitle: false,
        ),
      );

  Widget _buildSmartList() {
    return buildSmartList(controller,
        enablePullDown: true,
        enablePullUp: controller.hasMorePage.value,
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, top: 30.h, bottom: 30.h),
          child: _buildList(),
        ));
  }

  Widget _buildList() {
    return Obx(
      () => WidgetAnimatedList(
        itemCount: controller.dataList.length,
        isExpanded: false,
        isLoading: controller.loading.loadingCtrl.value,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return _bodyWidget(
            thumbnailUrl: controller.dataList[index].thumbnail_url ?? '',
            title: controller.dataList[index].title ?? '',
            onTap: () {
              controller.moveToDetail(controller.dataList[index].id ?? 0);
            },
          );
        },
      ),
    );
  }

  Widget _bodyWidget({String? thumbnailUrl, String? title, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              thumbnailUrl ?? '',
              height: 230,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          _infoVideo(title ?? '')
        ],
      ),
    );
  }

  Widget _infoVideo(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
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
