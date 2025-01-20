import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/dashboard_expert/dashboard_expert_controller.dart';
import 'package:mental_healing/page/message/message_page.dart';
import 'package:mental_healing/page/setting/setting_page.dart';

class DashboardExpertPage extends BaseScreen<DashboardExpertController>
    with BaseMixin {
  DashboardExpertPage({super.key});

  @override
  Widget builder() {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => IndexedStack(
                  index: controller.currentTabIndex.value,
                  children: [
                    Container(),
                    MessagePage(),
                    SettingPage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: color.backgroundColor,
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (value) => controller.changePageIndex(index: value),
          currentIndex: controller.currentTabIndex.value,
          backgroundColor: Colors.white,
          selectedItemColor: color.mainColor,
          selectedLabelStyle: const TextStyle(fontSize: 0),
          unselectedLabelStyle: const TextStyle(fontSize: 0),
          unselectedItemColor: color.colorCCCCCC,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            _buildBottomNvBarItem(
                title: LocaleKeys.home.tr,
                index: 0,
                icon: AssetIcons.dashboard1),
            _buildBottomNvBarItem(
                title: LocaleKeys.message.tr,
                index: 3,
                icon: AssetIcons.dashboard4),
            _buildBottomNvBarItem(
                title: LocaleKeys.setting.tr,
                index: 4,
                icon: AssetIcons.dashboard6),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNvBarItem({
    required String title,
    required int index,
    required String icon,
  }) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          SvgPicture.asset(
            icon,
            width: 25,
            height: 25,
            color: (controller.currentTabIndex.value == index
                ? color.mainColor
                : color.colorCCCCCC),
          ),
          Text(
            title,
            style: textStyle.medium(
              size: 10,
              color: controller.currentTabIndex.value == index
                  ? color.mainColor
                  : color.colorCCCCCC,
            ),
          ),
        ],
      ),
      label: '',
    );
  }

  @override
  DashboardExpertController? putController() => DashboardExpertController();
}
