import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/base_widget/app_bar_custom.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/community/component/forum_item.dart';

class ForumPage extends StatelessWidget with BaseMixin {
  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: color.backgroundColor,
      appBar: AppBarCustom(
        leadingIcon: AssetIcons.back,
        titleAppBar: LocaleKeys.forum.tr,
        suffixIcon1: AssetIcons.createCommunity,
        suffixIcon2: AssetIcons.searchIcon,
        centerTitle: false,
      ),
      body: Column(
        children: [
          ForumItem(),
          ForumItem(),
          ForumItem(),
          ForumItem(),
          ForumItem(),
          ForumItem(),
        ],
      ),
    ));
  }
}
