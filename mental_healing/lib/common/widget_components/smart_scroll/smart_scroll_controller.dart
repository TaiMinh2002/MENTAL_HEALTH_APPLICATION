import 'package:smart_scroll/smart_scroll.dart';
import 'package:mental_healing/import.dart';

mixin SmartLoadListController {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  ScrollController smartScrollController = ScrollController();
  RxBool isLoadingPage = false.obs;

  void jumToPosition({double? position}) {
    if (smartScrollController.hasClients) {
      smartScrollController.jumpTo(position ?? 0);
    }
  }

  void onLoadMore();

  void onRefresh();
}
