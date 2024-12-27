import 'package:mental_healing/api_manager/api_error.dart';
import 'package:mental_healing/data/model/room_create_params.dart';
import 'package:mental_healing/data/model/room_create_result.dart';
import 'package:mental_healing/data/repository/room_repository.dart';
import 'package:mental_healing/data/repository_impl/room_repository_impl.dart';

class RoomUseCase {
  final RoomRepository _repository = RoomRepositoryImpl();
  Future<void> createRoom({
    required RoomCreateParams params,
    required Function(RoomCreateResult data) onSuccess,
    required Function(ApiError err) onFailure,
  }) async {
    try {
      final data = await _repository.createRoom(params: params);
      onSuccess(data);
    } catch (exception) {
      if (exception is ApiError) {
        onFailure(exception); // Lỗi API
      } else {
        onFailure(ApiError(message: exception.toString())); // Các lỗi khác
      }
    }
  }
}
