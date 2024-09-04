import 'package:mental_healing/base_widget/back_button.dart';
import 'package:mental_healing/generated/locales.g.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/setting/setting_controller.dart';

class SettingPage extends StatelessWidget {
  final SettingController controller = Get.put(SettingController());
  SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [_headerWidget(), _bodyWidget()],
      ),
    );
  }

  Widget _headerWidget() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: const BoxDecoration(
          color: Color(0xff4F3422),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(45),
              bottomRight: Radius.circular(45))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BackButtonWidget(
            iconColor: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Text(
              LocaleKeys.account_settings.tr,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget _bodyWidget() {
    return Column(
      children: [
        _generalSetting(),
        _securityAndPrivate(),
        _dangerZone(),
        _logOut()
      ],
    );
  }

  Widget _generalSetting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(LocaleKeys.general_settings.tr),
        _item(
            prefixIcon: AssetIcons.notification,
            title: LocaleKeys.notification.tr),
        _item(
            prefixIcon: AssetIcons.person,
            title: LocaleKeys.personal_information.tr,
            onTap: controller.handlePersonInfo),
        _item(
            prefixIcon: AssetIcons.emergency,
            title: LocaleKeys.emergency_contact.tr),
        _item(prefixIcon: AssetIcons.language, title: LocaleKeys.language.tr),
        _item(prefixIcon: AssetIcons.darkMode, title: LocaleKeys.dark_mode.tr),
        _item(prefixIcon: AssetIcons.share, title: LocaleKeys.invite_friend.tr),
        _item(
            prefixIcon: AssetIcons.feedback,
            title: LocaleKeys.submit_feedback.tr),
      ],
    );
  }

  Widget _securityAndPrivate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(LocaleKeys.security_privacy.tr),
        _item(
            prefixIcon: AssetIcons.iconPassword, title: LocaleKeys.security.tr),
        _item(
            prefixIcon: AssetIcons.help,
            title: LocaleKeys.help_center.tr,
            onTap: controller.handleHelpCenter),
      ],
    );
  }

  Widget _dangerZone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(LocaleKeys.danger_zone.tr),
        _item(prefixIcon: AssetIcons.trash, title: LocaleKeys.close_account.tr),
      ],
    );
  }

  Widget _logOut() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(LocaleKeys.logout.tr),
        _item(
            prefixIcon: AssetIcons.signOut,
            title: LocaleKeys.logout.tr,
            onTap: controller.handleSignOut),
      ],
    );
  }

  Widget _item(
      {required String prefixIcon, required String title, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(prefixIcon),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset(AssetIcons.nextSetting)
              ],
            ),
            const Divider()
          ],
        ),
      ),
    );
  }

  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 15, bottom: 5),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xff4F3422)),
      ),
    );
  }
}
