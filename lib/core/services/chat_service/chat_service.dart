import 'dart:async';

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

  static const int _messagesPageSize = 50;

  ChatService(this._firestore, this._userId) {
    _enableOfflineSupport();
  }
  void _enableOfflineSupport() {
    try {
      _firestore.settings = const Settings(
        persistenceEnabled: true,
        cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
      );
    } catch (e) {
      debugPrint('Firestore settings already configured: $e');
    }
  }

  String getChatId(String userB) {
    final ids = [_userId, userB]..sort();
    return ids.join('_');
  }

  Stream<List<MessageModel>> getMessages(
    String chatId, {
    int limit = _messagesPageSize,
  }) {
    return firestoreGuardStream(() {
      final chatDocRef = _firestore.collection('chats').doc(chatId);
      final messagesQuery = chatDocRef
          .collection('messages')
          .orderBy('timestamp', descending: false);
      return messagesQuery.snapshots().map((snapshot) => snapshot.docs
          .map((doc) => MessageModel.fromMap(doc.data()))
          .toList()
          .reversed
          .toList());
    });
  }

  Future<void> sendMessage({
    required String chatId,
    required MessageModel message,
    required List<String> participants,
  }) async {
    return firestoreGuard(() async {
      final batch = _firestore.batch();
      final chatDocRef = _firestore.collection('chats').doc(chatId);
      final messageRef = chatDocRef.collection('messages').doc();

      // Add message with generated ID
      final messageData = message.toMap();
      messageData['id'] = messageRef.id;
      batch.set(messageRef, messageData);

      // Update chat room with last message and metadata
      final chatData = {
        'lastMessage': messageData,
        'participants': participants,
        'timestamp': FieldValue.serverTimestamp(),
      };

      batch.set(chatDocRef, chatData, SetOptions(merge: true));

      await batch.commit();
      await updateUserTypingStatus();
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
      final batch = _firestore.batch();

      final chatDocRef = _firestore.collection('chats').doc(chatId);
      final messagesQuery = await chatDocRef
          .collection('messages')
          .where('isSeen', isEqualTo: false)
          .get();

      final unseenFromOther = messagesQuery.docs.where(
        (doc) => doc['senderId'] != _userId,
      );
      for (final doc in unseenFromOther) {
        batch.update(doc.reference, {
          'isSeen': true,
          'seenAt': FieldValue.serverTimestamp(),
        });
      }
      if (unseenFromOther.isNotEmpty) {
        final chatDoc = await chatDocRef.get();
        final lastMessage = chatDoc.data()?['lastMessage'];

        if (lastMessage != null && lastMessage['senderId'] != _userId) {
          batch.update(chatDocRef, {
            'lastMessage.isSeen': true,
            'lastUpdated': FieldValue.serverTimestamp(),
          });
        }
      }
      await batch.commit();
    });
  }

  Stream<List<ChatRoom>> getChatRoomsForUser() {
    return firestoreGuardStream(() {
      if (_userId == null) throw Exception("userId is missing");

      final chatRoomsQuery = _firestore
          .collection('chats')
          .where('participants', arrayContains: _userId);

      return chatRoomsQuery.snapshots().handleError((error) {
        debugPrint("Firestore query error: $error");
      }).map((snapshot) {
        final chatRooms = snapshot.docs
            .map((doc) {
              try {
                return ChatRoom.fromMap(doc.id, doc.data());
              } catch (e) {
                debugPrint("Error parsing ChatRoom from doc ${doc.id}: $e");
                return null;
              }
            })
            .where((room) => room != null)
            .cast<ChatRoom>()
            .toList();

        chatRooms.sort((a, b) {
          if (a.timestamp == null && b.timestamp == null) return 0;
          if (a.timestamp == null) return 1;
          if (b.timestamp == null) return -1;
          return b.timestamp!.compareTo(a.timestamp!);
        });

        return chatRooms;
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
            'lastSeen': FieldValue.serverTimestamp(),
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
      // Log the error for debugging
      debugPrint("Firestore Stream Error: ${e.code} - ${e.message}");
      throw "Firestore Stream Error: ${e.message}";
    } on FormatException catch (e) {
      debugPrint("Invalid data format from Firestore Stream: ${e.message}");
      throw "Invalid data format from Firestore Stream. Reason: ${e.message}";
    } catch (e, stackTrace) {
      // Log unexpected errors with stack trace
      debugPrint("Unexpected Firestore Stream error: $e");
      debugPrint("Stack trace: $stackTrace");
      rethrow;
    }
  }
}
