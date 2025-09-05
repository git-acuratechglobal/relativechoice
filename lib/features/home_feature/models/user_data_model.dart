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
  String? get formatLastSeen {
    if (lastSeen == null) return "";

    final now = DateTime.now();
    final difference = now.difference(lastSeen!);
    final lastSeenDate = DateTime(lastSeen!.year, lastSeen!.month, lastSeen!.day);
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    if (lastSeenDate == today) {
      return 'Today at ${DateFormat('h:mm a').format(lastSeen!)}';
    } else if (lastSeenDate == yesterday) {
      return 'Yesterday at ${DateFormat('h:mm a').format(lastSeen!)}';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return DateFormat('MMM d, yyyy').format(lastSeen!); // fallback to full date
    }
  }
}


