import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relative_choice/core/extensions/extensions.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: "user") User? user,
    @JsonKey(name: "userOnboarding") UserOnboarding? userOnboarding,
    @JsonKey(name: "userRelationShipChoices")
    UserRelationShipChoices? userRelationShipChoices,
    @JsonKey(name: "userShowcaseImages")
    List<UserShowcaseImages>? userShowcaseImages,
    @JsonKey(name: "detailedScores") DetailedScores? detailedScore,
    @JsonKey(name: "averageScore") double? averageScore,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension AverageScoreExtension on UserModel {
  double get roundedAverageScore {
    return averageScore != null
        ? double.parse(averageScore!.toStringAsFixed(1))
        : 0.0;
  }
}

extension MatchingListExtension on List<UserModel> {
  List<UserModel> get filteredByUserScore {
    return where((user) => user.averageScore != null && user.averageScore! > 0)
        .toList();
  }

  List<UserModel> get sortedByUserScore {
    final filtered = filteredByUserScore;
    filtered.sort((a, b) => b.averageScore!.compareTo(a.averageScore!));
    return filtered;
  }
}

@freezed
abstract class User with _$User {
  const factory User({
    @JsonKey(name: "id") int? id,
      int? user_id,
    @JsonKey(name: "firstname") String? firstname,
    @JsonKey(name: "lastname") String? lastname,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "otp") dynamic otp,
    @JsonKey(name: "otp_valid_upto") dynamic otpValidUpto,
    @JsonKey(name: "email_verified_at") dynamic emailVerifiedAt,
    @JsonKey(name: "image") dynamic image,
    @JsonKey(name: "address") String? address,
    @JsonKey(name: "date_of_birth") DateTime? dateOfBirth,
    @JsonKey(name: "fcm_token") dynamic fcmToken,
    @JsonKey(name: "delete_at") dynamic deleteAt,
    @JsonKey(name: "is_active") int? isActive,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    @JsonKey(name: "betaCode") String? betaCode,
    @JsonKey(name: "is_social") int? isSocial,
    @JsonKey(name: "socialType") dynamic socialType,
    @JsonKey(name: "otp_attempts") dynamic otpAttempts,
    @JsonKey(name: "is_profile_completed") dynamic isProfileCompleted,
    @JsonKey(name: "total_score") double? totalScore,
    List<UserShowcaseImages>? user_show_case_images,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

extension UserMatchingListExtension on List<User> {
  List<User> get filteredByUserScore {
    return where((user) => user.totalScore != null && user.totalScore! > 0)
        .toList();
  }

  List<User> get sortedByUserScore {
    final filtered = List<User>.from(filteredByUserScore);

    if (filtered.length <= 1) return filtered;

    filtered.sort((a, b) {
      final aScore = a.totalScore ?? 0;
      final bScore = b.totalScore ?? 0;
      return bScore.compareTo(aScore); // Descending
    });

    return filtered;
  }
}

extension UserX on User {
  String get fullName {
    final fName = (firstname ?? '').capitalize();
    final lName = (lastname ?? '').capitalize();
    return "$fName $lName".trim();
  }

  double get roundedAverageScore {
    return totalScore != null
        ? double.parse(totalScore!.toStringAsFixed(1))
        : 0.0;
  }

  UserShowcaseImages? get randomShowcaseImage {
    if (user_show_case_images == null || user_show_case_images!.isEmpty)
      return null;
    final rand = Random();
    return user_show_case_images![rand.nextInt(user_show_case_images!.length)];
  }
}

@freezed
class UserOnboarding with _$UserOnboarding {
  const factory UserOnboarding({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "family_structure") String? familyStructure,
    @JsonKey(name: "household") String? household,
    @JsonKey(name: "household_additional_detail")
    String? householdAdditionalDetail,
    @JsonKey(name: "family_consideration") String? familyConsideration,
    @JsonKey(name: "partner_age") String? partnerAge,
    @JsonKey(name: "number_of_children") String? numberOfChildren,
    @JsonKey(name: "children_age_ranges") String? childrenAgeRanges,
    @JsonKey(name: "primary_account_holder_education")
    String? primaryAccountHolderEducation,
    @JsonKey(name: "partner_education") String? partnerEducation,
    @JsonKey(name: "primary_account_holder_faith")
    String? primaryAccountHolderFaith,
    @JsonKey(name: "primary_account_holder_devoutness_scale")
    String? primaryAccountHolderDevoutnessScale,
    @JsonKey(name: "partner_faith") String? partnerFaith,
    @JsonKey(name: "partner_devoutness_scale") String? partnerDevoutnessScale,
    @JsonKey(name: "children_faith") dynamic childrenFaith,
    @JsonKey(name: "children_devoutness_scale") dynamic childrenDevoutnessScale,
    @JsonKey(name: "primary_account_holder_ethnicity")
    String? primaryAccountHolderEthnicity,
    @JsonKey(name: "partner_ethnicity") String? partnerEthnicity,
    @JsonKey(name: "children_ethnicity") String? childrenEthnicity,
    @JsonKey(name: "primary_account_holder_politics")
    String? primaryAccountHolderPolitics,
    @JsonKey(name: "partner_politics") String? partnerPolitics,
    @JsonKey(name: "primary_account_holder_smoking")
    String? primaryAccountHolderSmoking,
    @JsonKey(name: "primary_account_holder_drinking")
    String? primaryAccountHolderDrinking,
    @JsonKey(name: "primary_account_holder_pets")
    String? primaryAccountHolderPets,
    @JsonKey(name: "primary_account_holder_pets_additional_detail")
    String? primaryAccountHolderPetsAdditionalDetail,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
  }) = _UserOnboarding;

  factory UserOnboarding.fromJson(Map<String, dynamic> json) =>
      _$UserOnboardingFromJson(json);
}

extension UserOnboardingExtension on UserOnboarding {
  List<String> get aboutMeTags {
    final tags = <String>[];

    if (familyStructure?.isNotEmpty == true) {
      tags.add('👥 $familyStructure');
    }
    if (primaryAccountHolderFaith?.isNotEmpty == true) {
      tags.add('🙏 $primaryAccountHolderFaith');
    }
    if (primaryAccountHolderEthnicity?.isNotEmpty == true) {
      tags.add('👤 $primaryAccountHolderEthnicity');
    }
    if (primaryAccountHolderEducation?.isNotEmpty == true) {
      tags.add('🎓 $primaryAccountHolderEducation');
    }
    if (primaryAccountHolderSmoking?.isNotEmpty == true) {
      tags.add('🚬 $primaryAccountHolderSmoking');
    }
    if (primaryAccountHolderDrinking?.isNotEmpty == true) {
      tags.add('🍷 $primaryAccountHolderDrinking');
    }
    if (primaryAccountHolderPets?.isNotEmpty == true) {
      tags.add('🐾 $primaryAccountHolderPets');
    }
    if (numberOfChildren?.isNotEmpty == true) {
      tags.add('👦 $numberOfChildren Children');
    }

    return tags;
  }

  List<String> get partnerBioTags {
    final tags = <String>[];
    if (partnerFaith?.isNotEmpty == true) {
      tags.add('🙏 $partnerFaith');
    }
    if (partnerEthnicity?.isNotEmpty == true) {
      tags.add('👤 $partnerEthnicity');
    }
    if (partnerEducation?.isNotEmpty == true) {
      tags.add('🎓 $partnerEducation');
    }
    return tags;
  }
}

@freezed
class UserRelationShipChoices with _$UserRelationShipChoices {
  const factory UserRelationShipChoices({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "roles_sought") String? rolesSought,
    @JsonKey(name: "roles_to_fulfil") String? rolesToFulfil,
    @JsonKey(name: "involvement") String? involvement,
    @JsonKey(name: "involvement_specific") dynamic involvementSpecific,
    @JsonKey(name: "involvement_additional_details")
    dynamic involvementAdditionalDetails,
    @JsonKey(name: "distance_range") String? distanceRange,
    @JsonKey(name: "additional_location") dynamic additionalLocation,
    @JsonKey(name: "roles_sought_faith_preferences")
    String? rolesSoughtFaithPreferences,
    @JsonKey(name: "roles_sought_devoutness_scale")
    String? rolesSoughtDevoutnessScale,
    @JsonKey(name: "roles_sought_faith_preferences_is_deal_breaker")
    int? rolesSoughtFaithPreferencesIsDealBreaker,
    @JsonKey(name: "roles_sought_faith_preferences_aditional_details")
    dynamic rolesSoughtFaithPreferencesAditionalDetails,
    @JsonKey(name: "roles_sought_ethnicity") String? rolesSoughtEthnicity,
    @JsonKey(name: "roles_sought_ethnicity_is_deal_breaker")
    int? rolesSoughtEthnicityIsDealBreaker,
    @JsonKey(name: "roles_sought_ethnicity_additional_details")
    dynamic rolesSoughtEthnicityAdditionalDetails,
    @JsonKey(name: "roles_sought_political_preferences")
    String? rolesSoughtPoliticalPreferences,
    @JsonKey(name: "roles_sought_political_preferences_is_deal_breaker")
    int? rolesSoughtPoliticalPreferencesIsDealBreaker,
    @JsonKey(name: "roles_sought_political_preferences_additional_detail")
    dynamic rolesSoughtPoliticalPreferencesAdditionalDetail,
    @JsonKey(name: "roles_sought_smoking") String? rolesSoughtSmoking,
    @JsonKey(name: "roles_sought_smoking_is_deal_breaker")
    int? rolesSoughtSmokingIsDealBreaker,
    @JsonKey(name: "roles_sought_smoking_additional_details")
    dynamic rolesSoughtSmokingAdditionalDetails,
    @JsonKey(name: "roles_sought_drinking") String? rolesSoughtDrinking,
    @JsonKey(name: "roles_sought_drinking_is_deal_breaker")
    int? rolesSoughtDrinkingIsDealBreaker,
    @JsonKey(name: "roles_sought_drinking_additional_details")
    dynamic rolesSoughtDrinkingAdditionalDetails,
    @JsonKey(name: "roles_sought_pet_type") String? rolesSoughtPetType,
    @JsonKey(name: "roles_sought_pet_type_is_deal_breaker")
    int? rolesSoughtPetTypeIsDealBreaker,
    @JsonKey(name: "roles_sought_pet_type_additional_details")
    dynamic rolesSoughtPetTypeAdditionalDetails,
    @JsonKey(name: "roles_sought_lifestyle_notes")
    dynamic rolesSoughtLifestyleNotes,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
  }) = _UserRelationShipChoices;

  factory UserRelationShipChoices.fromJson(Map<String, dynamic> json) =>
      _$UserRelationShipChoicesFromJson(json);
}

extension UserRelationshipChoiceExtension on UserRelationShipChoices {
  List<String> get roleTags {
    final tags = <String>{};

    final soughtRoles = rolesSought?.split(' ') ?? [];
    final fulfilRoles = rolesToFulfil?.split(' ') ?? [];

    for (final role in soughtRoles) {
      if (role.trim().isNotEmpty) {
        tags.add('👤 ${role.trim()}');
      }
    }

    for (final role in fulfilRoles) {
      if (role.trim().isNotEmpty) {
        tags.add('👤 ${role.trim()}');
      }
    }

    return tags.toList();
  }

  List<String> get involvementTags {
    final tags = <String>[];
    if (involvement?.isNotEmpty == true) {
      if (involvement == "Open to All") {
        tags.add('🗣️ ${involvement}');
      } else {
        involvement!
            .split(',')
            .map((e) => e.trim())
            .forEach((e) => tags.add('🗣️ $e'));
      }
    }
    return tags;
  }

  List<String> get faithTags {
    final tags = <String>[];
    if (rolesSoughtFaithPreferences?.isNotEmpty == true) {
      if (rolesSoughtFaithPreferences == 'Open to All') {
        tags.add('🙏 $rolesSoughtFaithPreferences');
      } else {
        rolesSoughtFaithPreferences!
            .split(',')
            .map((e) => e.trim())
            .forEach((e) => tags.add('🙏 $e'));
      }
    }
    return tags;
  }

  List<String> get ethnicityTags {
    final tags = <String>[];

    if (rolesSoughtEthnicity?.isNotEmpty == true) {
      if (rolesSoughtEthnicity == 'Open to All') {
        tags.add('👤 $rolesSoughtEthnicity');
      } else {
        rolesSoughtEthnicity!
            .split(',')
            .map((e) => e.trim())
            .forEach((e) => tags.add('👤 $e'));
      }
    }

    return tags;
  }

  List<String> get politicsTags {
    final tags = <String>[];

    if (rolesSoughtPoliticalPreferences?.isNotEmpty == true) {
      if (rolesSoughtPoliticalPreferences == 'Open to All') {
        tags.add(rolesSoughtPoliticalPreferences!);
      } else {
        rolesSoughtPoliticalPreferences!
            .split(',')
            .map((e) => e.trim())
            .forEach(tags.add);
      }
    }

    return tags;
  }

  List<String> get lifestyleTags {
    final tags = <String>[];

    if (rolesSoughtSmoking?.isNotEmpty == true) {
      tags.add('🚬 $rolesSoughtSmoking');
    }

    if (rolesSoughtDrinking?.isNotEmpty == true) {
      tags.add('🍷 $rolesSoughtDrinking');
    }

    return tags;
  }
}

@freezed
class DetailedScores with _$DetailedScores {
  const factory DetailedScores({
    @JsonKey(name: "faith") required int faith,
    @JsonKey(name: "race") required int race,
    @JsonKey(name: "politics") required int politics,
    @JsonKey(name: "lifestyle") required int lifestyle,
    @JsonKey(name: "roles") required int roles,
    @JsonKey(name: "location") required double location,
  }) = _DetailedScores;
  factory DetailedScores.fromJson(Map<String, dynamic> json) =>
      _$DetailedScoresFromJson(json);
}

@freezed
class UserShowcaseImages with _$UserShowcaseImages {
  const factory UserShowcaseImages({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "caption") String? caption,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
  }) = _UserShowcaseImages;

  factory UserShowcaseImages.fromJson(Map<String, dynamic> json) =>
      _$UserShowcaseImagesFromJson(json);
}
