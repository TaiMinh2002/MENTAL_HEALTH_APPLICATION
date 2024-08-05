import 'package:smart_scroll/smart_scroll.dart';
import 'package:mental_healing/common/widget_components/loading/custom_loading.dart';
import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_controller.dart';
import 'package:mental_healing/import.dart';

mixin SmartLoadListWidget {
  Widget buildSmartListExpanded(SmartLoadListController controller,
          {Widget? child,
          bool? enablePullDown,
          bool? enablePullUp,
          double headerHeight = 20,
          ScrollController? scrollController}) =>
      Expanded(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            SmartScroll(
              physics: GetPlatform.isIOS
                  ? const BouncingScrollPhysics()
                  : const ClampingScrollPhysics(),
              controller: controller.refreshController,
              scrollController:
                  scrollController ?? controller.smartScrollController,
              enablePullDown: enablePullDown ?? true,
              enablePullUp: enablePullUp ?? false,
              onLoading: controller.onLoadMore,
              onRefresh: controller.onRefresh,
              header: GetPlatform.isIOS
                  ? ClassicHeader(
                      idleText: '',
                      refreshingText: '',
                      releaseText: '',
                      failedText: '',
                      completeText: '',
                      canTwoLevelText: '',
                      height: headerHeight,
                      spacing: 0,
                      completeDuration: Duration.zero,
                      completeIcon: const SizedBox(),
                      // idleIcon: Icon(Icons.arrow_downward_rounded,
                      //     color: appThemes.mainColor),
                      // releaseIcon:
                      //     Icon(Icons.refresh, color: appThemes.mainColor),
                      // refreshingIcon: SizedBox(
                      //   height: 30,
                      //   width: 30,
                      //   child: CupertinoActivityIndicator(
                      //     color: appThemes.mainColor,
                      //   ),
                      // ),
                    )
                  : MaterialClassicHeader(
                      height: 25, color: appThemes.mainColor),
              footer: const ClassicFooter(
                loadStyle: LoadStyle.ShowWhenLoading,
                idleText: '',
                failedText: '',
                noDataText: '',
                loadingText: '',
                canLoadingText: '',
                height: 65,
                completeDuration: Duration(milliseconds: 1500),
                idleIcon: SizedBox(),
                loadingIcon: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                    strokeWidth: 2.5,
                  ),
                ),
              ),
              child: child,
            ),
            Visibility(
                visible: controller.isLoadingPage.value,
                child: CustomLoading(
                    color: appThemes.mainColor, type: CustomLoadingType.start)),
          ],
        ),
      );

  Widget buildSmartList(SmartLoadListController controller,
          {Widget? child,
          bool? enablePullDown,
          bool? enablePullUp,
          double headerHeight = 20,
          ScrollController? scrollController}) =>
      SmartScroll(
        physics: GetPlatform.isIOS
            ? const BouncingScrollPhysics()
            : const ClampingScrollPhysics(),
        controller: controller.refreshController,
        scrollController: scrollController,
        enablePullDown: enablePullDown ?? true,
        enablePullUp: enablePullUp ?? false,
        onLoading: controller.onLoadMore,
        onRefresh: controller.onRefresh,
        header: GetPlatform.isIOS
            ? ClassicHeader(
                idleText: '',
                refreshingText: '',
                releaseText: '',
                failedText: '',
                completeText: '',
                canTwoLevelText: '',
                height: headerHeight,
                completeDuration: Duration.zero,
                completeIcon: const SizedBox(),
                // idleIcon: Icon(Icons.arrow_downward_rounded,
                //     color: appThemes.mainColor),
                // releaseIcon: Icon(Icons.refresh, color: appThemes.mainColor),
                // refreshingIcon: SizedBox(
                //   height: 30,
                //   width: 30,
                //   child: CupertinoActivityIndicator(
                //     color: appThemes.mainColor,
                //   ),
                // ),
              )
            : MaterialClassicHeader(height: 25, color: appThemes.mainColor),
        footer: const ClassicFooter(
          loadStyle: LoadStyle.ShowWhenLoading,
          idleText: '',
          failedText: '',
          noDataText: '',
          loadingText: '',
          canLoadingText: '',
          height: 65,
          completeDuration: Duration.zero,
          idleIcon: SizedBox(),
          loadingIcon: SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              color: Colors.grey,
              strokeWidth: 2.5,
            ),
          ),
        ),
        child: child,
      );
}
