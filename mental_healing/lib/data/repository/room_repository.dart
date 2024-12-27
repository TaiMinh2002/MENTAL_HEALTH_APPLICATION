import 'package:mental_healing/data/model/room_create_params.dart';
import 'package:mental_healing/data/model/room_create_result.dart';

abstract class RoomRepository {
  Future<RoomCreateResult> createRoom({required RoomCreateParams params});
}
