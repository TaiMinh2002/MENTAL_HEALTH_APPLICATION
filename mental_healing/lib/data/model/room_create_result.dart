class RoomCreateResult {
  RoomCreateResult({this.id, this.expertId, this.userId});

  factory RoomCreateResult.fromMap(Map<String, dynamic> map) {
    return RoomCreateResult(
      id: map['chat_id'] != null ? map['chat_id'] as int : null,
      expertId: map['expert_id'] != null ? map['expert_id'] as int : null,
      userId: map['user_id'] != null ? map['user_id'] as int : null,
    );
  }
  int? id;
  int? expertId;
  int? userId;
}
