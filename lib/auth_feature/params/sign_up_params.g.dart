// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignupParamsImpl _$$SignupParamsImplFromJson(Map<String, dynamic> json) =>
    _$SignupParamsImpl(
      firstname: json['firstname'] as String? ?? '',
      lastname: json['lastname'] as String? ?? '',
      email: json['email'] as String? ?? '',
      username: json['username'] as String? ?? '',
      password: json['password'] as String? ?? '',
      betaCode: json['betaCode'] as String? ?? '',
      address: json['address'] as String? ?? '',
      dateOfBirth: json['date_of_birth'] as String? ?? '',
    );

Map<String, dynamic> _$$SignupParamsImplToJson(_$SignupParamsImpl instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'betaCode': instance.betaCode,
      'address': instance.address,
      'date_of_birth': instance.dateOfBirth,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signUpParamsDataHash() => r'0aa965c1aebc9cae5f88e736f16d176e6b999eed';

/// See also [SignUpParamsData].
@ProviderFor(SignUpParamsData)
final signUpParamsDataProvider =
    AutoDisposeNotifierProvider<SignUpParamsData, SignupParams>.internal(
  SignUpParamsData.new,
  name: r'signUpParamsDataProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signUpParamsDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignUpParamsData = AutoDisposeNotifier<SignupParams>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
