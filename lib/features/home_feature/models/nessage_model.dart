class MessageModel {
  final String senderId;
  final String text;
  final String timestamp;

  MessageModel({
    required this.senderId,
    required this.text,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() => {
    'senderId': senderId,
    'text': text,
    'timestamp': timestamp,
  };

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      senderId: map['senderId'],
      text: map['text'],
      timestamp: map['timestamp'] ,
    );
  }
}
