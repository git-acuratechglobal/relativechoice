// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignupParams _$SignupParamsFromJson(Map<String, dynamic> json) {
  return _SignupParams.fromJson(json);
}

/// @nodoc
mixin _$SignupParams {
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get betaCode => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  String get dateOfBirth => throw _privateConstructorUsedError;

  /// Serializes this SignupParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignupParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignupParamsCopyWith<SignupParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupParamsCopyWith<$Res> {
  factory $SignupParamsCopyWith(
          SignupParams value, $Res Function(SignupParams) then) =
      _$SignupParamsCopyWithImpl<$Res, SignupParams>;
  @useResult
  $Res call(
      {String firstname,
      String lastname,
      String email,
      String username,
      String password,
      String betaCode,
      String address,
      @JsonKey(name: 'date_of_birth') String dateOfBirth});
}

/// @nodoc
class _$SignupParamsCopyWithImpl<$Res, $Val extends SignupParams>
    implements $SignupParamsCopyWith<$Res> {
  _$SignupParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignupParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstname = null,
    Object? lastname = null,
    Object? email = null,
    Object? username = null,
    Object? password = null,
    Object? betaCode = null,
    Object? address = null,
    Object? dateOfBirth = null,
  }) {
    return _then(_value.copyWith(
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      betaCode: null == betaCode
          ? _value.betaCode
          : betaCode // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignupParamsImplCopyWith<$Res>
    implements $SignupParamsCopyWith<$Res> {
  factory _$$SignupParamsImplCopyWith(
          _$SignupParamsImpl value, $Res Function(_$SignupParamsImpl) then) =
      __$$SignupParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstname,
      String lastname,
      String email,
      String username,
      String password,
      String betaCode,
      String address,
      @JsonKey(name: 'date_of_birth') String dateOfBirth});
}

/// @nodoc
class __$$SignupParamsImplCopyWithImpl<$Res>
    extends _$SignupParamsCopyWithImpl<$Res, _$SignupParamsImpl>
    implements _$$SignupParamsImplCopyWith<$Res> {
  __$$SignupParamsImplCopyWithImpl(
      _$SignupParamsImpl _value, $Res Function(_$SignupParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignupParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstname = null,
    Object? lastname = null,
    Object? email = null,
    Object? username = null,
    Object? password = null,
    Object? betaCode = null,
    Object? address = null,
    Object? dateOfBirth = null,
  }) {
    return _then(_$SignupParamsImpl(
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      betaCode: null == betaCode
          ? _value.betaCode
          : betaCode // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignupParamsImpl implements _SignupParams {
  const _$SignupParamsImpl(
      {this.firstname = '',
      this.lastname = '',
      this.email = '',
      this.username = '',
      this.password = '',
      this.betaCode = '',
      this.address = '',
      @JsonKey(name: 'date_of_birth') this.dateOfBirth = ''});

  factory _$SignupParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignupParamsImplFromJson(json);

  @override
  @JsonKey()
  final String firstname;
  @override
  @JsonKey()
  final String lastname;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String betaCode;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey(name: 'date_of_birth')
  final String dateOfBirth;

  @override
  String toString() {
    return 'SignupParams(firstname: $firstname, lastname: $lastname, email: $email, username: $username, password: $password, betaCode: $betaCode, address: $address, dateOfBirth: $dateOfBirth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupParamsImpl &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.betaCode, betaCode) ||
                other.betaCode == betaCode) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstname, lastname, email,
      username, password, betaCode, address, dateOfBirth);

  /// Create a copy of SignupParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupParamsImplCopyWith<_$SignupParamsImpl> get copyWith =>
      __$$SignupParamsImplCopyWithImpl<_$SignupParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignupParamsImplToJson(
      this,
    );
  }
}

abstract class _SignupParams implements SignupParams {
  const factory _SignupParams(
          {final String firstname,
          final String lastname,
          final String email,
          final String username,
          final String password,
          final String betaCode,
          final String address,
          @JsonKey(name: 'date_of_birth') final String dateOfBirth}) =
      _$SignupParamsImpl;

  factory _SignupParams.fromJson(Map<String, dynamic> json) =
      _$SignupParamsImpl.fromJson;

  @override
  String get firstname;
  @override
  String get lastname;
  @override
  String get email;
  @override
  String get username;
  @override
  String get password;
  @override
  String get betaCode;
  @override
  String get address;
  @override
  @JsonKey(name: 'date_of_birth')
  String get dateOfBirth;

  /// Create a copy of SignupParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignupParamsImplCopyWith<_$SignupParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
