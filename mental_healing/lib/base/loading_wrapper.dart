import 'package:mental_healing/common/widget_components/loading/custom_loading.dart';
import 'package:mental_healing/import.dart';

class LoadingWrapper extends BaseScreen<LoadingController> {
  LoadingWrapper({Key? key, this.child}) : super(key: key);

  final Widget? child;
  @override
  Widget builder() {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: <Widget>[
          child ?? const SizedBox(),
          Obx(
            () => Visibility(
              visible: controller.loadingCtrl.value,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ColoredBox(
                      color: const Color(0xFF131615).withOpacity(0.3),
                    ),
                  ),
                  _buildLoading()
                ],
              ),
            ),
          )
        ]));
  }

  Widget _buildLoading() {
    return CustomLoading(
        color: appThemes.mainColor, type: CustomLoadingType.start);
  }

  @override
  LoadingController? putController() {
    return LoadingController();
  }
}

class LoadingController extends BaseController {
  Rx<bool> loadingCtrl = Rx<bool>(false);

  void show() {
    loadingCtrl.value = true;
  }

  void hide() {
    loadingCtrl.value = false;
  }

  void hideAll() {
    loadingCtrl.value = false;
  }
}
