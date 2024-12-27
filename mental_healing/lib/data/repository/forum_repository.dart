import 'package:mental_healing/data/model/forum_create_params.dart';
import 'package:mental_healing/data/model/forum_detail.dart';
import 'package:mental_healing/data/model/forum_info.dart';
import 'package:mental_healing/data/model/forum_params.dart';

abstract class ForumRepository {
  Future<List<ForumInfo>> getListForums({required ForumParams param});
  Future<ForumDetail> getForumDetail({required int id});
  Future<ForumInfo> createForum({required ForumCreateParams params});
  Future<int> joinForum({required int forumId});
}
