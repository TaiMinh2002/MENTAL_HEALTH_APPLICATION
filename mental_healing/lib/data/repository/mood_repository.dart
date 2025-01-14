import 'package:mental_healing/data/model/forums/forum_params.dart';
import 'package:mental_healing/data/model/mood/mood_entries.dart';
import 'package:mental_healing/data/model/mood/mood_info.dart';

abstract class MoodRepository {
  Future<MoodEntries> getListMoods({required ForumParams param});
  Future<MoodInfo> setMood(String note);
}
