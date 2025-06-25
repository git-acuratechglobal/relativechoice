import 'package:freezed_annotation/freezed_annotation.dart';

part "auth_state.freezed.dart";

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required AuthEvent authEvent,
    String? response,
    double?formProgress,
  }) = _AuthState;
}

enum AuthEvent {
  login,
  otpSent,
  otpVerified,
  register,
  personalInformation,
  updateFamilyStructure,
  additionalInformation,
  educationLevel,
  accountHolderFaith,
  partnerFaith,
  accountHolderRaceAndEthnicity,
  partnerRaceAndEthnicity,
  accountHolderPolitics,
  partnerPolitics,
  personalLifeStyle,
  pets,
  roleSought,
  roleToFulfill,
  involvement,
  distance,
  faithPreferences,
  raceAndEthnicity,
  politicalPreferences,
  lifeStylePreferences
}
