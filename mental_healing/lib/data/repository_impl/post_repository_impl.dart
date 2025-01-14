import 'package:mental_healing/api_manager/rest_client_base.dart';
import 'package:mental_healing/data/model/post/create_post_params.dart';
import 'package:mental_healing/data/model/post/create_post_result.dart';
import 'package:mental_healing/data/repository/post_repository.dart';
import 'package:mental_healing/global/app_url.dart';

class PostRepositoryImpl extends PostRepository {
  final RestClientBase _client = RestClientBase();

  @override
  Future<CreatePostResult> createPost(
      {required CreatePostParams params}) async {
    final response =
        await _client.post(AppUrl.createPost, queryParameters: params.toJson());
    return CreatePostResult.fromJson(response);
  }
}
