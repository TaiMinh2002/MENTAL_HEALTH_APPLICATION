import 'package:mental_healing/base/cache_manager.dart';
import 'package:mental_healing/data/model/user/user_info.dart';
// import 'package:mental_healing/data/use_case/auth_use_case.dart';
import 'package:mental_healing/global/app_router.dart';
import 'package:mental_healing/import.dart';

class GlobalDataManager with CacheManager {
  factory GlobalDataManager() {
    return _singleton;
  }
  GlobalDataManager._internal() {
    _initGlobalData();
  }

  bool passBoarding = false;
  bool passChatbot = false;

  bool isOpenAppSetting = false;
  String versionApp = '';
  String versionOS = '';
  // final AuthUseCase _authUseCase = AuthUseCase();
  Rx<UserInfo> userInfo = const UserInfo().obs;

  Future<void> _initGlobalData() async {
    passBoarding = getPassBoarding() ?? false;
    passChatbot = getPassChatbot() ?? false;
    userInfo.value = await getUserInfo();
  }

  Future<void> getNewUserInfo() async {
    userInfo.value = await getUserInfo();
  }

  void checkLogin() {
    if (getToken() != null &&
        (GlobalDataManager().userInfo.value.age != null ||
            GlobalDataManager().userInfo.value.gender != null ||
            GlobalDataManager().userInfo.value.mood != null ||
            GlobalDataManager().userInfo.value.sleep != null)) {
      Get.offAllNamed(AppRouter.routerDashboard);
    } else {
      Get.offAllNamed(AppRouter.routerSignIn);
    }
  }

  // Future<void> getUserInfoWithApi() async {
  //   await _authUseCase.getUserInfo(
  //     onSuccess: (UserInfo data) async {
  //       removeUserInfo();
  //       UserInfo newUserInfo = data;
  //       newUserInfo = newUserInfo.copyWith(role: userInfo.value.role);
  //       await saveUserInfo(newUserInfo);
  //       userInfo.value = await getUserInfo();
  //     },
  //     onFailure: (err) {},
  //   );
  // }

  static final GlobalDataManager _singleton = GlobalDataManager._internal();
}
