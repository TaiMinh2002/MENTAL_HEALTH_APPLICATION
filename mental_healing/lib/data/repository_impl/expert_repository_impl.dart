import 'package:mental_healing/api_manager/rest_client_base.dart';
import 'package:mental_healing/data/model/exercise/expert_detail.dart';
import 'package:mental_healing/data/model/expert/expert_params.dart';
import 'package:mental_healing/data/model/expert/experts.dart';
import 'package:mental_healing/data/repository/expert_repository.dart';
import 'package:mental_healing/global/app_url.dart';

class ExpertRepositoryImpl extends ExpertRepository {
  final RestClientBase _client = RestClientBase();

  @override
  Future<Experts> getListExperts({required ExpertParams param}) async {
    final response = await _client.get(
      AppUrl.listExpert,
      queryParameters: param.toJson(),
    );
    return Experts.fromJson(response['experts']);
  }

  @override
  Future<ExpertDetail> getExpertDetail({required int id}) async {
    final response = await _client.get('${AppUrl.listExpert}/$id/detail');
    return ExpertDetail.fromJson(response['expert']);
  }
}
