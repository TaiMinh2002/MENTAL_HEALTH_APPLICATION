class MessageModel {
  final int senderId;
  final String message;
  final bool isMine;

  MessageModel(
      {required this.senderId, required this.message, required this.isMine});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      senderId: json['sender_id'],
      message: json['message'],
      isMine: false,
    );
  }
}
