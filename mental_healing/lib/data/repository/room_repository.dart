import 'package:mental_healing/data/model/chat_expert/room_create_params.dart';
import 'package:mental_healing/data/model/chat_expert/room_create_result.dart';

abstract class RoomRepository {
  Future<RoomCreateResult> createRoom({required RoomCreateParams params});
}
