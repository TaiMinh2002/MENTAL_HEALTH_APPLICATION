import 'package:mental_healing/utils/functions.dart';

class GlobalDataManager {
  factory GlobalDataManager() {
    return _singleton;
  }
  GlobalDataManager._internal() {
    _init();
  }

  bool isOpenAppSetting = false;
  String versionApp = '';
  String versionOS = '';
  Future<void> _init() async {
    versionApp = await getAppVersion();
    versionOS = await getVersionOS();
  }

  static final GlobalDataManager _singleton = GlobalDataManager._internal();
}
