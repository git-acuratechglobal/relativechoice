// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      userOnboarding: json['userOnboarding'] == null
          ? null
          : UserOnboarding.fromJson(
              json['userOnboarding'] as Map<String, dynamic>),
      userRelationShipChoices: json['userRelationShipChoices'] == null
          ? null
          : UserRelationShipChoices.fromJson(
              json['userRelationShipChoices'] as Map<String, dynamic>),
      userShowcaseImages: (json['userShowcaseImages'] as List<dynamic>?)
          ?.map((e) => UserShowcaseImages.fromJson(e as Map<String, dynamic>))
          .toList(),
      detailedScore: json['detailedScores'] == null
          ? null
          : DetailedScores.fromJson(
              json['detailedScores'] as Map<String, dynamic>),
      averageScore: (json['averageScore'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'userOnboarding': instance.userOnboarding,
      'userRelationShipChoices': instance.userRelationShipChoices,
      'userShowcaseImages': instance.userShowcaseImages,
      'detailedScores': instance.detailedScore,
      'averageScore': instance.averageScore,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt(),
      user_id: (json['user_id'] as num?)?.toInt(),
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      otp: json['otp'],
      otpValidUpto: json['otp_valid_upto'],
      emailVerifiedAt: json['email_verified_at'],
      image: json['image'],
      address: json['address'] as String?,
      dateOfBirth: json['date_of_birth'] == null
          ? null
          : DateTime.parse(json['date_of_birth'] as String),
      fcmToken: json['fcm_token'],
      deleteAt: json['delete_at'],
      isActive: (json['is_active'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      betaCode: json['betaCode'] as String?,
      isSocial: (json['is_social'] as num?)?.toInt(),
      socialType: json['socialType'],
      otpAttempts: json['otp_attempts'],
      isProfileCompleted: json['is_profile_completed'],
      totalScore: (json['total_score'] as num?)?.toDouble(),
      user_show_case_images: (json['user_show_case_images'] as List<dynamic>?)
          ?.map((e) => UserShowcaseImages.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'username': instance.username,
      'otp': instance.otp,
      'otp_valid_upto': instance.otpValidUpto,
      'email_verified_at': instance.emailVerifiedAt,
      'image': instance.image,
      'address': instance.address,
      'date_of_birth': instance.dateOfBirth?.toIso8601String(),
      'fcm_token': instance.fcmToken,
      'delete_at': instance.deleteAt,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'betaCode': instance.betaCode,
      'is_social': instance.isSocial,
      'socialType': instance.socialType,
      'otp_attempts': instance.otpAttempts,
      'is_profile_completed': instance.isProfileCompleted,
      'total_score': instance.totalScore,
      'user_show_case_images': instance.user_show_case_images,
    };

_$UserOnboardingImpl _$$UserOnboardingImplFromJson(Map<String, dynamic> json) =>
    _$UserOnboardingImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      familyStructure: json['family_structure'] as String?,
      household: json['household'] as String?,
      householdAdditionalDetail: json['household_additional_detail'] as String?,
      familyConsideration: json['family_consideration'] as String?,
      partnerAge: json['partner_age'] as String?,
      numberOfChildren: json['number_of_children'] as String?,
      childrenAgeRanges: json['children_age_ranges'] as String?,
      primaryAccountHolderEducation:
          json['primary_account_holder_education'] as String?,
      partnerEducation: json['partner_education'] as String?,
      primaryAccountHolderFaith:
          json['primary_account_holder_faith'] as String?,
      primaryAccountHolderDevoutnessScale:
          json['primary_account_holder_devoutness_scale'] as String?,
      partnerFaith: json['partner_faith'] as String?,
      partnerDevoutnessScale: json['partner_devoutness_scale'] as String?,
      childrenFaith: json['children_faith'],
      childrenDevoutnessScale: json['children_devoutness_scale'],
      primaryAccountHolderEthnicity:
          json['primary_account_holder_ethnicity'] as String?,
      partnerEthnicity: json['partner_ethnicity'] as String?,
      childrenEthnicity: json['children_ethnicity'] as String?,
      primaryAccountHolderPolitics:
          json['primary_account_holder_politics'] as String?,
      partnerPolitics: json['partner_politics'] as String?,
      primaryAccountHolderSmoking:
          json['primary_account_holder_smoking'] as String?,
      primaryAccountHolderDrinking:
          json['primary_account_holder_drinking'] as String?,
      primaryAccountHolderPets: json['primary_account_holder_pets'] as String?,
      primaryAccountHolderPetsAdditionalDetail:
          json['primary_account_holder_pets_additional_detail'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$UserOnboardingImplToJson(
        _$UserOnboardingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'family_structure': instance.familyStructure,
      'household': instance.household,
      'household_additional_detail': instance.householdAdditionalDetail,
      'family_consideration': instance.familyConsideration,
      'partner_age': instance.partnerAge,
      'number_of_children': instance.numberOfChildren,
      'children_age_ranges': instance.childrenAgeRanges,
      'primary_account_holder_education':
          instance.primaryAccountHolderEducation,
      'partner_education': instance.partnerEducation,
      'primary_account_holder_faith': instance.primaryAccountHolderFaith,
      'primary_account_holder_devoutness_scale':
          instance.primaryAccountHolderDevoutnessScale,
      'partner_faith': instance.partnerFaith,
      'partner_devoutness_scale': instance.partnerDevoutnessScale,
      'children_faith': instance.childrenFaith,
      'children_devoutness_scale': instance.childrenDevoutnessScale,
      'primary_account_holder_ethnicity':
          instance.primaryAccountHolderEthnicity,
      'partner_ethnicity': instance.partnerEthnicity,
      'children_ethnicity': instance.childrenEthnicity,
      'primary_account_holder_politics': instance.primaryAccountHolderPolitics,
      'partner_politics': instance.partnerPolitics,
      'primary_account_holder_smoking': instance.primaryAccountHolderSmoking,
      'primary_account_holder_drinking': instance.primaryAccountHolderDrinking,
      'primary_account_holder_pets': instance.primaryAccountHolderPets,
      'primary_account_holder_pets_additional_detail':
          instance.primaryAccountHolderPetsAdditionalDetail,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$UserRelationShipChoicesImpl _$$UserRelationShipChoicesImplFromJson(
        Map<String, dynamic> json) =>
    _$UserRelationShipChoicesImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      rolesSought: json['roles_sought'] as String?,
      rolesToFulfil: json['roles_to_fulfil'] as String?,
      involvement: json['involvement'] as String?,
      involvementSpecific: json['involvement_specific'],
      involvementAdditionalDetails: json['involvement_additional_details'],
      distanceRange: json['distance_range'] as String?,
      additionalLocation: json['additional_location'],
      rolesSoughtFaithPreferences:
          json['roles_sought_faith_preferences'] as String?,
      rolesSoughtDevoutnessScale:
          json['roles_sought_devoutness_scale'] as String?,
      rolesSoughtFaithPreferencesIsDealBreaker:
          (json['roles_sought_faith_preferences_is_deal_breaker'] as num?)
              ?.toInt(),
      rolesSoughtFaithPreferencesAditionalDetails:
          json['roles_sought_faith_preferences_aditional_details'],
      rolesSoughtEthnicity: json['roles_sought_ethnicity'] as String?,
      rolesSoughtEthnicityIsDealBreaker:
          (json['roles_sought_ethnicity_is_deal_breaker'] as num?)?.toInt(),
      rolesSoughtEthnicityAdditionalDetails:
          json['roles_sought_ethnicity_additional_details'],
      rolesSoughtPoliticalPreferences:
          json['roles_sought_political_preferences'] as String?,
      rolesSoughtPoliticalPreferencesIsDealBreaker:
          (json['roles_sought_political_preferences_is_deal_breaker'] as num?)
              ?.toInt(),
      rolesSoughtPoliticalPreferencesAdditionalDetail:
          json['roles_sought_political_preferences_additional_detail'],
      rolesSoughtSmoking: json['roles_sought_smoking'] as String?,
      rolesSoughtSmokingIsDealBreaker:
          (json['roles_sought_smoking_is_deal_breaker'] as num?)?.toInt(),
      rolesSoughtSmokingAdditionalDetails:
          json['roles_sought_smoking_additional_details'],
      rolesSoughtDrinking: json['roles_sought_drinking'] as String?,
      rolesSoughtDrinkingIsDealBreaker:
          (json['roles_sought_drinking_is_deal_breaker'] as num?)?.toInt(),
      rolesSoughtDrinkingAdditionalDetails:
          json['roles_sought_drinking_additional_details'],
      rolesSoughtPetType: json['roles_sought_pet_type'] as String?,
      rolesSoughtPetTypeIsDealBreaker:
          (json['roles_sought_pet_type_is_deal_breaker'] as num?)?.toInt(),
      rolesSoughtPetTypeAdditionalDetails:
          json['roles_sought_pet_type_additional_details'],
      rolesSoughtLifestyleNotes: json['roles_sought_lifestyle_notes'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$UserRelationShipChoicesImplToJson(
        _$UserRelationShipChoicesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'roles_sought': instance.rolesSought,
      'roles_to_fulfil': instance.rolesToFulfil,
      'involvement': instance.involvement,
      'involvement_specific': instance.involvementSpecific,
      'involvement_additional_details': instance.involvementAdditionalDetails,
      'distance_range': instance.distanceRange,
      'additional_location': instance.additionalLocation,
      'roles_sought_faith_preferences': instance.rolesSoughtFaithPreferences,
      'roles_sought_devoutness_scale': instance.rolesSoughtDevoutnessScale,
      'roles_sought_faith_preferences_is_deal_breaker':
          instance.rolesSoughtFaithPreferencesIsDealBreaker,
      'roles_sought_faith_preferences_aditional_details':
          instance.rolesSoughtFaithPreferencesAditionalDetails,
      'roles_sought_ethnicity': instance.rolesSoughtEthnicity,
      'roles_sought_ethnicity_is_deal_breaker':
          instance.rolesSoughtEthnicityIsDealBreaker,
      'roles_sought_ethnicity_additional_details':
          instance.rolesSoughtEthnicityAdditionalDetails,
      'roles_sought_political_preferences':
          instance.rolesSoughtPoliticalPreferences,
      'roles_sought_political_preferences_is_deal_breaker':
          instance.rolesSoughtPoliticalPreferencesIsDealBreaker,
      'roles_sought_political_preferences_additional_detail':
          instance.rolesSoughtPoliticalPreferencesAdditionalDetail,
      'roles_sought_smoking': instance.rolesSoughtSmoking,
      'roles_sought_smoking_is_deal_breaker':
          instance.rolesSoughtSmokingIsDealBreaker,
      'roles_sought_smoking_additional_details':
          instance.rolesSoughtSmokingAdditionalDetails,
      'roles_sought_drinking': instance.rolesSoughtDrinking,
      'roles_sought_drinking_is_deal_breaker':
          instance.rolesSoughtDrinkingIsDealBreaker,
      'roles_sought_drinking_additional_details':
          instance.rolesSoughtDrinkingAdditionalDetails,
      'roles_sought_pet_type': instance.rolesSoughtPetType,
      'roles_sought_pet_type_is_deal_breaker':
          instance.rolesSoughtPetTypeIsDealBreaker,
      'roles_sought_pet_type_additional_details':
          instance.rolesSoughtPetTypeAdditionalDetails,
      'roles_sought_lifestyle_notes': instance.rolesSoughtLifestyleNotes,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$DetailedScoresImpl _$$DetailedScoresImplFromJson(Map<String, dynamic> json) =>
    _$DetailedScoresImpl(
      faith: (json['faith'] as num).toInt(),
      race: (json['race'] as num).toInt(),
      politics: (json['politics'] as num).toInt(),
      lifestyle: (json['lifestyle'] as num).toInt(),
      roles: (json['roles'] as num).toInt(),
      location: (json['location'] as num).toDouble(),
    );

Map<String, dynamic> _$$DetailedScoresImplToJson(
        _$DetailedScoresImpl instance) =>
    <String, dynamic>{
      'faith': instance.faith,
      'race': instance.race,
      'politics': instance.politics,
      'lifestyle': instance.lifestyle,
      'roles': instance.roles,
      'location': instance.location,
    };

_$UserShowcaseImagesImpl _$$UserShowcaseImagesImplFromJson(
        Map<String, dynamic> json) =>
    _$UserShowcaseImagesImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      image: json['image'] as String?,
      caption: json['caption'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$UserShowcaseImagesImplToJson(
        _$UserShowcaseImagesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'image': instance.image,
      'caption': instance.caption,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
