import 'package:dio/dio.dart';
import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/data/model/exercise/expert_detail.dart';
import 'package:mental_healing/data/model/expert/expert_params.dart';
import 'package:mental_healing/data/model/expert/experts.dart';
import 'package:mental_healing/data/repository/expert_repository.dart';
import 'package:mental_healing/data/repository_impl/expert_repository_impl.dart';

class ExpertUseCase {
  final ExpertRepository _repository = ExpertRepositoryImpl();
  final CancelToken cancelTokenList = CancelToken();
  final CancelToken cancelTokenDetail = CancelToken();
  // Future<void> getListExperts({
  //   required ExpertParams params,
  //   required Function(List<ExpertInfo> data) onSuccess,
  //   required Function(ApiError err) onFailure,
  // }) async {
  //   try {
  //     final data = await _repository.getListExperts(
  //         param: params, cancelToken: cancelTokenList);
  //     onSuccess(data);
  //   } catch (e) {
  //     onFailure(ApiError(message: e.toString()));
  //   }
  // }

  Future<void> getListExperts({
    required ExpertParams params,
    required Function(Experts data) onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      final data = await _repository.getListExperts(param: params);
      onSuccess(data);
    } catch (exception) {
      onFailure(ApiError(message: exception.toString()));
    }
  }

  Future<void> getExpertDetail({
    required int id,
    required Function(ExpertDetail data) onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      final data = await _repository.getExpertDetail(id: id);
      onSuccess(data);
    } catch (exception) {
      onFailure(exception as ApiError);
    }
  }
}
