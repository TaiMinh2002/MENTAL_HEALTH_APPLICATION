import 'package:lottie/lottie.dart';
import 'package:mental_healing/base_widget/app_bar_custom.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/expert_list/component/expert_item.dart';
import 'package:mental_healing/page/expert_list/expert_list_controller.dart';

class ExpertListPage extends StatelessWidget {
  final ExpertListController controller = Get.put(ExpertListController());

  ExpertListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        titleAppBar: LocaleKeys.expert.tr,
        centerTitle: false,
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.expertList.isEmpty) {
          return Lottie.asset(AssetLotties.appLoading);
        }

        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent &&
                !controller.isLoading.value &&
                controller.hasMore.value) {
              controller.loadMore();
            }
            return false;
          },
          child: ListView.builder(
            itemCount: controller.expertList.length +
                (controller.hasMore.value ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < controller.expertList.length) {
                return ExpertItem(
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  expert: controller.expertList[index],
                );
              } else {
                return Lottie.asset(AssetLotties.appLoading);
              }
            },
          ),
        );
      }),
    );
  }
}
