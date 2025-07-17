import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../core/services/chat_service/chat_service.dart';
import '../../models/blocking_status.dart';
import '../../models/chat_room_model.dart';
import '../../models/message_model.dart';
import '../../models/send_message_params.dart';
import '../../models/user_data_model.dart';
part 'chat_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<List<ChatRoom>> chatRooms(Ref ref) {
  return ref.watch(chatServiceProvider).getChatRoomsForUser();
}

@Riverpod(keepAlive: true)
Stream<List<MessageModel>> messageList(Ref ref, chatId) {
  return ref.watch(chatServiceProvider).getMessages(chatId);
}

@Riverpod(keepAlive: true)
Stream<ChatRoomState> chatRoomData(Ref ref, otherUserId) {
  final chatService = ref.watch(chatServiceProvider);
  final otherUserStream = chatService.getOtherUserData(otherUserId);
  final blockStatusStream = chatService.getBlockingStatus(otherUserId);

  return Rx.combineLatest2<UserDataModel, BlockingStatus, ChatRoomState>(
    otherUserStream,
    blockStatusStream,
    (otherUser, isBlocked) => ChatRoomState(
      otherUserModel: otherUser,
      blockingStatus: isBlocked,
    ),
  );
}

@riverpod
class ChatNotifier extends _$ChatNotifier {
  @override
  FutureOr<void> build() async {
    return null;
  }

  Future<void> sendMessage({required SendMessageParams param}) async {
    state = const AsyncLoading();
    final message = MessageModel.createText(
      senderId: param.senderId,
      text: param.text,
    );
    try {
      final result = await ref.read(chatServiceProvider).sendMessage(
            chatId: param.chatId,
            message: message,
            participants: param.participants,
          );
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateUserStatus({required int isOnline}) async {
    state = const AsyncLoading();
    try {
      final result = await ref
          .read(chatServiceProvider)
          .updateUserStatus(isOnline: isOnline);
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateUserTypingStatus({String? receiverId}) async {
    state = const AsyncLoading();
    try {
      final result = await ref
          .read(chatServiceProvider)
          .updateUserTypingStatus(receiverId: receiverId);
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> blockUser(String userId) async {
    state = const AsyncLoading();
    try {
      final result = await ref.read(chatServiceProvider).blockUser(userId);
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> unblockUser(String userId) async {
    state = const AsyncLoading();
    try {
      final result = await ref.read(chatServiceProvider).unblockUser(userId);
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

@riverpod
Future<UserDataModel> getUserModelData(Ref ref,
    {required String userId}) async {
  try {
    final chatService = ref.watch(chatServiceProvider);
    final userData = await chatService.getUserData(userId);
    return userData;
  } catch (e) {
    throw Exception(e);
  }
}
