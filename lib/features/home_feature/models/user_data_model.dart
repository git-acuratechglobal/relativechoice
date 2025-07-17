import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class UserDataModel {
  final String id;
  final String name;
  final String image;
  final int isOnline;
  final DateTime? lastSeen;
  final String? typingTo;
  final Map<String,bool> blockedUsers;
  UserDataModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isOnline,
    this.lastSeen,
    this.typingTo,
    required this.blockedUsers
  });

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      id: map['id'].toString(),
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      isOnline: map['isOnline'] ?? 0,
      lastSeen: map['lastSeen'] != null
          ? (map['lastSeen'] as Timestamp).toDate()
          : null,
      typingTo: map['typingTo'] ?? null,
      blockedUsers: Map<String, bool>.from(map['blockedUsers'] ?? {}),
    );
  }
  String? get formateLastSeen {
    if (lastSeen == null) return "";
    return DateFormat('h:mm a').format(lastSeen!);
  }
}


