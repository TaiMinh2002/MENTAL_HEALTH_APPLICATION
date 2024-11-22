import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/base_widget/snack_bar_helper.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/model/expert_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mental_healing/utils/cache_manager.dart';
import 'package:mental_healing/utils/config.dart';

class ExpertListController extends GetxController {
  RxList<ExpertModel> expertList = <ExpertModel>[].obs;
  late int specialization;
  RxBool isLoading = false.obs;
  RxInt currentPage = 1.obs;
  RxBool hasMore = true.obs;
  final int limit = 10;

  @override
  void onInit() {
    super.onInit();
    specialization = Get.arguments;
    getAllExperts();
  }

  Future<void> getAllExperts({bool isLoadMore = false}) async {
    final String? token = CacheManager.getStoredToken();
    if (token == null || token.isEmpty) {
      SnackBarHelper.showError(LocaleKeys.token_missing.tr);
      return;
    }

    String url =
        '${Config.apiUrl}/experts?specialization=$specialization&page=${currentPage.value}&limit=$limit';

    try {
      isLoading.value = true;
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<ExpertModel> fetchedExperts = (data['experts'] as List)
            .map((item) => ExpertModel.fromJson(item))
            .toList();

        if (isLoadMore) {
          expertList.addAll(fetchedExperts);
        } else {
          expertList.value = fetchedExperts;
        }

        hasMore.value = data['total_page'] > currentPage.value;
        if (hasMore.value) {
          currentPage.value += 1;
        }
      } else {
        final errorResponse = jsonDecode(response.body);
        SnackBarHelper.showError(errorResponse['message']);
      }
    } catch (e) {
      SnackBarHelper.showError(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void loadMore() {
    if (hasMore.value && !isLoading.value) {
      getAllExperts(isLoadMore: true);
    }
  }

  Future<void> moveToExpertDetail(int expertId) async {
    Get.toNamed(
      AppRouter.routerExpertDetail,
      arguments: expertId,
    );
  }
}
