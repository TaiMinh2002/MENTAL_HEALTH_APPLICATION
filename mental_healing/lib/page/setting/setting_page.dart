import 'package:flutter/material.dart';
import 'package:mental_healing/base_widget/back_button.dart';
import 'package:mental_healing/import.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_headerWidget(), _bodyWidget()],
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
    return const Column();
  }

  Widget _securityAndPrivate() {
    return const Column();
  }

  Widget _dangerZone() {
    return const Column();
  }

  Widget _logOut() {
    return _item(prefixIcon: AssetIcons.signOut, title: 'Log Out');
  }

  Widget _item({required String prefixIcon, required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
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
          const Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Divider(),
          )
        ],
      ),
    );
  }
}
