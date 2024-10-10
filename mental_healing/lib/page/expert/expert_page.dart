import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/base_widget/back_button_widget.dart';
import 'package:mental_healing/base_widget/widget_input_text.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/expert/component/body_item.dart';
import 'package:mental_healing/page/expert/component/category_item.dart';
import 'package:mental_healing/page/expert/component/expert_item.dart';

class ExpertPage extends StatelessWidget with BaseMixin {
  final TextEditingController searchController = TextEditingController();
  ExpertPage({super.key});

  final List<Map<String, dynamic>> categories = [
    {
      'category': LocaleKeys.clinical_psychology.tr,
      'color': const Color(0xffADD8E6),
      'icon': '🧠'
    },
    {
      'category': LocaleKeys.psychiatry.tr,
      'color': const Color(0xFF90EE90),
      'icon': '💊'
    },
    {
      'category': LocaleKeys.counseling.tr,
      'color': const Color(0xFFFFFACD),
      'icon': '🗣️'
    },
    {
      'category': LocaleKeys.behavioral_therapy.tr,
      'color': const Color(0xFFFFDAB9),
      'icon': '🔄'
    },
    {
      'category': LocaleKeys.family_marriage_therapy.tr,
      'color': const Color(0xffFFB6C1),
      'icon': '👪'
    },
    {
      'category': LocaleKeys.art_music_therapy.tr,
      'color': const Color(0xFFD8BFD8),
      'icon': '🎨'
    },
    {
      'category': LocaleKeys.therapy_for_elderly.tr,
      'color': const Color(0xffD3D3D3),
      'icon': '👴👵'
    }
  ];

  final List<Color> backgroundColors = [
    const Color(0xFFE0F7FA),
    const Color(0xFFE0E0E0),
    const Color(0xFFFCE4EC),
  ];

  final List<Color> textColors = [
    const Color(0xFF37474F),
    const Color(0xFF212121),
    const Color(0xFF424242),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
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
              BodyItem(
                title: LocaleKeys.categories.tr,
                widget: SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin:
                            const EdgeInsets.only(left: 16, right: 16, top: 25),
                        child: CategoryItem(
                          category: categories[index]['category'],
                          categoryColor: categories[index]['color'],
                          icon: categories[index]['icon'],
                        ),
                      );
                    },
                  ),
                ),
              ),
              BodyItem(
                  title: LocaleKeys.top_expert.tr,
                  widget: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      int colorIndex = index % 3;
                      return ExpertItem(
                        backgroundColor: backgroundColors[colorIndex],
                        textColor: textColors[colorIndex],
                      );
                    },
                  ))
            ],
          ),
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
