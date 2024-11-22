import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/import.dart';

class ExpertController extends GetxController {
  Future<void> moveToListExpert(int specialization) async {
    Get.toNamed(AppRouter.routerExpertListPage, arguments: specialization);
  }
}
