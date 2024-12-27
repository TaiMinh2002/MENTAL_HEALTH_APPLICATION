import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/data/model/create_post_params.dart';
import 'package:mental_healing/data/model/create_post_result.dart';

import 'package:mental_healing/data/repository/post_repository.dart';
import 'package:mental_healing/data/repository_impl/post_repository_impl.dart';

class PostUseCase {
  final PostRepository _repository = PostRepositoryImpl();

  Future<void> createPost({
    required CreatePostParams params,
    required Function(CreatePostResult data) onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      final data = await _repository.createPost(params: params);
      onSuccess(data);
    } catch (exception) {
      if (exception is ApiError) {
        onFailure(exception);
      } else {
        onFailure(ApiError(message: exception.toString()));
      }
    }
  }
}
