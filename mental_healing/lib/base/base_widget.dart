import 'package:mental_healing/base/base_common_widgets.dart';
import 'package:mental_healing/import.dart';

abstract class BaseWidget<T extends BaseController> extends StatelessWidget
    with BaseMixin, RouteAware, BaseCommonWidgets {
  BaseWidget({this.tag, Key? key}) : super(key: key) {
    if (Get.isRegistered<T>(tag: tag)) {
      controller = GetInstance().find<T>(tag: tag);
    }
  }

  final String? tag;
  late final T controller;
  final BuildContext context = Get.context!;

  String? screenName() => '';

  @override
  Widget build(BuildContext context) {
    return builder();
  }

  Widget builder();

  @override
  void didPush() {
    _sendCurrentTabToAnalytics();
  }

  @override
  void didPopNext() {
    _sendCurrentTabToAnalytics();
  }

  void _sendCurrentTabToAnalytics() {}
}
