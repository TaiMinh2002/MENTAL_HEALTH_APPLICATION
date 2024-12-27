import 'package:dio/dio.dart';
import 'package:mental_healing/api_manager/rest_client_base.dart';
import 'package:mental_healing/data/model/expert_detail.dart';
import 'package:mental_healing/data/model/expert_info.dart';
import 'package:mental_healing/data/model/expert_params.dart';
import 'package:mental_healing/data/repository/expert_repository.dart';
import 'package:mental_healing/global/app_url.dart';

class ExpertRepositoryImpl extends ExpertRepository {
  final RestClientBase _client = RestClientBase();

  @override
  @override
  Future<List<ExpertInfo>> getListExperts({
    required ExpertParams param,
    required CancelToken cancelToken,
  }) async {
    final response = await _client.get(
      AppUrl.listExpert,
      queryParameters: param.toParamsJson(),
      cancelToken: cancelToken,
    );
    final List<dynamic> data = response['experts'];
    return data.map((json) => ExpertInfo.fromJson(json)).toList();
  }

  @override
  Future<ExpertDetail> getExpertDetail(
      {required int id, required CancelToken cancelToken}) async {
    final response = await _client.get('${AppUrl.listExpert}/$id/detail',
        cancelToken: cancelToken);
    return ExpertDetail.fromJson(response);
  }
}
