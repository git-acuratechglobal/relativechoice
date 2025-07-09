import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relative_choice/features/profile_feature/providers/user_provider.dart';

import '../../../features/home_feature/models/chat_room_model.dart';
import '../../../features/home_feature/models/message_model.dart';
import '../../../features/home_feature/models/user_data_model.dart';
import '../../../features/profile_feature/model/user_model.dart';

final fireStoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final chatServiceProvider = Provider<ChatService>((ref) {
  final fireStore = ref.watch(fireStoreProvider);
  final userId = ref.watch(userProvider)?.user?.id.toString();
  return ChatService(fireStore, userId);
});

class ChatService {
  final FirebaseFirestore _firestore;
  final String? _userId;
  ChatService(this._firestore, this._userId);

  String getChatId(String userB) {
    final ids = [_userId, userB]..sort();
    return ids.join('_');
  }

  Stream<List<MessageModel>> getMessages(String chatId) {
    return firestoreGuardStream(() {
      final chatDocRef = _firestore.collection('chats').doc(chatId);
      final messagesQuery = chatDocRef
          .collection('messages')
          .orderBy('timestamp', descending: false);
      return messagesQuery.snapshots().map((snapshot) => snapshot.docs
          .map((doc) => MessageModel.fromMap(doc.data()))
          .toList());
    });
  }

  Future<void> sendMessage({
    required String chatId,
    required MessageModel message,
    required List<String> participants,
  }) async {
    return firestoreGuard(() async {
      final chatDocRef = _firestore.collection('chats').doc(chatId);

      await chatDocRef.collection('messages').add(message.toMap());

      await chatDocRef.set({
        'lastMessage': message.toMap(),
        'participants': participants,
        'timestamp': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    });
  }

  Future<void> saveUserProfile(User user) async {
    return firestoreGuard(() async {
      final userDocRef = _firestore.collection('users').doc(user.id.toString());
      await userDocRef.set({
        'id': user.id.toString(),
        'name': user.fullName,
        'image': user.image,
        'isOnline': 1,
      });
    });
  }

  Future<void> handleLoginOrSignup(User user) async {
    return firestoreGuard(() async {
      final doc =
          await _firestore.collection('users').doc(user.id.toString()).get();

      if (!doc.exists) {
        await saveUserProfile(user);
      } else {
        print("User profile already exists in Firestore");
      }
    });
  }

  Future<UserDataModel> getUserData(String userId) async {
    return firestoreGuard(() async {
      final doc = await _firestore.collection('users').doc(userId).get();
      if (!doc.exists) throw Exception("User not found");

      final userData = doc.data()!;
      userData['id'] = doc.id;
      return UserDataModel.fromMap(Map<String, dynamic>.from(userData));
    });
  }

  Stream<UserDataModel> getOtherUserData(String userId) {
    return firestoreGuardStream(() {
      return _firestore.collection('users').doc(userId).snapshots().map((doc) {
        if (!doc.exists) {
          throw Exception("User not found");
        }

        final userData = doc.data()!;
        userData['id'] = doc.id;
        return UserDataModel.fromMap(Map<String, dynamic>.from(userData));
      });
    });
  }

  Future<void> markMessagesAsSeen(
    String chatId,
  ) async {
    return firestoreGuard(() async {
      if (_userId == null) throw Exception("userId is missing");
      final chatDocRef = _firestore.collection('chats').doc(chatId);
      final messagesQuery = await chatDocRef
          .collection('messages')
          .where('isSeen', isEqualTo: false)
          .get();

      final unseenFromOther = messagesQuery.docs.where(
        (doc) => doc['senderId'] != _userId,
      );
      for (final doc in unseenFromOther) {
        await doc.reference.update({'isSeen': true});
      }
    });
  }

  Stream<List<ChatRoom>> getChatRoomsForUser() {
    return firestoreGuardStream(() {
      if (_userId == null) throw Exception("userId is missing");

      final chatRoomsQuery = _firestore
          .collection('chats')
          .where('participants', arrayContains: _userId)
          .orderBy('timestamp');

      return chatRoomsQuery.snapshots().handleError((error) {
        // Log error or handle UI fallback
        debugPrint("Firestore query error: $error");
      }).map((snapshot) {
        return snapshot.docs
            .map((doc) => ChatRoom.fromMap(doc.id, doc.data()))
            .toList();
      });
    });
  }

  Future<void> updateUserStatus({required int isOnline}) {
    return firestoreGuard(() async {
      if (_userId == null) throw Exception("userId is missing");
      final userDocRef = _firestore.collection('users').doc(_userId);

      switch (isOnline) {
        case 1:
          await userDocRef.update({'isOnline': isOnline});
        case 0:
          await userDocRef.update({
            'isOnline': isOnline,
            'lastSeen': DateTime.now(),
          });
      }
    });
  }

  Future<void> updateUserTypingStatus({String? receiverId}) {
    return firestoreGuard(() async {
      if (_userId == null) throw Exception("userId is missing");
      final userDocRef = _firestore.collection('users').doc(_userId);

      await userDocRef.update({'typingTo': receiverId});
    });
  }

  Future<T> firestoreGuard<T>(
    Future<T> Function() call,
  ) async {
    try {
      return await call();
    } on FirebaseException catch (e) {
      throw "Firestore Error: ${e.message}";
    } on FormatException catch (e) {
      throw "Invalid data format from Firestore. Reason: ${e.message}";
    } catch (e) {
      rethrow;
    }
  }

  Stream<T> firestoreGuardStream<T>(Stream<T> Function() call) async* {
    try {
      yield* call();
    } on FirebaseException catch (e) {
      throw "Firestore Stream Error: ${e.message}";
    } on FormatException catch (e) {
      throw "Invalid data format from Firestore Stream. Reason: ${e.message}";
    } catch (e) {
      rethrow;
    }
  }
}
