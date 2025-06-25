import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relative_choice/core/services/home_service/home_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../models/like_tab_state.dart';
part 'like_provider.g.dart';

@riverpod
Future<LikeTabState?> getLikedUserList(Ref ref) async {
  final likedByMeData= await ref.watch(homeServiceProvider).getLikedByMeUsersList();
  final likedMeData= await ref.watch(homeServiceProvider).getLikedMeUsersList();
  final mayBeList= await ref.watch(homeServiceProvider).getMayBeList();
  return LikeTabState(likedByMeTabList: likedByMeData, likedMeTabList: likedMeData,mayBeTabList: mayBeList);
}
