import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class MessageModel {
  final String id;
  final String senderId;
  final String text;
  final DateTime timestamp;
  final String type;
  final bool isSeen;
  MessageModel({
    required this.id,
    required this.senderId,
    required this.text,
    required this.timestamp,
    this.type = 'text',
     this.isSeen=false
  });

  factory MessageModel.fromMap(Map<String, dynamic> map, [String? docId]) {
    return MessageModel(
      id: docId ?? '',
      senderId: map['senderId'] ?? '',
      text: map['text'] ?? '',
      timestamp: (map['timestamp'] as Timestamp).toDate(),
      type: map['type'] ?? 'text',
      isSeen: map['isSeen'] ?? false,
    );
  }
  factory MessageModel.createText({
    required String senderId,
    required String text,
  }) {
    return MessageModel(
      id: '',
      senderId: senderId,
      text: text,
      timestamp: DateTime.now(),
      type: 'text',
      isSeen: false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'text': text,
      'timestamp': timestamp,
      'type': type,
      'isSeen': isSeen,
    };
  }
  String get formattedTime {
    return DateFormat('h:mm a').format(timestamp);
  }
}
