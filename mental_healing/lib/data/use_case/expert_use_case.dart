import 'package:dio/dio.dart';
import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/data/model/expert_detail.dart';
import 'package:mental_healing/data/model/expert_info.dart';
import 'package:mental_healing/data/model/expert_params.dart';
import 'package:mental_healing/data/repository/expert_repository.dart';
import 'package:mental_healing/data/repository_impl/expert_repository_impl.dart';

class ExpertUseCase {
  final ExpertRepository _repository = ExpertRepositoryImpl();
  final CancelToken cancelTokenList = CancelToken();
  final CancelToken cancelTokenDetail = CancelToken();
  Future<void> getListExperts({
    required ExpertParams params,
    required Function(List<ExpertInfo> data) onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      final data = await _repository.getListExperts(
          param: params, cancelToken: cancelTokenList);
      onSuccess(data);
    } catch (e) {
      onFailure(ApiError(message: e.toString()));
    }
  }

  Future<void> getExpertDetail({
    required int id,
    required Function(ExpertDetail) onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      final data = await _repository.getExpertDetail(
          id: id, cancelToken: cancelTokenDetail);
      onSuccess(data);
    } catch (exception) {
      onFailure(exception as ApiError);
    }
  }
}
