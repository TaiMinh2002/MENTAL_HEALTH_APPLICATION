import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/dashboard/dashboard_controller.dart';
import 'package:mental_healing/page/setting/setting_page.dart';

class DashboardPage extends StatelessWidget {
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
                    Container(),
                    Container(),
                    Container(),
                    Container(),
                    SettingPage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xffF7F4F2),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (value) => controller.changePageIndex(index: value),
          currentIndex: controller.currentTabIndex.value,
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xff4F3422),
          selectedLabelStyle: TextStyle(fontSize: 0),
          unselectedLabelStyle: TextStyle(fontSize: 0),
          unselectedItemColor: Color(0xffCCCCCC),
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            _buildBottomNvBarItem(
                title: 'Home', index: 0, icon: AssetIcons.dashboard1),
            _buildBottomNvBarItem(
                title: 'Mood', index: 1, icon: AssetIcons.dashboard2),
            _buildBottomNvBarItem(
                title: 'Exercise', index: 2, icon: AssetIcons.dashboard3),
            _buildBottomNvBarItem(
                title: 'Message', index: 3, icon: AssetIcons.dashboard4),
            _buildBottomNvBarItem(
                title: 'Setting', index: 4, icon: AssetIcons.dashboard6),
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
                ? Color(0xff4F3422)
                : Color(0xffCCCCCC)),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 10,
              color: controller.currentTabIndex.value == index
                  ? Color(0xff4F3422)
                  : Color(0xffCCCCCC),
            ),
          ),
        ],
      ),
      label: '',
    );
  }
}
