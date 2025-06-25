// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignupParamsImpl _$$SignupParamsImplFromJson(Map<String, dynamic> json) =>
    _$SignupParamsImpl(
      firstname: json['firstname'] as String? ?? '',
      lastname: json['lastname'] as String? ?? '',
      username: json['username'] as String? ?? '',
      address: json['address'] as String? ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      dateOfBirth: json['date_of_birth'] as String? ?? '',
    );

Map<String, dynamic> _$$SignupParamsImplToJson(_$SignupParamsImpl instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'username': instance.username,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'date_of_birth': instance.dateOfBirth,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signUpParamsDataHash() => r'76d498c1bb9894808b9c58f3cd80a990bef5e770';

/// See also [SignUpParamsData].
@ProviderFor(SignUpParamsData)
final signUpParamsDataProvider =
    NotifierProvider<SignUpParamsData, SignupParams>.internal(
  SignUpParamsData.new,
  name: r'signUpParamsDataProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signUpParamsDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignUpParamsData = Notifier<SignupParams>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
