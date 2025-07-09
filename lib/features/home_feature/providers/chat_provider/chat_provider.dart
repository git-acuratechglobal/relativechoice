import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/services/chat_service/chat_service.dart';
import '../../models/chat_room_model.dart';
import '../../models/message_model.dart';
import '../../models/send_message_params.dart';
import '../../models/user_data_model.dart';
part 'chat_provider.g.dart';

final chatRoomsProvider = StreamProvider<List<ChatRoom>>((ref) {
  return ref.watch(chatServiceProvider).getChatRoomsForUser();
});

final messageListProvider =
    StreamProvider.family<List<MessageModel>, String>((ref, chatId) {
  return ref.watch(chatServiceProvider).getMessages(chatId);
});

final otherUserProvider =StreamProvider.family<UserDataModel,String>((ref,otherUserId) {
  return ref.watch(chatServiceProvider).getOtherUserData(otherUserId);
});

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
      updateUserTypingStatus(receiverId: null);
      final result = ref.read(chatServiceProvider).sendMessage(
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
      final result =
          ref.read(chatServiceProvider).updateUserStatus(isOnline: isOnline);
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateUserTypingStatus({String? receiverId}) async {
    state = const AsyncLoading();
    try {
      final result = ref
          .read(chatServiceProvider)
          .updateUserTypingStatus(receiverId: receiverId);
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
