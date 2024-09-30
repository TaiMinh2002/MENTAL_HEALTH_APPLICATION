import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/dashboard/dashboard_controller.dart';
import 'package:mental_healing/page/home/home_controller.dart';

class HomePage extends StatelessWidget with BaseMixin {
  final HomeController controller = Get.put(HomeController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: color.colorFFD966,
              expandedHeight: 50,
              title: Text(
                '👋 Welcome',
                style: TextStyle(color: color.color333333),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        _buildGridItem(
                            title: LocaleKeys.mood.tr,
                            icon: AssetIcons.mood,
                            context: context,
                            onTap: () {
                              Get.find<DashboardController>()
                                  .changePageIndex(index: 1);
                            }),
                        _buildGridItem(
                            title: LocaleKeys.exercise.tr,
                            icon: AssetIcons.calm,
                            context: context,
                            onTap: () {}),
                      ],
                    ),
                    Row(
                      children: [
                        _buildGridItem(
                            title: LocaleKeys.music.tr,
                            icon: AssetIcons.music,
                            context: context,
                            onTap: () {}),
                        _buildGridItem(
                            title: LocaleKeys.forum.tr,
                            icon: AssetIcons.community,
                            context: context,
                            onTap: controller.handleCommunity),
                      ],
                    ),
                    Row(
                      children: [
                        _buildGridItem(
                            title: LocaleKeys.expert.tr,
                            icon: AssetIcons.experts,
                            context: context,
                            onTap: () {}),
                        _buildGridItem(
                            title: LocaleKeys.chatbot.tr,
                            icon: AssetIcons.chatbot,
                            context: context,
                            onTap: () {}),
                      ],
                    ),
                    _image(),
                    _quote()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(
      {required String title,
      required String icon,
      required BuildContext context,
      Function()? onTap}) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        height: screenHeight / 7,
        width: screenWidth / 2.23,
        decoration: BoxDecoration(
          color: color.colorEDEDED,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(icon, height: 25, width: 25),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  title,
                  style: textStyle.medium(color: color.color333333),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _image() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              AssetImages.mindfullness,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        color.colorFFFFFF.withOpacity(0),
                        color.colorFFFFFF
                      ])),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 49, vertical: 5),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.calm_mind_course.tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                            textStyle.bold(size: 20, color: color.color444444),
                      ),
                      Text(
                        LocaleKeys.journey_to_mindfulness.tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textStyle.regular(
                            size: 18, color: color.color444444),
                      ),
                    ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _quote() {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color.color8F5E9,
          border: Border.all(
            color: color.colorED581,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Text(
            'A calm mind brings inner strength and self-confidence, so that\'s very important for good health.',
            textAlign: TextAlign.center,
            style: textStyle.semiBold(size: 16, color: color.color333333),
          ),
          Text(
            '- Dalai Lama',
            style: textStyle.bold(size: 14, color: color.color616161),
          ),
        ],
      ),
    );
  }
}
