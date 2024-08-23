import 'package:mental_healing/global/app_enum.dart';

extension MoodImpl on Mood {
  String get title {
    switch (this) {
      case Mood.tired:
        return 'Tired';
      case Mood.sad:
        return 'Sad';
      case Mood.neutral:
        return 'Neutral';
      case Mood.good:
        return 'Good';
      case Mood.great:
        return 'Great';
      default:
        return '';
    }
  }
}

extension SleepImpl on Sleep {
  String get title {
    switch (this) {
      case Sleep.lessThan3Hours:
        return '< 3 hours';
      case Sleep.threeToFourHours:
        return '3-4 hours';
      case Sleep.fiveHours:
        return '5 hours';
      case Sleep.sixToSevenHours:
        return '6-7 hours';
      case Sleep.sevenToNineHours:
        return '7-9 hours';
      default:
        return '';
    }
  }
}

extension StressImpl on Stress {
  String get title {
    switch (this) {
      case Stress.notStressed:
        return 'Not Stressed';
      case Stress.slightlyStressed:
        return 'Slightly Stressed';
      case Stress.moderatelyStressed:
        return 'Moderately Stressed';
      case Stress.veryStressed:
        return 'Very Stressed';
      case Stress.extremelyStressed:
        return 'Extremely Stressed';
      default:
        return '';
    }
  }
}
