import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/dashboard/dashboard_controller.dart';
import 'package:mental_healing/page/expert/component/expert_item.dart';
import 'package:mental_healing/page/home/home_page.dart';
import 'package:mental_healing/page/mood/mood_page.dart';
import 'package:mental_healing/page/setting/setting_page.dart';

class DashboardPage extends StatelessWidget with BaseMixin {
  final DashboardController controller = Get.put(DashboardController());
  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => IndexedStack(
                  index: controller.currentTabIndex.value,
                  children: [
                    HomePage(),
                    MoodPage(),
                    Container(),
                    ExpertItem(),
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
                title: LocaleKeys.mood.tr,
                index: 1,
                icon: AssetIcons.dashboard2),
            _buildBottomNvBarItem(
                title: LocaleKeys.exercise.tr,
                index: 2,
                icon: AssetIcons.dashboard3),
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
}
