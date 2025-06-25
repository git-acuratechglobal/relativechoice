import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relative_choice/core/services/profile_service/profile_service.dart';
import 'package:relative_choice/features/profile_feature/model/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_provider.g.dart';




final userProvider = StateProvider<UserModel?>((ref) => null);


@riverpod
Future<UserModel> getUserProfile(Ref ref) async {
  final user= await ref.watch(profileServiceProvider).getUserProfile();
  ref.read(userProvider.notifier).update((e)=>user);
  return user;
}

@riverpod
Future<UserModel> getMatchedUserProfile(Ref ref,{required int userId}) async {
  final user= await ref.watch(profileServiceProvider).getMatchedUserProfile(userId: userId);
  return user;
}
