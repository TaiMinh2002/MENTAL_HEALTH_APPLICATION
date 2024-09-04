import 'package:mental_healing/global/app_enum.dart';
import 'package:mental_healing/import.dart';

extension MoodImpl on Mood {
  String get title {
    switch (this) {
      case Mood.tired:
        return LocaleKeys.feel_tired.tr;
      case Mood.sad:
        return LocaleKeys.feel_sad.tr;
      case Mood.neutral:
        return LocaleKeys.feel_neutral.tr;
      case Mood.good:
        return LocaleKeys.feel_good.tr;
      case Mood.great:
        return LocaleKeys.feel_great.tr;
      default:
        return '';
    }
  }

  int get id {
    switch (this) {
      case Mood.tired:
        return 5;
      case Mood.sad:
        return 4;
      case Mood.neutral:
        return 3;
      case Mood.good:
        return 2;
      case Mood.great:
        return 1;
      default:
        return 0;
    }
  }
}

extension SleepImpl on Sleep {
  String get title {
    switch (this) {
      case Sleep.lessThan3Hours:
        return LocaleKeys.less_than_three_hours.tr;
      case Sleep.threeToFourHours:
        return LocaleKeys.three_four_hours.tr;
      case Sleep.fiveHours:
        return LocaleKeys.five_hours.tr;
      case Sleep.sixToSevenHours:
        return LocaleKeys.six_seven_hours.tr;
      case Sleep.sevenToNineHours:
        return LocaleKeys.seven_nine_hours.tr;
      default:
        return '';
    }
  }

  int get id {
    switch (this) {
      case Sleep.lessThan3Hours:
        return 5;
      case Sleep.threeToFourHours:
        return 4;
      case Sleep.fiveHours:
        return 3;
      case Sleep.sixToSevenHours:
        return 2;
      case Sleep.sevenToNineHours:
        return 1;
      default:
        return 0;
    }
  }
}

extension StressImpl on Stress {
  String get title {
    switch (this) {
      case Stress.notStressed:
        return LocaleKeys.not_stressed_label.tr;
      case Stress.slightlyStressed:
        return LocaleKeys.slightly_stressed_label.tr;
      case Stress.moderatelyStressed:
        return LocaleKeys.moderately_stressed_label.tr;
      case Stress.veryStressed:
        return LocaleKeys.very_stressed_label.tr;
      case Stress.extremelyStressed:
        return LocaleKeys.extremely_stressed_label.tr;
      default:
        return '';
    }
  }

  int get id {
    switch (this) {
      case Stress.notStressed:
        return 1;
      case Stress.slightlyStressed:
        return 2;
      case Stress.moderatelyStressed:
        return 3;
      case Stress.veryStressed:
        return 4;
      case Stress.extremelyStressed:
        return 5;
      default:
        return 0;
    }
  }
}
