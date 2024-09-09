import 'dart:math';

import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/base_widget/snack_bar_helper.dart';
import 'package:mental_healing/import.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mental_healing/model/forum_model.dart';
import 'package:mental_healing/utils/cache_manager.dart';
import 'package:mental_healing/utils/config.dart';

class ForumController extends GetxController with BaseMixin {
  // Khai báo các biến bằng Rx
  RxList<ForumModel> forumList = <ForumModel>[].obs;
  RxBool isLoading = false.obs;
  RxInt currentPage = 1.obs;
  RxBool hasMore = true.obs;

  @override
  void onInit() {
    super.onInit();
    getAllForums();
  }

  Future<void> getAllForums({bool isLoadMore = false}) async {
    // Lấy token từ CacheManager
    final String? token = CacheManager.getStoredToken();

    if (token == null || token.isEmpty) {
      SnackBarHelper.showError(LocaleKeys.token_missing.tr);
      return;
    }

    const String forumUrl = '${Config.apiUrl}/forums';

    try {
      isLoading.value = true;

      final Map<String, String> queryParameters = {
        'page': currentPage.value.toString(),
        'limit': '10',
      };

      final uri = Uri.parse(forumUrl).replace(queryParameters: queryParameters);

      final http.Response response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Thêm Bearer token vào headers
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final List<ForumModel> fetchedForums = (responseData['data'] as List)
            .map((item) => ForumModel.fromJson(item))
            .toList();

        fetchedForums.shuffle(Random());

        if (isLoadMore) {
          forumList.addAll(fetchedForums);
        } else {
          forumList.value = fetchedForums;
        }

        currentPage.value += 1;
        hasMore.value = responseData['has_more_pages'];
      } else {
        final errorResponse = jsonDecode(response.body);
        SnackBarHelper.showError(errorResponse['message']);
      }
    } catch (e) {
      print('Error fetching forums: $e');
      SnackBarHelper.showError(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Hàm để load more khi kéo xuống cuối danh sách
  void loadMore() {
    if (hasMore.value && !isLoading.value) {
      getAllForums(isLoadMore: true);
    }
  }

  Future<void> handleJoinForum(int forumId) async {
    // Lấy token từ CacheManager
    final String? token = CacheManager.getStoredToken();

    if (token == null || token.isEmpty) {
      SnackBarHelper.showError(LocaleKeys.token_is_missing.tr);
      return;
    }

    // Sử dụng forum_id từ URL
    final String joinForumUrl = '${Config.apiUrl}/forums/join/$forumId';

    try {
      final response = await http.post(
        Uri.parse(joinForumUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Thêm token vào header
        },
      );

      if (response.statusCode == 200) {
        getAllForums();
      } else {
        final errorResponse = jsonDecode(response.body);
        SnackBarHelper.showError(errorResponse['error']);
      }
    } catch (e) {
      print('Error joining forum: $e');
      SnackBarHelper.showError(e.toString());
    }
  }

  Future<void> handleOutForum(int forumId) async {
    // Lấy token từ CacheManager
    final String? token = CacheManager.getStoredToken();

    if (token == null || token.isEmpty) {
      SnackBarHelper.showError(LocaleKeys.token_is_missing.tr);
      return;
    }

    // Sử dụng forum_id từ URL
    final String outForumUrl = '${Config.apiUrl}/forums/leave/$forumId';

    try {
      final response = await http.post(
        Uri.parse(outForumUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Thêm token vào header
        },
      );

      if (response.statusCode == 200) {
        getAllForums();
      } else {
        final errorResponse = jsonDecode(response.body);
        SnackBarHelper.showError(errorResponse['error']);
      }
    } catch (e) {
      SnackBarHelper.showError(e.toString());
    }
  }
}
