import 'package:relative_choice/core/services/auth_service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'profile_steps_provider.g.dart';

@riverpod
class UpdateProfileSteps extends _$UpdateProfileSteps {
  @override
  FutureOr<String?> build() async {
    return null;
  }

  Future<void> updateProfileSteps({ String ?steps}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() {
      return ref.watch(authServiceProvider).updateProfileSteps(steps: steps);
    });
  }



}
