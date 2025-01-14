import 'package:mental_healing/api_manager/rest_client_base.dart';
import 'package:mental_healing/data/model/forums/forum_create_params.dart';
import 'package:mental_healing/data/model/forums/forum_detail.dart';
import 'package:mental_healing/data/model/forums/forum_info.dart';
import 'package:mental_healing/data/model/forums/forum_params.dart';
import 'package:mental_healing/data/model/forums/forums.dart';
import 'package:mental_healing/data/repository/forum_repository.dart';
import 'package:mental_healing/global/app_url.dart';

class ForumRepositoryImpl extends ForumRepository {
  final RestClientBase _client = RestClientBase();

  @override
  Future<Forums> getListForums({required ForumParams param}) async {
    final response = await _client.get(
      AppUrl.listForum,
      queryParameters: param.toJson(),
    );
    return Forums.fromJson(response['forums']);
  }

  @override
  Future<ForumDetail> getForumDetail({required int id}) async {
    final response = await _client.get(
      '${AppUrl.listForum}/$id/detail',
    );
    return ForumDetail.fromJson(response['forum']);
  }

  @override
  Future<ForumInfo> createForum({required ForumCreateParams params}) async {
    final response =
        await _client.post(AppUrl.createForum, formData: params.toJson());
    return ForumInfo.fromJson(response);
  }

  @override
  Future<int> joinForum({required int forumId}) async {
    final response = await _client
        .post(AppUrl.createForum, queryParameters: {"forum_id": forumId});
    return response['forum_id'];
  }
}
