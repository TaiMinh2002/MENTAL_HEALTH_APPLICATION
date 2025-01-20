import 'package:mental_healing/base_widget/app_bar_custom.dart';
import 'package:mental_healing/common/widget_components/animated_list/widget_animated_list.dart';
import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_widget.dart';
import 'package:mental_healing/controller/global_data_manager.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/dashboard/dashboard_controller.dart';
import 'package:mental_healing/page/message/component/message_list_item.dart';
import 'package:mental_healing/page/message/message_controller.dart';

class MessagePage extends BaseScreen<MessageController>
    with SmartLoadListWidget {
  MessagePage({super.key});

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
          titleAppBar: LocaleKeys.messages.tr,
          centerTitle: false,
          leadingPressed: () {
            Get.find<DashboardController>().changePageIndex(index: 0);
          },
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
          return MessageListItem(
            name: GlobalDataManager().userInfo.value.role == 2
                ? controller.dataList[index].expert_name ?? ''
                : controller.dataList[index].user_name ?? '',
            avatar: GlobalDataManager().userInfo.value.role == 2
                ? controller.dataList[index].expert_avatar
                : controller.dataList[index].user_avatar,
            latestMessage: controller.dataList[index].latest_message ?? '',
            onTap: () {
              controller.moveToChat(controller.dataList[index]);
            },
            time: controller.dataList[index].lastTimeFormatted ?? '',
          );
        },
      ),
    );
  }

  @override
  MessageController? putController() => MessageController();
}
