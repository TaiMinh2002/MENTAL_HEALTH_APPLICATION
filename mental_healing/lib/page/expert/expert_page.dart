import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/base_widget/back_button_widget.dart';
import 'package:mental_healing/base_widget/widget_input_text.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/expert/component/category_item.dart';

class ExpertPage extends StatelessWidget with BaseMixin {
  final TextEditingController searchController = TextEditingController();
  ExpertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            _headerWidget(),
            Positioned(
              bottom: -28,
              left: 20,
              right: 20,
              child: _searchWidget(),
            )
          ],
        ),
      ),
    );
  }

  Widget _headerWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        gradient: LinearGradient(
          colors: [
            color.color81C784,
            color.colorC8E6C9,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackButtonWidget(
            iconColor: color.whiteColor,
            paddingSize: 0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_welcomeWidget(), _avatarWidget()],
          ),
        ],
      ),
    );
  }

  Widget _welcomeWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Hi ....!',
          style: textStyle.regular(size: 16, color: color.whiteColor),
        ),
        Text(
          LocaleKeys.find_expert.tr,
          style: textStyle.extraBold(size: 20, color: color.whiteColor),
        ),
      ],
    );
  }

  Widget _avatarWidget() {
    return const CircleAvatar(
      backgroundImage: AssetImage(AssetImages.noPerson),
      radius: 50,
    );
  }

  Widget _searchWidget() {
    return WidgetInputText(
      hintText: 'Search......',
      controller: searchController,
      textCapitalization: TextCapitalization.none,
      borderRadius: 20,
      iconLeading: AssetIcons.search,
      height: 50,
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 20,
      size.width,
      size.height - 30,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
