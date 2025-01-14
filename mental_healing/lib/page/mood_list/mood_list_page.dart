import 'package:mental_healing/base_widget/app_bar_custom.dart';
import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/common/widget_components/animated_list/widget_animated_list.dart';
import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_widget.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/dashboard/dashboard_controller.dart';
import 'package:mental_healing/page/mood_list/mood_list_controller.dart';

class MoodListPage extends BaseScreen<MoodListController>
    with SmartLoadListWidget {
  MoodListPage({super.key});

  @override
  Widget builder() {
    return Scaffold(
      backgroundColor: color.whiteColor,
      appBar: _buildAppBar,
      body: Stack(
        children: [
          _buildSmartList(),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: ButtonWidget(
              onClick: controller.moveToSetMood,
              textSize: 18,
              textColor: color.whiteColor,
              title: LocaleKeys.set_mood.tr,
              height: 55,
              width: double.infinity,
              bgColor: color.color64B5F6,
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget get _buildAppBar => PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarCustom(
          elevation: 0,
          titleAppBar: LocaleKeys.mood.tr,
          backgroundColor: color.backgroundColor,
          centerTitle: false,
          leadingPressed: () {
            Get.find<DashboardController>().changePageIndex(index: 0);
          },
        ),
      );

  Widget _buildSmartList() {
    return buildSmartList(
      controller,
      enablePullDown: true,
      enablePullUp: controller.hasMorePage.value,
      child: _buildList(),
    );
  }

  Widget _buildList() {
    return Obx(
      () => WidgetAnimatedList(
        itemCount: controller.dataList.length,
        isExpanded: false,
        isLoading: controller.loading.loadingCtrl.value,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          final moodEntries = controller.dataList[index];
          return Container(
            padding: EdgeInsets.all(10.r),
            margin: EdgeInsets.symmetric(vertical: 5.r, horizontal: 10.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: color.blackColor),
              color: color.whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${moodEntries.username ?? 'Unknown User'} <${moodEntries.date ?? 'Unknown Date'}>',
                  style: textStyle.bold(size: 16, color: color.blackColor),
                ),
                SizedBox(height: 5.h),
                Text(
                  moodEntries.note ?? 'No notes available',
                  style: textStyle.regular(size: 14, color: color.blackColor),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  MoodListController? putController() => MoodListController();
}
