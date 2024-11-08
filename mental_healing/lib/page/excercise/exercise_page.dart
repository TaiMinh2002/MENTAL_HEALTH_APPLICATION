import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/base_widget/app_bar_custom.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/dashboard/dashboard_controller.dart';

class ExercisePage extends StatefulWidget with BaseMixin {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        leadingPressed: () {
          Get.find<DashboardController>().changePageIndex(index: 0);
        },
        titleAppBar: LocaleKeys.exercise.tr,
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButton(LocaleKeys.meditation.tr, 0),
                buildButton(LocaleKeys.breathe_deeply.tr, 1),
                buildButton(LocaleKeys.yoga.tr, 2),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: [
                _bodyWidget('Meditation'),
                _bodyWidget('Breathe Deeply'),
                _bodyWidget('Yoga'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? widget.color.color1E201E
              : widget.color.colorF0F0F0,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selectedIndex == index
                ? widget.color.whiteColor
                : widget.color.color1E201E,
          ),
        ),
      ),
    );
  }

  Widget _bodyWidget(String type) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  AssetImages.thumbnailImage,
                  height: 230,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                  color: widget.color.blackColor,
                  child: Text(
                    '10:00',
                    style: widget.textStyle
                        .medium(size: 12, color: widget.color.whiteColor),
                  ),
                ),
              ),
            ],
          ),
          _infoVideo(type)
        ],
      ),
    );
  }

  Widget _infoVideo(String type) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$type Exercise',
                  maxLines: 2,
                  style: widget.textStyle.regular(
                    size: 14,
                    color: widget.color.color030303,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    '${LocaleKeys.mental_health_admin.tr} • 4 year ago',
                    style: widget.textStyle
                        .regular(size: 12, color: widget.color.color606060),
                  ),
                )
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          SvgPicture.asset(AssetIcons.report,
              height: 25,
              width: 25,
              colorFilter:
                  ColorFilter.mode(widget.color.blackColor, BlendMode.srcIn))
        ],
      ),
    );
  }
}
