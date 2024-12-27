import 'package:mental_healing/api_manager/rest_client_base.dart';
import 'package:mental_healing/data/model/forum_params.dart';
import 'package:mental_healing/data/model/mood_info.dart';
import 'package:mental_healing/data/repository/mood_repository.dart';
import 'package:mental_healing/global/app_url.dart';

class MoodRepositoryImpl extends MoodRepository {
  final RestClientBase _client = RestClientBase();

  @override
  Future<MoodInfo> setMood(String message) async {
    final response = await _client.post(
      AppUrl.setMood,
      data: {"note": message},
    );

    return MoodInfo.fromJson(response);
  }

  @override
  Future<List<MoodInfo>> getListMoods({
    required ForumParams param,
  }) async {
    final response = await _client.get(
      AppUrl.listMoods,
      queryParameters: param.toParamsJson(),
    );
    final List<dynamic> data = response;
    return data.map((json) => MoodInfo.fromJson(json)).toList();
  }
}
