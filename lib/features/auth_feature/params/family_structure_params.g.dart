// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_structure_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FamilyStructureImpl _$$FamilyStructureImplFromJson(
        Map<String, dynamic> json) =>
    _$FamilyStructureImpl(
      familyStructure: json['family_structure'] as String?,
      familyConsideration: (json['family_consideration'] as num?)?.toInt() ?? 1,
      household: json['household'] as String?,
      householdAdditionalDetail: json['household_additional_detail'] as String?,
    );

Map<String, dynamic> _$$FamilyStructureImplToJson(
        _$FamilyStructureImpl instance) =>
    <String, dynamic>{
      'family_structure': instance.familyStructure,
      'family_consideration': instance.familyConsideration,
      'household': instance.household,
      'household_additional_detail': instance.householdAdditionalDetail,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$familyStructureParamsHash() =>
    r'cf95cbeed31b1ab8fa784f14c41fca3f084a8247';

/// See also [FamilyStructureParams].
@ProviderFor(FamilyStructureParams)
final familyStructureParamsProvider =
    NotifierProvider<FamilyStructureParams, FamilyStructure>.internal(
  FamilyStructureParams.new,
  name: r'familyStructureParamsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$familyStructureParamsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FamilyStructureParams = Notifier<FamilyStructure>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
