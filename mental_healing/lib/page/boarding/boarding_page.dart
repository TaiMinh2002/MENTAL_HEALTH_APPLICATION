import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/boarding/boarding_controller.dart';
import 'package:mental_healing/page/boarding/component/boarding_item.dart';

class BoardingPage extends BaseScreen<BoardingController> with BaseMixin {
  BoardingPage({super.key});

  @override
  Widget builder() {
    return Scaffold(
      backgroundColor: color.whiteColor,
      body: PageView.builder(
          controller: controller.pageController,
          itemCount: 4,
          physics: const NeverScrollableScrollPhysics(),
          allowImplicitScrolling: true,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return BoardingItem(
                  index: 0,
                  backgroundColor: color.colorE5EAD7,
                  stepContainerColor: color.colorE5EAD7,
                  stepTextColor: color.color7D944D,
                );
              case 1:
                return BoardingItem(
                  index: 1,
                  backgroundColor: color.colorFFC89E,
                  stepContainerColor: color.colorFFD2C2,
                  stepTextColor: color.colorFE814B,
                );
              case 2:
                return BoardingItem(
                  index: 2,
                  backgroundColor: color.colorE1E1E0,
                  stepContainerColor: color.colorFFEBC2,
                  stepTextColor: color.colorE0A500,
                );
              case 3:
                return BoardingItem(
                  index: 3,
                  backgroundColor: color.colorA18FFF,
                  stepContainerColor: color.colorCBC2FF,
                  stepTextColor: color.color7152FF,
                );
              default:
                return const SizedBox();
            }
          }),
    );
  }

  @override
  BoardingController? putController() => BoardingController();
}
