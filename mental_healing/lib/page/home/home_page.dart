import 'package:mental_healing/generated/locales.g.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/home/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF7F4F2),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              backgroundColor: Color(0xffFFD966),
              expandedHeight: 50,
              title: Text(
                '👋 Welcome',
                style: TextStyle(color: Color(0xff333333)),
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
                            LocaleKeys.mood.tr, AssetIcons.mood, context),
                        _buildGridItem(
                            LocaleKeys.exercise.tr, AssetIcons.calm, context),
                      ],
                    ),
                    Row(
                      children: [
                        _buildGridItem(
                            LocaleKeys.music.tr, AssetIcons.music, context),
                        _buildGridItem(
                            LocaleKeys.sleep.tr, AssetIcons.sleep, context),
                      ],
                    ),
                    Row(
                      children: [
                        _buildGridItem(
                            LocaleKeys.expert.tr, AssetIcons.experts, context),
                        _buildGridItem(
                            LocaleKeys.chatbot.tr, AssetIcons.chatbot, context),
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

  Widget _buildGridItem(String title, String icon, BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.all(5),
      height: screenHeight / 7,
      width: screenWidth / 2.23,
      decoration: BoxDecoration(
        color: const Color(0xffEDEDED),
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
                style: const TextStyle(color: Color(0xff333333)),
              ),
            ),
          ],
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
                        const Color(0xffFFFFFF).withOpacity(0),
                        const Color(0xffFFFFFF)
                      ])),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.calm_mind_course.tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Color(0xff444444),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        LocaleKeys.journey_to_mindfulness.tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xff444444),
                            fontWeight: FontWeight.w400),
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
          color: const Color(0xffE8F5E9),
          border: Border.all(
            color: const Color(0xffAED581),
          ),
          borderRadius: BorderRadius.circular(15)),
      child: const Column(
        children: [
          Text(
            'A calm mind brings inner strength\n and self-confidence, so that\'s very important for good health.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Color(0xff333333)),
          ),
          Text(
            '- Dalai Lama',
            style: TextStyle(fontSize: 14, color: Color(0xff616161)),
          ),
        ],
      ),
    );
  }
}
