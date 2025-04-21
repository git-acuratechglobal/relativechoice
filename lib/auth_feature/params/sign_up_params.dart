import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_params.freezed.dart';
part 'sign_up_params.g.dart';

@freezed
class SignupParams with _$SignupParams {

const factory SignupParams({
  @Default('') String firstname,
  @Default('') String lastname,
  @Default('') String email,
  @Default('') String username,
  @Default('') String password,
  @Default('') String betaCode,
  @Default('') String address,
  @JsonKey(name: 'date_of_birth') @Default('') String dateOfBirth,
}) = _SignupParams;

  factory SignupParams.fromJson(Map<String, dynamic> json) => _$SignupParamsFromJson(json);
}



@riverpod
class SignUpParamsData extends _$SignUpParamsData {
  @override
 SignupParams  build() {
    return  SignupParams();
  }


  void update(SignupParams Function (SignupParams? p) updateParam){
state = updateParam(state);
  }
}