import 'package:relative_choice/features/home_feature/providers/activity_provider/activity_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/services/home_service/home_service.dart';
import '../get_matching_peoples_provider/matching_peoples_provider.dart';
import '../like_provider/like_provider.dart';
part 'connection_notifier.g.dart';

@riverpod
class ConnectionNotifier extends _$ConnectionNotifier {
  @override
  FutureOr<String?> build() async {
    return null;
  }

  Future<void> sendConnectionRequest({required int userId}) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final data = await ref
          .watch(homeServiceProvider)
          .sendConnectionRequest(userId: userId);
      ref.invalidate(getLikedUserListProvider);
      ref.invalidate(activityTabDataProvider);
      ref.invalidate(getSuggestedMatchesPeoplesListProvider);
      return data;
    });
  }


  Future<void> cancelSendRequest({required int userId}) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final data = await ref
          .watch(homeServiceProvider)
          .cancelSendRequest(userId: userId);
      ref.invalidate(getLikedUserListProvider);
      ref.invalidate(activityTabDataProvider);
      ref.invalidate(getSuggestedMatchesPeoplesListProvider);
      return data;
    });
  }

  Future<void> acceptConnectionRequest({required int userId}) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final data = await ref
          .watch(homeServiceProvider)
          .acceptConnectionRequest(userId: userId);
      ref.invalidate(getLikedUserListProvider);
      ref.invalidate(activityTabDataProvider);
      ref.invalidate(getSuggestedMatchesPeoplesListProvider);
      return data;
    });
  }

  Future<void> deleteConnectionRequest({required int userId}) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final data = await ref
          .watch(homeServiceProvider)
          .deleteConnectionRequest(userId: userId);
      ref.invalidate(getLikedUserListProvider);
      ref.invalidate(getSuggestedMatchesPeoplesListProvider);
      return data;
    });
  }

  Future<void> removeFromSuggestion({required int userId}) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final data = await ref
          .watch(homeServiceProvider)
          .removeFromSuggestion(userId: userId);
      ref.invalidate(getLikedUserListProvider);
      ref.invalidate(activityTabDataProvider);
      ref.invalidate(getSuggestedMatchesPeoplesListProvider);
      return data;
    });
  }


  Future<void> addToMayBeList({required int userId}) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final data = await ref
          .watch(homeServiceProvider)
          .addToMaybeList(userId: userId);
      ref.invalidate(getLikedUserListProvider);
      ref.invalidate(activityTabDataProvider);
      ref.invalidate(getSuggestedMatchesPeoplesListProvider);
      return data;
    });
  }


}
