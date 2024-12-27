import 'package:mental_healing/data/model/create_post_params.dart';
import 'package:mental_healing/data/model/create_post_result.dart';

abstract class PostRepository {
  Future<CreatePostResult> createPost({required CreatePostParams params});
}
