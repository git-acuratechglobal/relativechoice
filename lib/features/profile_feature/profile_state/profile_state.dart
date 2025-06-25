import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relative_choice/features/profile_feature/model/user_model.dart';
part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required ProfileEvent profileEvent,
    String? response,
    UserModel? userModel,
  }) = _ProfileState;
}

enum ProfileEvent{
  updateProfilePic,
  addShowcaseImages,
  addPrompt
}