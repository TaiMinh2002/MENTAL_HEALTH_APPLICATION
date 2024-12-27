import 'package:mental_healing/data/model/forum_params.dart';
import 'package:mental_healing/data/model/mood_info.dart';

abstract class MoodRepository {
  Future<List<MoodInfo>> getListMoods({required ForumParams param});
  Future<MoodInfo> setMood(String message);
}
