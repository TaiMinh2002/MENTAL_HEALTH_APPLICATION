import 'package:mental_healing/base_widget/app_bar_custom.dart';
import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/mood_list/mood_list_controller.dart';

class MoodListPage extends BaseScreen<MoodListController> with BaseMixin {
  MoodListPage({super.key});

  @override
  Widget builder() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        appBar: AppBarCustom(
          elevation: 0,
          titleAppBar: LocaleKeys.mood.tr,
          backgroundColor: color.backgroundColor,
          centerTitle: false,
        ),
        body: Stack(
          children: [
            Obx(() {
              if (controller.isLoadingPage.value) {
                return Center(child: CircularProgressIndicator());
              }

              if (controller.listForums.isEmpty) {
                return Center(
                  child: Text(
                    LocaleKeys.not_written_mood.tr,
                    style: textStyle.regular(size: 16, color: color.blackColor),
                  ),
                );
              }

              return Padding(
                padding: EdgeInsets.only(bottom: 100.r),
                child: ListView.builder(
                  itemCount: controller.listForums.length,
                  itemBuilder: (context, index) {
                    final mood = controller.listForums[index];
                    return Container(
                      padding: EdgeInsets.all(10.r),
                      margin:
                          EdgeInsets.symmetric(vertical: 5.r, horizontal: 10.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: color.blackColor),
                        color: color.whiteColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${mood.username ?? 'Unknown User'} <${mood.date ?? 'Unknown Date'}>',
                            style: textStyle.bold(
                                size: 16, color: color.blackColor),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            mood.note ?? 'No notes available',
                            style: textStyle.regular(
                                size: 14, color: color.blackColor),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }),
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
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  MoodListController? putController() => MoodListController();
}
