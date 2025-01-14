import 'package:mental_healing/base_widget/app_bar_custom.dart';
import 'package:mental_healing/common/widget_components/animated_list/widget_animated_list.dart';
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
    return buildSmartList(
      controller,
      enablePullDown: true,
      enablePullUp: controller.hasMorePage.value,
      child: _buildList(),
    );
  }

  Widget _buildList() {
    return Obx(() => WidgetAnimatedList(
        itemCount: controller.dataList.length,
        isExpanded: false,
        isLoading: controller.loading.loadingCtrl.value,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return ExpertItem(
            backgroundColor: Colors.white,
            textColor: Colors.black,
            expert: controller.dataList[index],
            handleDetail: (id) {
              controller.moveToExpertDetail(controller.dataList[index].id ?? 0);
            },
          );
        }));
  }

  @override
  ExpertListController? putController() => ExpertListController();
}
