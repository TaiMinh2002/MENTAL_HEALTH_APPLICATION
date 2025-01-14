import 'package:mental_healing/data/model/exercise/expert_detail.dart';
import 'package:mental_healing/data/model/expert/expert_params.dart';
import 'package:mental_healing/data/model/expert/experts.dart';

abstract class ExpertRepository {
  Future<Experts> getListExperts({required ExpertParams param});
  Future<ExpertDetail> getExpertDetail({required int id});
}
