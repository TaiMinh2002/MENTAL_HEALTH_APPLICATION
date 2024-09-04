import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/base_widget/app_bar_custom.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/community/component/community_item.dart';

class CommunityPage extends StatelessWidget with BaseMixin {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: color.backgroundColor,
      appBar: AppBarCustom(
        leadingIcon: AssetIcons.back,
        titleAppBar: LocaleKeys.community.tr,
        suffixIcon1: AssetIcons.createCommunity,
        suffixIcon2: AssetIcons.searchIcon,
        centerTitle: false,
      ),
      body: Column(
        children: [
          CommunityItem(),
          CommunityItem(),
          CommunityItem(),
          CommunityItem(),
          CommunityItem(),
          CommunityItem(),
        ],
      ),
    ));
  }
}
