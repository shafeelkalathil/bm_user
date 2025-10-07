class ChatModel {
  final String userName;
  final String lastSeen;
  final String message;

  //<editor-fold desc="Data Methods">
  const ChatModel({
    required this.userName,
    required this.lastSeen,
    required this.message,
  });

  ChatModel copyWith({
    String? userName,
    String? lastSeen,
    String? message,
  }) {
    return ChatModel(
      userName: userName ?? this.userName,
      lastSeen: lastSeen ?? this.lastSeen,
      message: message ?? this.message,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'userName': this.userName,
      'lastSeen': this.lastSeen,
      'message': this.message,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      userName: map['userName'] as String,
      lastSeen: map['lastSeen'] as String,
      message: map['message'] as String,
    );
  }
}