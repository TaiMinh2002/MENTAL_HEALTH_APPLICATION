import 'package:intl/intl.dart';
import 'package:mental_healing/global/app_enum_ex.dart';

enum Mood { tired, sad, neutral, good, great }

enum Sleep {
  lessThan3Hours,
  threeToFourHours,
  fiveHours,
  sixToSevenHours,
  sevenToNineHours
}

enum Stress {
  notStressed,
  slightlyStressed,
  moderatelyStressed,
  veryStressed,
  extremelyStressed
}

enum CacheManagerKey {
  token,
  language,
  userInfo,
  passBoarding,
  fcmToken,
  passChatbot,
  refreshToken
}

enum DateFormatType {
  yyyyMmDdHhMm,
  yyyyMmDd,
  mmDd,
  mmDdE,
  mmDdHhMm,
  hhMM,
}

extension IntExtension on int {
  String convertDateTimeString(DateFormatType formatType) {
    final date = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    DateFormat outputFormat = DateFormat(formatType.formatString, "ja");
    return outputFormat.format(date);
  }
}
