import 'package:relative_choice/core/services/auth_service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'betacode_provider.g.dart';

@riverpod
class BetaCode extends _$BetaCode {
  @override
  FutureOr<String?> build() {
    return null;
  }

  Future<void> sendBetaCode({required String betaCode}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return ref.watch(authServiceProvider).sendBetaCode(betaCode: betaCode);
    });
  }
}
