import 'package:mental_healing/data/model/forums/forum_create_params.dart';
import 'package:mental_healing/data/model/forums/forum_detail.dart';
import 'package:mental_healing/data/model/forums/forum_info.dart';
import 'package:mental_healing/data/model/forums/forum_params.dart';
import 'package:mental_healing/data/model/forums/forums.dart';

abstract class ForumRepository {
  Future<Forums> getListForums({required ForumParams param});
  Future<ForumDetail> getForumDetail({required int id});
  Future<ForumInfo> createForum({required ForumCreateParams params});
  Future<int> joinForum({required int forumId});
}
