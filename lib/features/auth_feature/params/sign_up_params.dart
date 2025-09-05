import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_params.freezed.dart';
part 'sign_up_params.g.dart';

@freezed
class SignupParams with _$SignupParams {
  const factory SignupParams({
    @Default('') String firstname,
    @Default('') String lastname,
    @Default('') String username,
    @Default('') String address,
    @JsonKey(name: 'latitude')  @Default(0.0) double latitude,
    @JsonKey(name: 'longitude') @Default(0.0) double longitude,
    @JsonKey(name: 'date_of_birth') @Default('') String dateOfBirth,
  }) = _SignupParams;

  factory SignupParams.fromJson(Map<String, dynamic> json) =>
      _$SignupParamsFromJson(json);
}

@Riverpod(keepAlive: true)
class SignUpParamsData extends _$SignUpParamsData {
  @override
  SignupParams build() {
    return const SignupParams();
  }

  void update(SignupParams Function(SignupParams? p) updateParam) {
    state = updateParam(state);
  }

  void updateLatLng({required double lat, required double lng}) {
    state = state.copyWith(latitude: lat, longitude: lng);
  }

}
