import 'package:mental_healing/api_manager/rest_client_base.dart';
import 'package:mental_healing/data/model/forums/forum_params.dart';
import 'package:mental_healing/data/model/mood/mood_entries.dart';
import 'package:mental_healing/data/model/mood/mood_info.dart';
import 'package:mental_healing/data/repository/mood_repository.dart';
import 'package:mental_healing/global/app_url.dart';

class MoodRepositoryImpl extends MoodRepository {
  final RestClientBase _client = RestClientBase();

  @override
  Future<MoodInfo> setMood(String note) async {
    final response =
        await _client.post(AppUrl.setMood, queryParameters: {"note": note});
    return MoodInfo.fromJson(response);
  }

  @override
  Future<MoodEntries> getListMoods({required ForumParams param}) async {
    final response = await _client.get(
      AppUrl.listMoods,
      queryParameters: {'page': param.page, 'limit': param.limit},
    );
    return MoodEntries.fromJson(response['mood_entries']);
  }
}
