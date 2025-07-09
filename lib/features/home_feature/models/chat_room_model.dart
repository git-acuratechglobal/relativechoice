import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'message_model.dart';

class ChatRoom {
  final String id;
  final List<String> participants;
  final MessageModel? lastMessage;
  final DateTime? timestamp;

  ChatRoom({
    required this.id,
    required this.participants,
    this.lastMessage,
    this.timestamp,
  });

  factory ChatRoom.fromMap(String id, Map<String, dynamic> map) {
    return ChatRoom(
      id: id,
      participants: List<String>.from(map['participants'] ?? []),
      lastMessage: map['lastMessage'] != null
          ? MessageModel.fromLastMessage(map['lastMessage'])
          : null,
      timestamp: (map['timestamp'] as Timestamp?)?.toDate(),
    );
  }
  String get formattedTime {
    if(timestamp==null)return "";
    return DateFormat('h:mm a').format(timestamp!);
  }
}
