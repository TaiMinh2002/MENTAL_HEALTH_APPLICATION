import 'package:mental_healing/base_widget/back_button.dart';
import 'package:mental_healing/import.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackButtonWidget(
            iconColor: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Text(
              'Account Settings',
              style: TextStyle(
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
        _title('General Settings'),
        _item(prefixIcon: AssetIcons.notification, title: 'Notification'),
        _item(prefixIcon: AssetIcons.person, title: 'Personal Information'),
        _item(prefixIcon: AssetIcons.emergency, title: 'Emergency Contact'),
        _item(prefixIcon: AssetIcons.language, title: 'Language'),
        _item(prefixIcon: AssetIcons.darkMode, title: 'Dark Mode'),
        _item(prefixIcon: AssetIcons.share, title: 'Invite Friend'),
        _item(prefixIcon: AssetIcons.feedback, title: 'Submit Feedback'),
      ],
    );
  }

  Widget _securityAndPrivate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title('Security & Privacy'),
        _item(prefixIcon: AssetIcons.iconPassword, title: 'Security'),
        _item(prefixIcon: AssetIcons.help, title: 'Help Center'),
      ],
    );
  }

  Widget _dangerZone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title('Danger Zone'),
        _item(prefixIcon: AssetIcons.trash, title: 'Close Account'),
      ],
    );
  }

  Widget _logOut() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title('Logout'),
        _item(prefixIcon: AssetIcons.signOut, title: 'Log Out'),
      ],
    );
  }

  Widget _item({required String prefixIcon, required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
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
          Divider()
        ],
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
