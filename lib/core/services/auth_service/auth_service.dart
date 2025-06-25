import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relative_choice/core/network/api_client.dart';
import 'package:relative_choice/core/network/apiend_points.dart';
import 'package:relative_choice/core/services/local_storage_service/local_storage_service.dart';
import 'package:relative_choice/features/auth_feature/params/family_structure_params.dart';

import '../../../features/auth_feature/params/sign_up_params.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final localStorageService = ref.watch(localStorageServiceProvider);
  final token = ref.watch(localStorageServiceProvider).getToken();
  return AuthService(apiClient, localStorageService, token);
});

class AuthService {
  final ApiClient _client;
  final LocalStorageService _localStorageService;
  final String _token;

  AuthService(this._client, this._localStorageService, this._token);

  Future<String> loginUser(
      {required String email, required String password}) async {
    return asyncGuard(() async {
      final response = await _client.post(ApiEndPoints.login,
          data: FormData.fromMap({"email": email, "password": password}));
      final data = response.data;
      final token = data['token'];
      final message = data['message'];
      await _localStorageService.setToken(token);
      return message;
    });
  }

  Future<String> checkUserFormProcess() async {
    return asyncGuard(() async {
      final response =
          await _client.get(ApiEndPoints.checkOnBoardingStage, headers: {
        'Authorization': "Bearer $_token",
      });
      final message = response.data['message'];
      return message;
    });
  }

  Future<String> sendBetaCode({required String betaCode}) async {
    return asyncGuard(() async {
      final response = await _client.post(ApiEndPoints.betaCode,
          data: FormData.fromMap({"code": betaCode}));
      await _localStorageService.setBetaCode(betaCode);
      return response.data['message'];
    });
  }

  Future<String> isEmailExist({required String emailAddress}) async {
    return asyncGuard(() async {
      final response = await _client.post(ApiEndPoints.emailAddress,
          data: FormData.fromMap({'email': emailAddress}));
      return response.data['message'];
    });
  }

  Future<String> sendOtp({required String email}) async {
    return asyncGuard(() async {
      final response = await _client.post(ApiEndPoints.otp,
          data: FormData.fromMap({'email': email}));
      return response.data['message'];
    });
  }

  Future<String> matchOtp({required String otp, required String email}) async {
    return asyncGuard(() async {
      final response = await _client.post(ApiEndPoints.matchOtp,
          data: FormData.fromMap({'email': email, 'otp': otp}));
      return response.data['message'];
    });
  }

  Future<String> register({required Map<String, dynamic> signUpParam}) async {
    return asyncGuard(() async {
      final response = await _client.post(ApiEndPoints.register,
          data: FormData.fromMap({
            "email": signUpParam['email'],
            "password": signUpParam['password'],
            "betaCode": signUpParam['betaCode']
          }));
      await _localStorageService.setToken(response.data['token']);
      return response.data['message'];
    });
  }

  Future<String> addPersonalInformation({required SignupParams params}) async {
    return asyncGuard(() async {
      final response = await _client.post(ApiEndPoints.personalInformation,
          data: FormData.fromMap(params.toJson()),
          headers: {
            'Authorization': "Bearer $_token",
          });
      return  response.data['message'];

    });
  }

  Future<String> updateFamilyStructure(FamilyStructure familyStructure) async {
    return asyncGuard(() async {
      if (familyStructure.familyStructure == null) {
        throw Exception("Please select Family Structure");
      }
      final response = await _client.post(ApiEndPoints.familyStructure,
          data: FormData.fromMap(familyStructure.toJson()),
          headers: {
            'Authorization': "Bearer $_token",
          });
      final message = response.data['message'];
      return message;
    });
  }

  Future<String> updatePartnerAge({required int age}) async {
    return asyncGuard(() async {
      final response = await _client.post(ApiEndPoints.partnerAge,
          data: FormData.fromMap({"partner_age": age}),
          headers: {
            'Authorization': "Bearer $_token",
          });
      final message = response.data['message'];
      return message;
    });
  }

  Future<String> updateChildrenAge(
      {required int children, String? range}) async {
    return asyncGuard(() async {
      if (range == null ||range.isEmpty) {
        throw Exception("Please select Age range of children");
      }
      final response = await _client.post(ApiEndPoints.childrenAge,
          data: FormData.fromMap({
            "number_of_children": children,
            "children_age_ranges": range,
          }),
          headers: {
            'Authorization': "Bearer $_token",
          });
      final message = response.data['message'];
      return message;
    });
  }

  Future<String> updateEducationLevel(
      {required String accountHolderEduction, String? partnerEducation}) async {
    return asyncGuard(() async {
      final response = await _client.post(ApiEndPoints.educationLevel,
          data: FormData.fromMap({
            "primary_account_holder_education": accountHolderEduction,
            if (partnerEducation != null && partnerEducation.isNotEmpty)
              "partner_education": partnerEducation
          }),
          headers: {
            'Authorization': "Bearer $_token",
          });
      final message = response.data['message'];
      return message;
    });
  }

  Future<String> updateAccountHolderFaith(
      {String? faithOptions, String? devoutnessScale}) async {
    return asyncGuard(() async {
      if (faithOptions == null||faithOptions.isEmpty) {
        throw Exception("Please choose Faith Options");
      } else if (devoutnessScale == null||devoutnessScale.isEmpty) {
        throw Exception("Please choose Devoutness Scale");
      }
      final response = await _client.post(ApiEndPoints.accountHolderFaith,
          data: FormData.fromMap({
            "primary_account_holder_faith": faithOptions,
            "primary_account_holder_devoutness_scale": devoutnessScale
          }),
          headers: {
            'Authorization': "Bearer $_token",
          });
      final message = response.data['message'];
      return message;
    });
  }

  Future<String> updatePartnerFaith(
      {String? faithOptions, String? devoutnessScale}) async {
    return asyncGuard(() async {
      if (faithOptions == null||faithOptions.isEmpty) {
        throw Exception("Please choose Faith Options");
      } else if (devoutnessScale == null||devoutnessScale.isEmpty) {
        throw Exception("Please choose Devoutness Scale");
      }
      final response = await _client.post(ApiEndPoints.partnerFaith,
          data: FormData.fromMap({
            "partner_faith": faithOptions,
            "partner_devoutness_scale": devoutnessScale
          }),
          headers: {
            'Authorization': "Bearer $_token",
          });
      final message = response.data['message'];
      return message;
    });
  }

  Future<String> updateAccountHolderRaceAndEthnicity({
    String? ethnicityOptions,
  }) async {
    return asyncGuard(() async {
      if (ethnicityOptions == null||ethnicityOptions.isEmpty) {
        throw Exception("Please choose Race and Ethnicity");
      }
      final response = await _client.post(ApiEndPoints.raceAndEthnicity,
          data: FormData.fromMap({
            "primary_account_holder_ethnicity": ethnicityOptions,
          }),
          headers: {
            'Authorization': "Bearer $_token",
          });
      final message = response.data['message'];
      return message;
    });
  }

  Future<String> updatePartnerRaceAndEthnicity({
    String? partnerEthnicityOptions,
  }) async {
    return asyncGuard(() async {
      if (partnerEthnicityOptions == null||partnerEthnicityOptions.isEmpty) {
        throw Exception("Please choose Race and Ethnicity");
      }
      final response = await _client.post(ApiEndPoints.partnerEthnicity,
          data: FormData.fromMap({
            "partner_ethnicity": partnerEthnicityOptions,
          }),
          headers: {
            'Authorization': "Bearer $_token",
          });
      final message = response.data['message'];
      return message;
    });
  }

  Future<String> updateChildrenRaceAndEthnicity({
    String? childrenEthnicityOptions,
  }) async {
    return asyncGuard(() async {
      if (childrenEthnicityOptions == null||childrenEthnicityOptions.isEmpty) {
        throw Exception("Please choose Race and Ethnicity");
      }
      final response = await _client.post(ApiEndPoints.childrenEthnicity,
          data: FormData.fromMap({
            "children_ethnicity": childrenEthnicityOptions,
          }),
          headers: {
            'Authorization': "Bearer $_token",
          });
      final message = response.data['message'];
      return message;
    });
  }

  Future<String> updateAccountHolderPolitics({
    String? politicsOptions,
  }) async {
    return asyncGuard(() async {
      if (politicsOptions == null||politicsOptions.isEmpty) {
        throw Exception("Please choose Politics Options");
      }
      final response = await _client.post(ApiEndPoints.accountHolderPolitics,
          data: FormData.fromMap({
            "primary_account_holder_politics": politicsOptions,
          }),
          headers: {
            'Authorization': "Bearer $_token",
          });
      final message = response.data['message'];
      return message;
    });
  }

  Future<String> updatePartnerPolitics({
    String? politicsOptions,
  }) async {
    return asyncGuard(() async {
      if (politicsOptions == null||politicsOptions.isEmpty) {
        throw Exception("Please choose Politics Options");
      }
      final response = await _client.post(ApiEndPoints.partnerPolitics,
          data: FormData.fromMap({
            "partner_politics": politicsOptions,
          }),
          headers: {
            'Authorization': "Bearer $_token",
          });
      final message = response.data['message'];
      return message;
    });
  }

  Future<String> updatePersonalLifeStyle(
      {String? smokingOptions, String? drinkingOptions}) async {
    return asyncGuard(() async {
      if (smokingOptions == null||smokingOptions.isEmpty) {
        throw Exception("Please choose Smoking Options");
      } else if (drinkingOptions == null||drinkingOptions.isEmpty) {
        throw Exception("Please choose Drinking Options");
      }
      final response = await _client.post(ApiEndPoints.personalLifeStyle,
          data: FormData.fromMap({
            "primary_account_holder_smoking": smokingOptions,
            "primary_account_holder_drinking": drinkingOptions
          }),
          headers: {
            'Authorization': "Bearer $_token",
          });
      final message = response.data['message'];
      return message;
    });
  }

  Future<String> updatePetsDetails(
      {String? petOptions, String? additionalDetails}) async {
    return asyncGuard(() async {
      if (petOptions == null||petOptions.isEmpty) {
        throw Exception("Please choose Pet Types");
      }

      final response = await _client.post(ApiEndPoints.petDetails,
          data: FormData.fromMap({
            "primary_account_holder_pets": petOptions,
            "primary_account_holder_pets_additional_detail": additionalDetails
          }),
          headers: {
            'Authorization': "Bearer $_token",
          });
      final message = response.data['message'];
      return message;
    });
  }

  Future<String> updateRoleSought({
    String? rolesSought,
  }) async {
    return asyncGuard(() async {
      if (rolesSought == null||rolesSought.isEmpty) {
        throw Exception("Please choose Role Sought Options");
      }
      final response = await _client.post(ApiEndPoints.roleSought,
          data: FormData.fromMap({"roles_sought": rolesSought}),
          headers: {
            'Authorization': "Bearer $_token",
          });
      final message = response.data['message'];
      return message;
    });
  }

  Future<String> updateRoleToFulfill({
    String? rolesToFulfil,
  }) async {
    return asyncGuard(() async {
      if (rolesToFulfil == null||rolesToFulfil.isEmpty) {
        throw Exception("Please choose Role to Fulfill Options");
      }
      final response = await _client.post(ApiEndPoints.roleToFulfill,
          data: FormData.fromMap({"roles_to_fulfil": rolesToFulfil}),
          headers: {
            'Authorization': "Bearer $_token",
          });
      final message = response.data['message'];
      return message;
    });
  }

  Future<String> updateInvolvement(
      {String? involvement,
      String? involvementSpecific,
      String? involvementAdditionalDetails}) async {
    return asyncGuard(() async {
      if (involvement == null || involvement.isEmpty) {
        throw Exception("Please choose Involvement Options");
      }
      final response = await _client.post(ApiEndPoints.involvement,
          data: FormData.fromMap({
            "involvement": involvement,
            if (involvementSpecific != null)
              "involvement_specific": involvementSpecific,
            if (involvementAdditionalDetails != null)
              "involvement_additional_details": involvementAdditionalDetails
          }),
          headers: {
            'Authorization': "Bearer $_token",
          });
      final message = response.data['message'];
      return message;
    });
  }

  Future<String> updateDistance(
      {String? distance, String? additionalLocation}) async {
    return asyncGuard(() async {
      if (distance == null||distance.isEmpty) {
        throw Exception("Please choose distance Options");
      }
      final response = await _client.post(ApiEndPoints.distance,
          data: FormData.fromMap({
            "distance_range": distance,
            if (additionalLocation != null)
              "additional_location": additionalLocation,
          }),
          headers: {
            'Authorization': "Bearer $_token",
          });
      final message = response.data['message'];
      return message;
    });
  }

  Future<String> roleFaithPreferences(
      {String? faithPerference,
      String? devoutnessScale,
      int? dealBreaker,
      String? additionalDetails}) async {
    return asyncGuard(() async {
      if (faithPerference == null || faithPerference.isEmpty) {
        throw Exception("Please choose Faith Preferences Options");
      } else if (devoutnessScale == null || devoutnessScale.isEmpty) {
        throw Exception("Please choose Devoutness Scale Options");
      }
      final response = await _client.post(ApiEndPoints.faithPerferences,
          data: FormData.fromMap({
            "roles_sought_faith_preferences": faithPerference,
            "roles_sought_devoutness_scale": devoutnessScale,
            "roles_sought_faith_preferences_is_deal_breaker": dealBreaker,
            "roles_sought_faith_preferences_aditional_details":
                additionalDetails
          }),
          headers: {
            'Authorization': "Bearer $_token",
          });
      final message = response.data['message'];
      return message;
    });
  }

  Future<String> roleRaceAndEthnicity(
      {String? raceAndEthnicity,
      int? dealBreaker,
      String? additionalDetails}) async {
    return asyncGuard(() async {
      if (raceAndEthnicity == null || raceAndEthnicity.isEmpty) {
        throw Exception("Please choose Race and Ethnicity Options");
      }
      final response = await _client.post(ApiEndPoints.rollRaceAndEthnicity,
          data: FormData.fromMap({
            "roles_sought_ethnicity": raceAndEthnicity,
            "roles_sought_ethnicity_is_deal_breaker": dealBreaker,
            "roles_sought_ethnicity_additional_details": additionalDetails
          }),
          headers: {
            'Authorization': "Bearer $_token",
          });
      final message = response.data['message'];
      return message;
    });
  }

  Future<String> updatePoliticalPreference(
      {String? preferenceOptions,
      String? additionalDetails,
      int? dealBreaker}) async {
    return asyncGuard(() async {
      if (preferenceOptions == null || preferenceOptions.isEmpty) {
        throw Exception("Please choose Political Preferences Options");
      }
      final response = await _client.post(ApiEndPoints.politicalPrefrence,
          data: FormData.fromMap({
            "roles_sought_political_preferences": preferenceOptions,
            "roles_sought_political_preferences_is_deal_breaker": dealBreaker,
            "roles_sought_political_preferences_additional_detail":
                additionalDetails
          }),
          headers: {
            'Authorization': "Bearer $_token",
          });
      final message = response.data['message'];
      return message;
    });
  }

  Future<String> updateLifeStylePreference({
    String? preferenceOptions,
    int? dealBreakerForSmoking,
    String? drinkingPreferences,
    int? dealBreakerForDrinking,
    String? petTypePreferences,
    int? dealBreakerForPetType,
    String? petAdditionalDetails,
    String? drinkingAdditionalDetails,
    String? smokingAdditionalDetails,
  }) async {
    return asyncGuard(() async {
      if (preferenceOptions == null || preferenceOptions.isEmpty) {
        throw Exception("Please choose Smoking preferences options");
      } else if (drinkingPreferences == null || drinkingPreferences.isEmpty) {
        throw Exception("Please choose Drinking preferences options");
      } else if (petTypePreferences == null || petTypePreferences.isEmpty) {
        throw Exception("Please choose Pet Types options");
      }
      final response = await _client.post(ApiEndPoints.lifestylePrefrence,
          data: FormData.fromMap({
            "roles_sought_smoking": preferenceOptions,
            "roles_sought_smoking_is_deal_breaker": dealBreakerForSmoking,
            "roles_sought_drinking": drinkingPreferences,
            "roles_sought_drinking_is_deal_breaker": dealBreakerForDrinking,
            "roles_sought_pet_type": petTypePreferences,
            "roles_sought_pet_type_is_deal_breaker": dealBreakerForPetType,
            "roles_sought_smoking_additional_details": smokingAdditionalDetails,
            "roles_sought_drinking_additional_details":
                drinkingAdditionalDetails,
            "roles_sought_pet_type_additional_details": petAdditionalDetails
          }),
          headers: {
            'Authorization': "Bearer $_token",
          });
      final message = response.data['message'];
      return message;
    });
  }

  Future<String> updateProfileSteps({String? steps}) async {
    return asyncGuard(() async {
      final response = await _client.post("update-profile-step",
          data: FormData.fromMap({"profile_step": steps}),
          headers: {
            'Authorization': "Bearer $_token",
          });
      return response.data['message'];
    });
  }

  Future<double?> getProfileSteps() async {
    return asyncGuard(() async {
      final response = await _client.get("get-profile-step", headers: {
        'Authorization': "Bearer $_token",
      });
      final dynamic profileStep = response.data['profile_step'];

      if (profileStep == null) return null;
      if (profileStep is double) return profileStep;
      if (profileStep is int) return profileStep.toDouble();
      return null;
    });
  }
}

Future<Response> asyncGuard<Response>(
    Future<Response> Function() apiCall) async {
  try {
    return await apiCall();
  } on CheckedFromJsonException catch (e) {
    throw "Something went wrong! ${e.toString()}"
        .replaceAll("CheckedFromJsonException", "");
  } on FormatException catch (e) {
    throw "Unable to process data from server. reason: ${e.message}";
  } catch (e) {
    rethrow;
  }
}
