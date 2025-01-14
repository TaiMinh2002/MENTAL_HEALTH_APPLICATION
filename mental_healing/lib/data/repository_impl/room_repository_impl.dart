import 'package:mental_healing/api_manager/rest_client_base.dart';
import 'package:mental_healing/data/model/chat_expert/room_create_params.dart';
import 'package:mental_healing/data/model/chat_expert/room_create_result.dart';
import 'package:mental_healing/data/repository/room_repository.dart';
import 'package:mental_healing/global/app_url.dart';

class RoomRepositoryImpl extends RoomRepository {
  final RestClientBase _client = RestClientBase();

  @override
  Future<RoomCreateResult> createRoom({
    required RoomCreateParams params,
  }) async {
    final response = await _client.post(
      AppUrl.createRoom,
      queryParameters: params.toJson(),
    );
    return RoomCreateResult.fromMap(response);
  }
}
