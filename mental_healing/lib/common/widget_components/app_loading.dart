import 'package:mental_healing/common/widget_components/loading/custom_loading.dart';
import 'package:mental_healing/import.dart';

Widget get appLoading => SizedBox(
      child: Center(
        child: CustomLoading(
            color: appThemes.mainColor, type: CustomLoadingType.start),
      ),
    );
