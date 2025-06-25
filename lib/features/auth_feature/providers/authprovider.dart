import 'package:relative_choice/core/services/auth_service/auth_service.dart';
import 'package:relative_choice/core/services/local_storage_service/local_storage_service.dart';
import 'package:relative_choice/core/services/zipcode_service/zipcode_service.dart';
import 'package:relative_choice/features/auth_feature/params/family_structure_params.dart';
import 'package:relative_choice/features/profile_feature/providers/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/services/profile_service/profile_service.dart';
import '../../profile_feature/model/user_model.dart';
import '../auth_state/auth_state.dart';
import '../pages/signup_onboarding_pages/family_structure.dart';
import '../params/sign_up_params.dart';
part 'authprovider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  String? _otp;
  int? _partnerAge;
  String? _accountHolderRaceAndEthnicity;
  String? _partnerRaceAndEthnicity;
  String? _childrenRaceAndEthnicity;
  String? _accountHolderPolitics;
  String? _partnerPolitics;
  String? _roleSought;
  String? _rolesToFulFill;
  Map<String, dynamic> _loginParam = {};
  Map<String, dynamic> _signUpParam = {};
  Map<String, dynamic> _distanceParam = {};
  Map<String, dynamic> _childrenParam = {};
  Map<String, dynamic> _educationParam = {};
  Map<String, dynamic> _accountHolderFaithParam = {};
  Map<String, dynamic> _partnerFaithParam = {};
  Map<String, dynamic> _personalLifeStyleParam = {};
  Map<String, dynamic> _petParam = {};
  Map<String, dynamic> _involvementParam = {};
  Map<String, dynamic> _faithPreferenceParam = {};
  Map<String, dynamic> _raceAndEthnicityParam = {};
  Map<String, dynamic> _politicalPreferenceParam = {};
  Map<String, dynamic> _lifestylePreferenceParam = {};

  @override
  FutureOr<AuthState?> build() {
    return null;
  }

  Future<void> loginUser() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      UserModel? userModel;
      final response = await ref.watch(authServiceProvider).loginUser(
          email: _loginParam['email'], password: _loginParam['password']);
      ref.invalidate(localStorageServiceProvider);
      final isSignupPending =
          await ref.watch(authServiceProvider).getProfileSteps();
      if (isSignupPending == null) {
        ref.invalidate(getUserProfileProvider);
      } else {
        userModel = await ref
            .watch(profileServiceProvider)
            .getUserProfileForUserTypeCheck();
        ref
            .read(userTypeProvider.notifier)
            .update((_) => userModel?.userOnboarding?.familyStructure ?? "");
        ref.read(localStorageServiceProvider).setUserType(
            userType: userModel.userOnboarding?.familyStructure ?? "");
      }
      return AuthState(
        authEvent: AuthEvent.login,
        response: response,
        formProgress: isSignupPending,
      );
    });
  }

  Future<void> sendOtp() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref
          .watch(authServiceProvider)
          .isEmailExist(emailAddress: _signUpParam['email']);
      await ref
          .watch(authServiceProvider)
          .sendOtp(email: _signUpParam['email']);
      return AuthState(authEvent: AuthEvent.otpSent);
    });
  }

  Future<void> matchOtp() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref
          .watch(authServiceProvider)
          .matchOtp(email: _signUpParam['email'], otp: _otp!);
      return AuthState(authEvent: AuthEvent.otpVerified, response: response);
    });
  }

  Future<void> register() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref
          .watch(authServiceProvider)
          .register(signUpParam: _signUpParam);
      ref.invalidate(localStorageServiceProvider);
      return AuthState(authEvent: AuthEvent.register, response: response);
    });
  }

  Future<void> updatePersonalInformation() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final params = ref.read(signUpParamsDataProvider);
      final latLng = await ref
          .read(zipCodeServiceProvider)
          .getLatLngFromZipcode(zipcode: params.address);
      ref
          .read(signUpParamsDataProvider.notifier)
          .updateLatLng(lat: latLng.lat, lng: latLng.lng);

      final updatedParams = ref.read(signUpParamsDataProvider);
      final response = await ref
          .watch(authServiceProvider)
          .addPersonalInformation(params: updatedParams);
      // ref.invalidate(localStorageServiceProvider);
      return AuthState(
          authEvent: AuthEvent.personalInformation, response: response);
    });
  }

  Future<void> updateFamilyStructure() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final familyStructure = ref.watch(familyStructureParamsProvider);

      final response = await ref
          .watch(authServiceProvider)
          .updateFamilyStructure(familyStructure);
      return AuthState(
          authEvent: AuthEvent.updateFamilyStructure, response: response);
    });
  }

  Future<void> updatePartnerAge() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref
          .watch(authServiceProvider)
          .updatePartnerAge(age: _partnerAge ?? 0);
      return AuthState(
          authEvent: AuthEvent.additionalInformation, response: response);
    });
  }

  Future<void> updateChildrenAge() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref.watch(authServiceProvider).updateChildrenAge(
          children: _childrenParam['children'], range: _childrenParam['range']);
      return AuthState(
          authEvent: AuthEvent.additionalInformation, response: response);
    });
  }

  Future<void> updateEducationLevel() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref
          .watch(authServiceProvider)
          .updateEducationLevel(
              accountHolderEduction: _educationParam["account_holder_eduction"],
              partnerEducation: _educationParam["partner_eduction"]);
      return AuthState(authEvent: AuthEvent.educationLevel, response: response);
    });
  }

  Future<void> updateAccountHolderFaith() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref
          .watch(authServiceProvider)
          .updateAccountHolderFaith(
              faithOptions: _accountHolderFaithParam['faith_options'],
              devoutnessScale: _accountHolderFaithParam['devoutness_scale']);
      return AuthState(
          authEvent: AuthEvent.accountHolderFaith, response: response);
    });
  }

  Future<void> updatePartnerFaith() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref.watch(authServiceProvider).updatePartnerFaith(
          faithOptions: _partnerFaithParam['faith_options'],
          devoutnessScale: _partnerFaithParam['devoutness_scale']);
      return AuthState(authEvent: AuthEvent.partnerFaith, response: response);
    });
  }

  Future<void> updateAccountHolderRaceAndEthnicity() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref
          .watch(authServiceProvider)
          .updateAccountHolderRaceAndEthnicity(
              ethnicityOptions: _accountHolderRaceAndEthnicity);
      return AuthState(
          authEvent: AuthEvent.accountHolderRaceAndEthnicity,
          response: response);
    });
  }

  Future<void> updatePartnerRaceAndEthnicity() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref
          .watch(authServiceProvider)
          .updatePartnerRaceAndEthnicity(
              partnerEthnicityOptions: _partnerRaceAndEthnicity);
      return AuthState(
          authEvent: AuthEvent.partnerRaceAndEthnicity, response: response);
    });
  }

  Future<void> updateChildrenRaceAndEthnicity() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref
          .watch(authServiceProvider)
          .updateChildrenRaceAndEthnicity(
              childrenEthnicityOptions: _childrenRaceAndEthnicity);
      return AuthState(
          authEvent: AuthEvent.partnerRaceAndEthnicity, response: response);
    });
  }

  Future<void> updateAccountHolderPolitics() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref
          .watch(authServiceProvider)
          .updateAccountHolderPolitics(politicsOptions: _accountHolderPolitics);
      return AuthState(
          authEvent: AuthEvent.accountHolderPolitics, response: response);
    });
  }

  Future<void> updatePartnerPolitics() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref
          .watch(authServiceProvider)
          .updatePartnerPolitics(politicsOptions: _partnerPolitics);
      return AuthState(
          authEvent: AuthEvent.partnerPolitics, response: response);
    });
  }

  Future<void> updatePersonalLifeStyle() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref
          .watch(authServiceProvider)
          .updatePersonalLifeStyle(
              smokingOptions: _personalLifeStyleParam['smoking_options'],
              drinkingOptions: _personalLifeStyleParam['drinking_options']);
      return AuthState(
          authEvent: AuthEvent.personalLifeStyle, response: response);
    });
  }

  Future<void> updatePetsDetails() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref.watch(authServiceProvider).updatePetsDetails(
          petOptions: _petParam['pet_options'],
          additionalDetails: _petParam['additional_details']);
      return AuthState(authEvent: AuthEvent.pets, response: response);
    });
  }

  Future<void> updateRoleSought() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref
          .watch(authServiceProvider)
          .updateRoleSought(rolesSought: _roleSought);
      return AuthState(authEvent: AuthEvent.roleSought, response: response);
    });
  }

  Future<void> updateRolesToFulFill() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref
          .watch(authServiceProvider)
          .updateRoleToFulfill(rolesToFulfil: _rolesToFulFill);
      return AuthState(authEvent: AuthEvent.roleToFulfill, response: response);
    });
  }

  Future<void> updateInvolvement() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref.watch(authServiceProvider).updateInvolvement(
          involvement: _involvementParam['involvement'],
          involvementSpecific: _involvementParam['involvementSpecific'],
          involvementAdditionalDetails:
              _involvementParam['involvementAdditionalDetails']);
      return AuthState(authEvent: AuthEvent.involvement, response: response);
    });
  }

  Future<void> updateDistance() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref.watch(authServiceProvider).updateDistance(
          distance: _distanceParam['distance'],
          additionalLocation: _distanceParam['additionalLocation']);
      return AuthState(authEvent: AuthEvent.distance, response: response);
    });
  }

  Future<void> updateFaithPreferences() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref
          .watch(authServiceProvider)
          .roleFaithPreferences(
              faithPerference: _faithPreferenceParam['faithPerference'],
              devoutnessScale: _faithPreferenceParam['devoutnessScale'],
              dealBreaker: _faithPreferenceParam['dealBreaker'] ?? 0,
              additionalDetails: _faithPreferenceParam['additionalDetails']);
      return AuthState(
          authEvent: AuthEvent.faithPreferences, response: response);
    });
  }

  Future<void> updateRoleRaceAndEthnicity() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref
          .watch(authServiceProvider)
          .roleRaceAndEthnicity(
              raceAndEthnicity: _raceAndEthnicityParam['raceAndEthnicity'],
              dealBreaker: _raceAndEthnicityParam['dealBreaker'] ?? 0,
              additionalDetails: _raceAndEthnicityParam['additionalDetails']);
      return AuthState(
          authEvent: AuthEvent.raceAndEthnicity, response: response);
    });
  }

  Future<void> updatePoliticalPreference() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref
          .watch(authServiceProvider)
          .updatePoliticalPreference(
              preferenceOptions: _politicalPreferenceParam['preferenceOptions'],
              dealBreaker: _politicalPreferenceParam['dealBreaker'] ?? 0);
      return AuthState(
          authEvent: AuthEvent.politicalPreferences, response: response);
    });
  }

  Future<void> updateLifeStylePreference() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref
          .watch(authServiceProvider)
          .updateLifeStylePreference(
            preferenceOptions: _lifestylePreferenceParam['preferenceOptions'],
            dealBreakerForSmoking:
                _lifestylePreferenceParam['dealBreakerForSmoking'] ?? 0,
            smokingAdditionalDetails:
                _lifestylePreferenceParam['smokingAdditionalDetails'],
            drinkingPreferences:
                _lifestylePreferenceParam['drinkingPreferences'],
            dealBreakerForDrinking:
                _lifestylePreferenceParam['dealBreakerForDrinking'] ?? 0,
            drinkingAdditionalDetails:
                _lifestylePreferenceParam['drinkingAdditionalDetails'],
            petTypePreferences: _lifestylePreferenceParam['petTypePreferences'],
            dealBreakerForPetType:
                _lifestylePreferenceParam['dealBreakerForPetType'] ?? 0,
            petAdditionalDetails:
                _lifestylePreferenceParam['petAdditionalDetails'],
          );
      return AuthState(
          authEvent: AuthEvent.lifeStylePreferences, response: response);
    });
  }

  void updateOtp(String otp) {
    _otp = otp;
  }

  void partnerAge(int age) {
    _partnerAge = age;
  }

  void updateLoginParam(String key, dynamic value) {
    _loginParam[key] = value;
  }

  void updateSignupParam(String key, dynamic value) {
    _signUpParam[key] = value;
  }

  void updateChildrenParam(String key, dynamic value) {
    _childrenParam[key] = value;
  }

  void updateEducationLevelParam(String key, dynamic value) {
    _educationParam[key] = value;
  }

  void updateAccountHolderFaithParam(String key, dynamic value) {
    _accountHolderFaithParam[key] = value;
  }

  void updatePartnerFaithParam(String key, dynamic value) {
    _partnerFaithParam[key] = value;
  }

  void updatePersonalLifeStyleParam(String key, dynamic value) {
    _personalLifeStyleParam[key] = value;
  }

  void updatePetParam(String key, dynamic value) {
    _petParam[key] = value;
  }

  void accountHolderRaceAndEthnicity(String accountHolderRaceAndEthnicity) {
    _accountHolderRaceAndEthnicity = accountHolderRaceAndEthnicity;
  }

  void partnerRaceAndEthnicity(String partnerRaceAndEthnicity) {
    _partnerRaceAndEthnicity = partnerRaceAndEthnicity;
  }

  void childrenRaceAndEthnicity(String childrenRaceAndEthnicity) {
    _childrenRaceAndEthnicity = childrenRaceAndEthnicity;
  }

  void accountHolderPolitics(String accountHolderPolitics) {
    _accountHolderPolitics = accountHolderPolitics;
  }

  void partnerPolitics(String partnerPolitics) {
    _partnerPolitics = partnerPolitics;
  }

  void updateRoleSoughtParam(String value) {
    _roleSought = value;
  }

  void updateRolesToFulFillParam(String value) {
    _rolesToFulFill = value;
  }

  void updateInvolvementParam(String key, dynamic value) {
    _involvementParam[key] = value;
  }

  void updateDistanceParam(String key, dynamic value) {
    _distanceParam[key] = value;
  }

  void updateFaithPreferenceParam(String key, dynamic value) {
    _faithPreferenceParam[key] = value;
  }

  void updateRaceAndEthnicityParam(String key, dynamic value) {
    _raceAndEthnicityParam[key] = value;
  }

  void updatePoliticalPreferenceParam(String key, dynamic value) {
    _politicalPreferenceParam[key] = value;
  }

  void updateLifeStylePreferenceParam(String key, dynamic value) {
    _lifestylePreferenceParam[key] = value;
  }
}

class LatLngData {
  final double lat;
  final double lng;
  LatLngData({required this.lat, required this.lng});
}
