import 'package:image_picker/image_picker.dart';
import 'package:relative_choice/core/services/profile_service/profile_service.dart';
import 'package:relative_choice/features/profile_feature/profile_state/profile_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/chat_service/chat_service.dart';
part 'profile_onboarding_provider.g.dart';

@riverpod
class ProfileOnBoarding extends _$ProfileOnBoarding {
  XFile? _profilePic;

  @override
  FutureOr<ProfileState?> build() async {
    return null;
  }

  Future<void> updateProfileImage() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref
          .watch(profileServiceProvider)
          .updateProfilePic(profilePic: _profilePic);
      return ProfileState(
          profileEvent: ProfileEvent.updateProfilePic, response: response);
    });
  }

  Future<void> addShowcaseImages(List<Map<String, dynamic>> imageData) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref
          .watch(profileServiceProvider)
          .addShowcaseImages(imageData: imageData);
      final user = await ref.watch(profileServiceProvider).getUserProfile();

      return ProfileState(
          profileEvent: ProfileEvent.addShowcaseImages,
          response: response,
          userModel: user);
    });
  }

  Future<void> updatePrompt(List<String> prompts) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      for (var prompt in prompts) {
        ref.read(profileServiceProvider).updatePrompt(prompt: prompt);
      }
      final user = await ref.watch(profileServiceProvider).getUserProfile();
      await ref.read(chatServiceProvider).saveUserProfile(user.user!);
      return ProfileState(
          profileEvent: ProfileEvent.addPrompt,
          response: "success",
          userModel: user);
    });
  }

  void updateProfilePic(XFile pic) async {
    _profilePic = pic;
  }
}
