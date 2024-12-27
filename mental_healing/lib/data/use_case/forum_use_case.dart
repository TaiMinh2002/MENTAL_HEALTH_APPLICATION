import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/data/model/forum_create_params.dart';
import 'package:mental_healing/data/model/forum_detail.dart';
import 'package:mental_healing/data/model/forum_info.dart';
import 'package:mental_healing/data/model/forum_params.dart';
import 'package:mental_healing/data/repository/forum_repository.dart';
import 'package:mental_healing/data/repository_impl/forum_repository_impl.dart';

class ForumUseCase {
  final ForumRepository _repository = ForumRepositoryImpl();
  Future<void> getListExperts({
    required ForumParams params,
    required Function(List<ForumInfo> data) onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      final data = await _repository.getListForums(param: params);
      onSuccess(data);
    } catch (e) {
      onFailure(ApiError(message: e.toString()));
    }
  }

  Future<void> getForumDetail({
    required int id,
    required Function(ForumDetail) onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      final data = await _repository.getForumDetail(id: id);
      onSuccess(data);
    } catch (exception) {
      if (exception is ApiError) {
        onFailure(exception);
      } else {
        onFailure(ApiError(message: exception.toString()));
      }
    }
  }

  Future<void> createForum({
    required ForumCreateParams param,
    required Function(ForumInfo data) onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      final data = await _repository.createForum(params: param);
      onSuccess(data);
    } catch (exception) {
      if (exception is ApiError) {
        onFailure(exception);
      } else {
        onFailure(ApiError(message: exception.toString()));
      }
    }
  }

  Future<void> joinForum({
    required int forumId,
    required Function(int data) onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      final data = await _repository.joinForum(forumId: forumId);
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
