import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../features/home_feature/models/nessage_model.dart';

class FirebaseChatService {
  FirebaseChatService._privateConstructor();
  static final FirebaseChatService _instance = FirebaseChatService._privateConstructor();
  static FirebaseChatService get instance => _instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String getChatId(String userA, String userB) {
    final ids = [userA, userB]..sort();
    return ids.join('_');
  }

  Stream<List<MessageModel>> getMessages(String chatId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => MessageModel.fromMap(doc.data()))
        .toList());
  }

  Future<void> sendMessage({
    required String chatId,
    required MessageModel message,
  }) async {
    await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add(message.toMap());

    // Optional: Save last message at chat root
    await _firestore.collection('chats').doc(chatId).set({
      'lastMessage': message.toMap(),
    }, SetOptions(merge: true));
  }
}
