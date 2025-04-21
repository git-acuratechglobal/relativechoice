import 'package:relative_choice/auth_feature/auth_state/auth_state.dart';
import 'package:relative_choice/auth_feature/params/sign_up_params.dart';
import 'package:relative_choice/core/services/auth_service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'authprovider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  String? _otp;
  @override
  FutureOr<AuthState?> build() {
    return null;
  }

  Future<void> sendOtp() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final email = ref.watch(signUpParamsDataProvider);
      await ref
          .watch(authServiceProvider)
          .isEmailExist(emailAddress: email.email);
      await ref.watch(authServiceProvider).sendOtp(email: email.email);
      return AuthState(authEvent: AuthEvent.sendOtp);
    });
  }


  Future<void> matchOtp() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final email = ref.watch(signUpParamsDataProvider);
      final response = await ref     
          .watch(authServiceProvider)
          .matchOtp(email: email.email, otp: _otp!);
      return AuthState(authEvent: AuthEvent.otpVerified, response: response);
    });
  }

Future<void> register() async{
  state = const AsyncLoading();
  state = await AsyncValue.guard(() async{
    final params = ref.watch(signUpParamsDataProvider);
   final response = await ref.watch(authServiceProvider).register(params: params);
   return AuthState(authEvent: AuthEvent.register, response: response);
  });
}

  void updateOtp(String otp) {
    _otp = otp;
  }
}
