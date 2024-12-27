import 'package:dio/dio.dart';
import 'package:mental_healing/data/model/expert_detail.dart';
import 'package:mental_healing/data/model/expert_info.dart';
import 'package:mental_healing/data/model/expert_params.dart';

abstract class ExpertRepository {
  Future<List<ExpertInfo>> getListExperts(
      {required ExpertParams param, required CancelToken cancelToken});
  Future<ExpertDetail> getExpertDetail(
      {required int id, required CancelToken cancelToken});
}
