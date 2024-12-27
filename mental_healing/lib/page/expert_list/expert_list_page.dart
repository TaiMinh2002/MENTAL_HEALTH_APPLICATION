import 'package:mental_healing/base_widget/app_bar_custom.dart';
import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_widget.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/expert_list/component/expert_item.dart';
import 'package:mental_healing/page/expert_list/expert_list_controller.dart';

class ExpertListPage extends BaseScreen<ExpertListController>
    with SmartLoadListWidget {
  ExpertListPage({super.key});

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
            itemCount: controller.listExpertsWidget.length,
            itemBuilder: (context, index) {
              return ExpertItem(
                backgroundColor: Colors.white,
                textColor: Colors.black,
                expert: controller.listExpertsWidget[index],
                handleDetail: (id) {
                  controller.moveToExpertDetail(
                      controller.listExpertsWidget[index].id ?? 0);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  ExpertListController? putController() => ExpertListController();
}
