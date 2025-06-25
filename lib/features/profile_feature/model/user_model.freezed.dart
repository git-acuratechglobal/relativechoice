// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: "user")
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(name: "userOnboarding")
  UserOnboarding? get userOnboarding => throw _privateConstructorUsedError;
  @JsonKey(name: "userRelationShipChoices")
  UserRelationShipChoices? get userRelationShipChoices =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "userShowcaseImages")
  List<UserShowcaseImages>? get userShowcaseImages =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "detailedScores")
  DetailedScores? get detailedScore => throw _privateConstructorUsedError;
  @JsonKey(name: "averageScore")
  double? get averageScore => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "user") User? user,
      @JsonKey(name: "userOnboarding") UserOnboarding? userOnboarding,
      @JsonKey(name: "userRelationShipChoices")
      UserRelationShipChoices? userRelationShipChoices,
      @JsonKey(name: "userShowcaseImages")
      List<UserShowcaseImages>? userShowcaseImages,
      @JsonKey(name: "detailedScores") DetailedScores? detailedScore,
      @JsonKey(name: "averageScore") double? averageScore});

  $UserCopyWith<$Res>? get user;
  $UserOnboardingCopyWith<$Res>? get userOnboarding;
  $UserRelationShipChoicesCopyWith<$Res>? get userRelationShipChoices;
  $DetailedScoresCopyWith<$Res>? get detailedScore;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? userOnboarding = freezed,
    Object? userRelationShipChoices = freezed,
    Object? userShowcaseImages = freezed,
    Object? detailedScore = freezed,
    Object? averageScore = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      userOnboarding: freezed == userOnboarding
          ? _value.userOnboarding
          : userOnboarding // ignore: cast_nullable_to_non_nullable
              as UserOnboarding?,
      userRelationShipChoices: freezed == userRelationShipChoices
          ? _value.userRelationShipChoices
          : userRelationShipChoices // ignore: cast_nullable_to_non_nullable
              as UserRelationShipChoices?,
      userShowcaseImages: freezed == userShowcaseImages
          ? _value.userShowcaseImages
          : userShowcaseImages // ignore: cast_nullable_to_non_nullable
              as List<UserShowcaseImages>?,
      detailedScore: freezed == detailedScore
          ? _value.detailedScore
          : detailedScore // ignore: cast_nullable_to_non_nullable
              as DetailedScores?,
      averageScore: freezed == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserOnboardingCopyWith<$Res>? get userOnboarding {
    if (_value.userOnboarding == null) {
      return null;
    }

    return $UserOnboardingCopyWith<$Res>(_value.userOnboarding!, (value) {
      return _then(_value.copyWith(userOnboarding: value) as $Val);
    });
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserRelationShipChoicesCopyWith<$Res>? get userRelationShipChoices {
    if (_value.userRelationShipChoices == null) {
      return null;
    }

    return $UserRelationShipChoicesCopyWith<$Res>(
        _value.userRelationShipChoices!, (value) {
      return _then(_value.copyWith(userRelationShipChoices: value) as $Val);
    });
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DetailedScoresCopyWith<$Res>? get detailedScore {
    if (_value.detailedScore == null) {
      return null;
    }

    return $DetailedScoresCopyWith<$Res>(_value.detailedScore!, (value) {
      return _then(_value.copyWith(detailedScore: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "user") User? user,
      @JsonKey(name: "userOnboarding") UserOnboarding? userOnboarding,
      @JsonKey(name: "userRelationShipChoices")
      UserRelationShipChoices? userRelationShipChoices,
      @JsonKey(name: "userShowcaseImages")
      List<UserShowcaseImages>? userShowcaseImages,
      @JsonKey(name: "detailedScores") DetailedScores? detailedScore,
      @JsonKey(name: "averageScore") double? averageScore});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $UserOnboardingCopyWith<$Res>? get userOnboarding;
  @override
  $UserRelationShipChoicesCopyWith<$Res>? get userRelationShipChoices;
  @override
  $DetailedScoresCopyWith<$Res>? get detailedScore;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? userOnboarding = freezed,
    Object? userRelationShipChoices = freezed,
    Object? userShowcaseImages = freezed,
    Object? detailedScore = freezed,
    Object? averageScore = freezed,
  }) {
    return _then(_$UserModelImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      userOnboarding: freezed == userOnboarding
          ? _value.userOnboarding
          : userOnboarding // ignore: cast_nullable_to_non_nullable
              as UserOnboarding?,
      userRelationShipChoices: freezed == userRelationShipChoices
          ? _value.userRelationShipChoices
          : userRelationShipChoices // ignore: cast_nullable_to_non_nullable
              as UserRelationShipChoices?,
      userShowcaseImages: freezed == userShowcaseImages
          ? _value._userShowcaseImages
          : userShowcaseImages // ignore: cast_nullable_to_non_nullable
              as List<UserShowcaseImages>?,
      detailedScore: freezed == detailedScore
          ? _value.detailedScore
          : detailedScore // ignore: cast_nullable_to_non_nullable
              as DetailedScores?,
      averageScore: freezed == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {@JsonKey(name: "user") this.user,
      @JsonKey(name: "userOnboarding") this.userOnboarding,
      @JsonKey(name: "userRelationShipChoices") this.userRelationShipChoices,
      @JsonKey(name: "userShowcaseImages")
      final List<UserShowcaseImages>? userShowcaseImages,
      @JsonKey(name: "detailedScores") this.detailedScore,
      @JsonKey(name: "averageScore") this.averageScore})
      : _userShowcaseImages = userShowcaseImages;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey(name: "user")
  final User? user;
  @override
  @JsonKey(name: "userOnboarding")
  final UserOnboarding? userOnboarding;
  @override
  @JsonKey(name: "userRelationShipChoices")
  final UserRelationShipChoices? userRelationShipChoices;
  final List<UserShowcaseImages>? _userShowcaseImages;
  @override
  @JsonKey(name: "userShowcaseImages")
  List<UserShowcaseImages>? get userShowcaseImages {
    final value = _userShowcaseImages;
    if (value == null) return null;
    if (_userShowcaseImages is EqualUnmodifiableListView)
      return _userShowcaseImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "detailedScores")
  final DetailedScores? detailedScore;
  @override
  @JsonKey(name: "averageScore")
  final double? averageScore;

  @override
  String toString() {
    return 'UserModel(user: $user, userOnboarding: $userOnboarding, userRelationShipChoices: $userRelationShipChoices, userShowcaseImages: $userShowcaseImages, detailedScore: $detailedScore, averageScore: $averageScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.userOnboarding, userOnboarding) ||
                other.userOnboarding == userOnboarding) &&
            (identical(
                    other.userRelationShipChoices, userRelationShipChoices) ||
                other.userRelationShipChoices == userRelationShipChoices) &&
            const DeepCollectionEquality()
                .equals(other._userShowcaseImages, _userShowcaseImages) &&
            (identical(other.detailedScore, detailedScore) ||
                other.detailedScore == detailedScore) &&
            (identical(other.averageScore, averageScore) ||
                other.averageScore == averageScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      userOnboarding,
      userRelationShipChoices,
      const DeepCollectionEquality().hash(_userShowcaseImages),
      detailedScore,
      averageScore);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
          {@JsonKey(name: "user") final User? user,
          @JsonKey(name: "userOnboarding") final UserOnboarding? userOnboarding,
          @JsonKey(name: "userRelationShipChoices")
          final UserRelationShipChoices? userRelationShipChoices,
          @JsonKey(name: "userShowcaseImages")
          final List<UserShowcaseImages>? userShowcaseImages,
          @JsonKey(name: "detailedScores") final DetailedScores? detailedScore,
          @JsonKey(name: "averageScore") final double? averageScore}) =
      _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @JsonKey(name: "user")
  User? get user;
  @override
  @JsonKey(name: "userOnboarding")
  UserOnboarding? get userOnboarding;
  @override
  @JsonKey(name: "userRelationShipChoices")
  UserRelationShipChoices? get userRelationShipChoices;
  @override
  @JsonKey(name: "userShowcaseImages")
  List<UserShowcaseImages>? get userShowcaseImages;
  @override
  @JsonKey(name: "detailedScores")
  DetailedScores? get detailedScore;
  @override
  @JsonKey(name: "averageScore")
  double? get averageScore;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  int? get user_id => throw _privateConstructorUsedError;
  @JsonKey(name: "firstname")
  String? get firstname => throw _privateConstructorUsedError;
  @JsonKey(name: "lastname")
  String? get lastname => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "username")
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: "otp")
  dynamic get otp => throw _privateConstructorUsedError;
  @JsonKey(name: "otp_valid_upto")
  dynamic get otpValidUpto => throw _privateConstructorUsedError;
  @JsonKey(name: "email_verified_at")
  dynamic get emailVerifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  dynamic get image => throw _privateConstructorUsedError;
  @JsonKey(name: "address")
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: "date_of_birth")
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: "fcm_token")
  dynamic get fcmToken => throw _privateConstructorUsedError;
  @JsonKey(name: "delete_at")
  dynamic get deleteAt => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  int? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "betaCode")
  String? get betaCode => throw _privateConstructorUsedError;
  @JsonKey(name: "is_social")
  int? get isSocial => throw _privateConstructorUsedError;
  @JsonKey(name: "socialType")
  dynamic get socialType => throw _privateConstructorUsedError;
  @JsonKey(name: "otp_attempts")
  dynamic get otpAttempts => throw _privateConstructorUsedError;
  @JsonKey(name: "is_profile_completed")
  dynamic get isProfileCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: "total_score")
  double? get totalScore => throw _privateConstructorUsedError;
  List<UserShowcaseImages>? get user_show_case_images =>
      throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
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
      List<UserShowcaseImages>? user_show_case_images});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user_id = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? otp = freezed,
    Object? otpValidUpto = freezed,
    Object? emailVerifiedAt = freezed,
    Object? image = freezed,
    Object? address = freezed,
    Object? dateOfBirth = freezed,
    Object? fcmToken = freezed,
    Object? deleteAt = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? betaCode = freezed,
    Object? isSocial = freezed,
    Object? socialType = freezed,
    Object? otpAttempts = freezed,
    Object? isProfileCompleted = freezed,
    Object? totalScore = freezed,
    Object? user_show_case_images = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user_id: freezed == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstname: freezed == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as dynamic,
      otpValidUpto: freezed == otpValidUpto
          ? _value.otpValidUpto
          : otpValidUpto // ignore: cast_nullable_to_non_nullable
              as dynamic,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as dynamic,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deleteAt: freezed == deleteAt
          ? _value.deleteAt
          : deleteAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      betaCode: freezed == betaCode
          ? _value.betaCode
          : betaCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isSocial: freezed == isSocial
          ? _value.isSocial
          : isSocial // ignore: cast_nullable_to_non_nullable
              as int?,
      socialType: freezed == socialType
          ? _value.socialType
          : socialType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      otpAttempts: freezed == otpAttempts
          ? _value.otpAttempts
          : otpAttempts // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isProfileCompleted: freezed == isProfileCompleted
          ? _value.isProfileCompleted
          : isProfileCompleted // ignore: cast_nullable_to_non_nullable
              as dynamic,
      totalScore: freezed == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as double?,
      user_show_case_images: freezed == user_show_case_images
          ? _value.user_show_case_images
          : user_show_case_images // ignore: cast_nullable_to_non_nullable
              as List<UserShowcaseImages>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
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
      List<UserShowcaseImages>? user_show_case_images});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user_id = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? otp = freezed,
    Object? otpValidUpto = freezed,
    Object? emailVerifiedAt = freezed,
    Object? image = freezed,
    Object? address = freezed,
    Object? dateOfBirth = freezed,
    Object? fcmToken = freezed,
    Object? deleteAt = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? betaCode = freezed,
    Object? isSocial = freezed,
    Object? socialType = freezed,
    Object? otpAttempts = freezed,
    Object? isProfileCompleted = freezed,
    Object? totalScore = freezed,
    Object? user_show_case_images = freezed,
  }) {
    return _then(_$UserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user_id: freezed == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstname: freezed == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as dynamic,
      otpValidUpto: freezed == otpValidUpto
          ? _value.otpValidUpto
          : otpValidUpto // ignore: cast_nullable_to_non_nullable
              as dynamic,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as dynamic,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deleteAt: freezed == deleteAt
          ? _value.deleteAt
          : deleteAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      betaCode: freezed == betaCode
          ? _value.betaCode
          : betaCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isSocial: freezed == isSocial
          ? _value.isSocial
          : isSocial // ignore: cast_nullable_to_non_nullable
              as int?,
      socialType: freezed == socialType
          ? _value.socialType
          : socialType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      otpAttempts: freezed == otpAttempts
          ? _value.otpAttempts
          : otpAttempts // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isProfileCompleted: freezed == isProfileCompleted
          ? _value.isProfileCompleted
          : isProfileCompleted // ignore: cast_nullable_to_non_nullable
              as dynamic,
      totalScore: freezed == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as double?,
      user_show_case_images: freezed == user_show_case_images
          ? _value._user_show_case_images
          : user_show_case_images // ignore: cast_nullable_to_non_nullable
              as List<UserShowcaseImages>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@JsonKey(name: "id") this.id,
      this.user_id,
      @JsonKey(name: "firstname") this.firstname,
      @JsonKey(name: "lastname") this.lastname,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "username") this.username,
      @JsonKey(name: "otp") this.otp,
      @JsonKey(name: "otp_valid_upto") this.otpValidUpto,
      @JsonKey(name: "email_verified_at") this.emailVerifiedAt,
      @JsonKey(name: "image") this.image,
      @JsonKey(name: "address") this.address,
      @JsonKey(name: "date_of_birth") this.dateOfBirth,
      @JsonKey(name: "fcm_token") this.fcmToken,
      @JsonKey(name: "delete_at") this.deleteAt,
      @JsonKey(name: "is_active") this.isActive,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt,
      @JsonKey(name: "betaCode") this.betaCode,
      @JsonKey(name: "is_social") this.isSocial,
      @JsonKey(name: "socialType") this.socialType,
      @JsonKey(name: "otp_attempts") this.otpAttempts,
      @JsonKey(name: "is_profile_completed") this.isProfileCompleted,
      @JsonKey(name: "total_score") this.totalScore,
      final List<UserShowcaseImages>? user_show_case_images})
      : _user_show_case_images = user_show_case_images;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  final int? user_id;
  @override
  @JsonKey(name: "firstname")
  final String? firstname;
  @override
  @JsonKey(name: "lastname")
  final String? lastname;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "username")
  final String? username;
  @override
  @JsonKey(name: "otp")
  final dynamic otp;
  @override
  @JsonKey(name: "otp_valid_upto")
  final dynamic otpValidUpto;
  @override
  @JsonKey(name: "email_verified_at")
  final dynamic emailVerifiedAt;
  @override
  @JsonKey(name: "image")
  final dynamic image;
  @override
  @JsonKey(name: "address")
  final String? address;
  @override
  @JsonKey(name: "date_of_birth")
  final DateTime? dateOfBirth;
  @override
  @JsonKey(name: "fcm_token")
  final dynamic fcmToken;
  @override
  @JsonKey(name: "delete_at")
  final dynamic deleteAt;
  @override
  @JsonKey(name: "is_active")
  final int? isActive;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @override
  @JsonKey(name: "betaCode")
  final String? betaCode;
  @override
  @JsonKey(name: "is_social")
  final int? isSocial;
  @override
  @JsonKey(name: "socialType")
  final dynamic socialType;
  @override
  @JsonKey(name: "otp_attempts")
  final dynamic otpAttempts;
  @override
  @JsonKey(name: "is_profile_completed")
  final dynamic isProfileCompleted;
  @override
  @JsonKey(name: "total_score")
  final double? totalScore;
  final List<UserShowcaseImages>? _user_show_case_images;
  @override
  List<UserShowcaseImages>? get user_show_case_images {
    final value = _user_show_case_images;
    if (value == null) return null;
    if (_user_show_case_images is EqualUnmodifiableListView)
      return _user_show_case_images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'User(id: $id, user_id: $user_id, firstname: $firstname, lastname: $lastname, email: $email, username: $username, otp: $otp, otpValidUpto: $otpValidUpto, emailVerifiedAt: $emailVerifiedAt, image: $image, address: $address, dateOfBirth: $dateOfBirth, fcmToken: $fcmToken, deleteAt: $deleteAt, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, betaCode: $betaCode, isSocial: $isSocial, socialType: $socialType, otpAttempts: $otpAttempts, isProfileCompleted: $isProfileCompleted, totalScore: $totalScore, user_show_case_images: $user_show_case_images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            const DeepCollectionEquality().equals(other.otp, otp) &&
            const DeepCollectionEquality()
                .equals(other.otpValidUpto, otpValidUpto) &&
            const DeepCollectionEquality()
                .equals(other.emailVerifiedAt, emailVerifiedAt) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            const DeepCollectionEquality().equals(other.fcmToken, fcmToken) &&
            const DeepCollectionEquality().equals(other.deleteAt, deleteAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.betaCode, betaCode) ||
                other.betaCode == betaCode) &&
            (identical(other.isSocial, isSocial) ||
                other.isSocial == isSocial) &&
            const DeepCollectionEquality()
                .equals(other.socialType, socialType) &&
            const DeepCollectionEquality()
                .equals(other.otpAttempts, otpAttempts) &&
            const DeepCollectionEquality()
                .equals(other.isProfileCompleted, isProfileCompleted) &&
            (identical(other.totalScore, totalScore) ||
                other.totalScore == totalScore) &&
            const DeepCollectionEquality()
                .equals(other._user_show_case_images, _user_show_case_images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        user_id,
        firstname,
        lastname,
        email,
        username,
        const DeepCollectionEquality().hash(otp),
        const DeepCollectionEquality().hash(otpValidUpto),
        const DeepCollectionEquality().hash(emailVerifiedAt),
        const DeepCollectionEquality().hash(image),
        address,
        dateOfBirth,
        const DeepCollectionEquality().hash(fcmToken),
        const DeepCollectionEquality().hash(deleteAt),
        isActive,
        createdAt,
        updatedAt,
        betaCode,
        isSocial,
        const DeepCollectionEquality().hash(socialType),
        const DeepCollectionEquality().hash(otpAttempts),
        const DeepCollectionEquality().hash(isProfileCompleted),
        totalScore,
        const DeepCollectionEquality().hash(_user_show_case_images)
      ]);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(name: "id") final int? id,
      final int? user_id,
      @JsonKey(name: "firstname") final String? firstname,
      @JsonKey(name: "lastname") final String? lastname,
      @JsonKey(name: "email") final String? email,
      @JsonKey(name: "username") final String? username,
      @JsonKey(name: "otp") final dynamic otp,
      @JsonKey(name: "otp_valid_upto") final dynamic otpValidUpto,
      @JsonKey(name: "email_verified_at") final dynamic emailVerifiedAt,
      @JsonKey(name: "image") final dynamic image,
      @JsonKey(name: "address") final String? address,
      @JsonKey(name: "date_of_birth") final DateTime? dateOfBirth,
      @JsonKey(name: "fcm_token") final dynamic fcmToken,
      @JsonKey(name: "delete_at") final dynamic deleteAt,
      @JsonKey(name: "is_active") final int? isActive,
      @JsonKey(name: "created_at") final DateTime? createdAt,
      @JsonKey(name: "updated_at") final DateTime? updatedAt,
      @JsonKey(name: "betaCode") final String? betaCode,
      @JsonKey(name: "is_social") final int? isSocial,
      @JsonKey(name: "socialType") final dynamic socialType,
      @JsonKey(name: "otp_attempts") final dynamic otpAttempts,
      @JsonKey(name: "is_profile_completed") final dynamic isProfileCompleted,
      @JsonKey(name: "total_score") final double? totalScore,
      final List<UserShowcaseImages>? user_show_case_images}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  int? get user_id;
  @override
  @JsonKey(name: "firstname")
  String? get firstname;
  @override
  @JsonKey(name: "lastname")
  String? get lastname;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "username")
  String? get username;
  @override
  @JsonKey(name: "otp")
  dynamic get otp;
  @override
  @JsonKey(name: "otp_valid_upto")
  dynamic get otpValidUpto;
  @override
  @JsonKey(name: "email_verified_at")
  dynamic get emailVerifiedAt;
  @override
  @JsonKey(name: "image")
  dynamic get image;
  @override
  @JsonKey(name: "address")
  String? get address;
  @override
  @JsonKey(name: "date_of_birth")
  DateTime? get dateOfBirth;
  @override
  @JsonKey(name: "fcm_token")
  dynamic get fcmToken;
  @override
  @JsonKey(name: "delete_at")
  dynamic get deleteAt;
  @override
  @JsonKey(name: "is_active")
  int? get isActive;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;
  @override
  @JsonKey(name: "betaCode")
  String? get betaCode;
  @override
  @JsonKey(name: "is_social")
  int? get isSocial;
  @override
  @JsonKey(name: "socialType")
  dynamic get socialType;
  @override
  @JsonKey(name: "otp_attempts")
  dynamic get otpAttempts;
  @override
  @JsonKey(name: "is_profile_completed")
  dynamic get isProfileCompleted;
  @override
  @JsonKey(name: "total_score")
  double? get totalScore;
  @override
  List<UserShowcaseImages>? get user_show_case_images;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserOnboarding _$UserOnboardingFromJson(Map<String, dynamic> json) {
  return _UserOnboarding.fromJson(json);
}

/// @nodoc
mixin _$UserOnboarding {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "family_structure")
  String? get familyStructure => throw _privateConstructorUsedError;
  @JsonKey(name: "household")
  String? get household => throw _privateConstructorUsedError;
  @JsonKey(name: "household_additional_detail")
  String? get householdAdditionalDetail => throw _privateConstructorUsedError;
  @JsonKey(name: "family_consideration")
  String? get familyConsideration => throw _privateConstructorUsedError;
  @JsonKey(name: "partner_age")
  String? get partnerAge => throw _privateConstructorUsedError;
  @JsonKey(name: "number_of_children")
  String? get numberOfChildren => throw _privateConstructorUsedError;
  @JsonKey(name: "children_age_ranges")
  String? get childrenAgeRanges => throw _privateConstructorUsedError;
  @JsonKey(name: "primary_account_holder_education")
  String? get primaryAccountHolderEducation =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "partner_education")
  String? get partnerEducation => throw _privateConstructorUsedError;
  @JsonKey(name: "primary_account_holder_faith")
  String? get primaryAccountHolderFaith => throw _privateConstructorUsedError;
  @JsonKey(name: "primary_account_holder_devoutness_scale")
  String? get primaryAccountHolderDevoutnessScale =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "partner_faith")
  String? get partnerFaith => throw _privateConstructorUsedError;
  @JsonKey(name: "partner_devoutness_scale")
  String? get partnerDevoutnessScale => throw _privateConstructorUsedError;
  @JsonKey(name: "children_faith")
  dynamic get childrenFaith => throw _privateConstructorUsedError;
  @JsonKey(name: "children_devoutness_scale")
  dynamic get childrenDevoutnessScale => throw _privateConstructorUsedError;
  @JsonKey(name: "primary_account_holder_ethnicity")
  String? get primaryAccountHolderEthnicity =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "partner_ethnicity")
  String? get partnerEthnicity => throw _privateConstructorUsedError;
  @JsonKey(name: "children_ethnicity")
  String? get childrenEthnicity => throw _privateConstructorUsedError;
  @JsonKey(name: "primary_account_holder_politics")
  String? get primaryAccountHolderPolitics =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "partner_politics")
  String? get partnerPolitics => throw _privateConstructorUsedError;
  @JsonKey(name: "primary_account_holder_smoking")
  String? get primaryAccountHolderSmoking => throw _privateConstructorUsedError;
  @JsonKey(name: "primary_account_holder_drinking")
  String? get primaryAccountHolderDrinking =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "primary_account_holder_pets")
  String? get primaryAccountHolderPets => throw _privateConstructorUsedError;
  @JsonKey(name: "primary_account_holder_pets_additional_detail")
  String? get primaryAccountHolderPetsAdditionalDetail =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserOnboarding to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserOnboarding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserOnboardingCopyWith<UserOnboarding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserOnboardingCopyWith<$Res> {
  factory $UserOnboardingCopyWith(
          UserOnboarding value, $Res Function(UserOnboarding) then) =
      _$UserOnboardingCopyWithImpl<$Res, UserOnboarding>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
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
      @JsonKey(name: "children_devoutness_scale")
      dynamic childrenDevoutnessScale,
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
      @JsonKey(name: "updated_at") DateTime? updatedAt});
}

/// @nodoc
class _$UserOnboardingCopyWithImpl<$Res, $Val extends UserOnboarding>
    implements $UserOnboardingCopyWith<$Res> {
  _$UserOnboardingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserOnboarding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? familyStructure = freezed,
    Object? household = freezed,
    Object? householdAdditionalDetail = freezed,
    Object? familyConsideration = freezed,
    Object? partnerAge = freezed,
    Object? numberOfChildren = freezed,
    Object? childrenAgeRanges = freezed,
    Object? primaryAccountHolderEducation = freezed,
    Object? partnerEducation = freezed,
    Object? primaryAccountHolderFaith = freezed,
    Object? primaryAccountHolderDevoutnessScale = freezed,
    Object? partnerFaith = freezed,
    Object? partnerDevoutnessScale = freezed,
    Object? childrenFaith = freezed,
    Object? childrenDevoutnessScale = freezed,
    Object? primaryAccountHolderEthnicity = freezed,
    Object? partnerEthnicity = freezed,
    Object? childrenEthnicity = freezed,
    Object? primaryAccountHolderPolitics = freezed,
    Object? partnerPolitics = freezed,
    Object? primaryAccountHolderSmoking = freezed,
    Object? primaryAccountHolderDrinking = freezed,
    Object? primaryAccountHolderPets = freezed,
    Object? primaryAccountHolderPetsAdditionalDetail = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      familyStructure: freezed == familyStructure
          ? _value.familyStructure
          : familyStructure // ignore: cast_nullable_to_non_nullable
              as String?,
      household: freezed == household
          ? _value.household
          : household // ignore: cast_nullable_to_non_nullable
              as String?,
      householdAdditionalDetail: freezed == householdAdditionalDetail
          ? _value.householdAdditionalDetail
          : householdAdditionalDetail // ignore: cast_nullable_to_non_nullable
              as String?,
      familyConsideration: freezed == familyConsideration
          ? _value.familyConsideration
          : familyConsideration // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerAge: freezed == partnerAge
          ? _value.partnerAge
          : partnerAge // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfChildren: freezed == numberOfChildren
          ? _value.numberOfChildren
          : numberOfChildren // ignore: cast_nullable_to_non_nullable
              as String?,
      childrenAgeRanges: freezed == childrenAgeRanges
          ? _value.childrenAgeRanges
          : childrenAgeRanges // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryAccountHolderEducation: freezed == primaryAccountHolderEducation
          ? _value.primaryAccountHolderEducation
          : primaryAccountHolderEducation // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerEducation: freezed == partnerEducation
          ? _value.partnerEducation
          : partnerEducation // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryAccountHolderFaith: freezed == primaryAccountHolderFaith
          ? _value.primaryAccountHolderFaith
          : primaryAccountHolderFaith // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryAccountHolderDevoutnessScale: freezed ==
              primaryAccountHolderDevoutnessScale
          ? _value.primaryAccountHolderDevoutnessScale
          : primaryAccountHolderDevoutnessScale // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerFaith: freezed == partnerFaith
          ? _value.partnerFaith
          : partnerFaith // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerDevoutnessScale: freezed == partnerDevoutnessScale
          ? _value.partnerDevoutnessScale
          : partnerDevoutnessScale // ignore: cast_nullable_to_non_nullable
              as String?,
      childrenFaith: freezed == childrenFaith
          ? _value.childrenFaith
          : childrenFaith // ignore: cast_nullable_to_non_nullable
              as dynamic,
      childrenDevoutnessScale: freezed == childrenDevoutnessScale
          ? _value.childrenDevoutnessScale
          : childrenDevoutnessScale // ignore: cast_nullable_to_non_nullable
              as dynamic,
      primaryAccountHolderEthnicity: freezed == primaryAccountHolderEthnicity
          ? _value.primaryAccountHolderEthnicity
          : primaryAccountHolderEthnicity // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerEthnicity: freezed == partnerEthnicity
          ? _value.partnerEthnicity
          : partnerEthnicity // ignore: cast_nullable_to_non_nullable
              as String?,
      childrenEthnicity: freezed == childrenEthnicity
          ? _value.childrenEthnicity
          : childrenEthnicity // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryAccountHolderPolitics: freezed == primaryAccountHolderPolitics
          ? _value.primaryAccountHolderPolitics
          : primaryAccountHolderPolitics // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerPolitics: freezed == partnerPolitics
          ? _value.partnerPolitics
          : partnerPolitics // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryAccountHolderSmoking: freezed == primaryAccountHolderSmoking
          ? _value.primaryAccountHolderSmoking
          : primaryAccountHolderSmoking // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryAccountHolderDrinking: freezed == primaryAccountHolderDrinking
          ? _value.primaryAccountHolderDrinking
          : primaryAccountHolderDrinking // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryAccountHolderPets: freezed == primaryAccountHolderPets
          ? _value.primaryAccountHolderPets
          : primaryAccountHolderPets // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryAccountHolderPetsAdditionalDetail: freezed ==
              primaryAccountHolderPetsAdditionalDetail
          ? _value.primaryAccountHolderPetsAdditionalDetail
          : primaryAccountHolderPetsAdditionalDetail // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserOnboardingImplCopyWith<$Res>
    implements $UserOnboardingCopyWith<$Res> {
  factory _$$UserOnboardingImplCopyWith(_$UserOnboardingImpl value,
          $Res Function(_$UserOnboardingImpl) then) =
      __$$UserOnboardingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
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
      @JsonKey(name: "children_devoutness_scale")
      dynamic childrenDevoutnessScale,
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
      @JsonKey(name: "updated_at") DateTime? updatedAt});
}

/// @nodoc
class __$$UserOnboardingImplCopyWithImpl<$Res>
    extends _$UserOnboardingCopyWithImpl<$Res, _$UserOnboardingImpl>
    implements _$$UserOnboardingImplCopyWith<$Res> {
  __$$UserOnboardingImplCopyWithImpl(
      _$UserOnboardingImpl _value, $Res Function(_$UserOnboardingImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserOnboarding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? familyStructure = freezed,
    Object? household = freezed,
    Object? householdAdditionalDetail = freezed,
    Object? familyConsideration = freezed,
    Object? partnerAge = freezed,
    Object? numberOfChildren = freezed,
    Object? childrenAgeRanges = freezed,
    Object? primaryAccountHolderEducation = freezed,
    Object? partnerEducation = freezed,
    Object? primaryAccountHolderFaith = freezed,
    Object? primaryAccountHolderDevoutnessScale = freezed,
    Object? partnerFaith = freezed,
    Object? partnerDevoutnessScale = freezed,
    Object? childrenFaith = freezed,
    Object? childrenDevoutnessScale = freezed,
    Object? primaryAccountHolderEthnicity = freezed,
    Object? partnerEthnicity = freezed,
    Object? childrenEthnicity = freezed,
    Object? primaryAccountHolderPolitics = freezed,
    Object? partnerPolitics = freezed,
    Object? primaryAccountHolderSmoking = freezed,
    Object? primaryAccountHolderDrinking = freezed,
    Object? primaryAccountHolderPets = freezed,
    Object? primaryAccountHolderPetsAdditionalDetail = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserOnboardingImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      familyStructure: freezed == familyStructure
          ? _value.familyStructure
          : familyStructure // ignore: cast_nullable_to_non_nullable
              as String?,
      household: freezed == household
          ? _value.household
          : household // ignore: cast_nullable_to_non_nullable
              as String?,
      householdAdditionalDetail: freezed == householdAdditionalDetail
          ? _value.householdAdditionalDetail
          : householdAdditionalDetail // ignore: cast_nullable_to_non_nullable
              as String?,
      familyConsideration: freezed == familyConsideration
          ? _value.familyConsideration
          : familyConsideration // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerAge: freezed == partnerAge
          ? _value.partnerAge
          : partnerAge // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfChildren: freezed == numberOfChildren
          ? _value.numberOfChildren
          : numberOfChildren // ignore: cast_nullable_to_non_nullable
              as String?,
      childrenAgeRanges: freezed == childrenAgeRanges
          ? _value.childrenAgeRanges
          : childrenAgeRanges // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryAccountHolderEducation: freezed == primaryAccountHolderEducation
          ? _value.primaryAccountHolderEducation
          : primaryAccountHolderEducation // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerEducation: freezed == partnerEducation
          ? _value.partnerEducation
          : partnerEducation // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryAccountHolderFaith: freezed == primaryAccountHolderFaith
          ? _value.primaryAccountHolderFaith
          : primaryAccountHolderFaith // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryAccountHolderDevoutnessScale: freezed ==
              primaryAccountHolderDevoutnessScale
          ? _value.primaryAccountHolderDevoutnessScale
          : primaryAccountHolderDevoutnessScale // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerFaith: freezed == partnerFaith
          ? _value.partnerFaith
          : partnerFaith // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerDevoutnessScale: freezed == partnerDevoutnessScale
          ? _value.partnerDevoutnessScale
          : partnerDevoutnessScale // ignore: cast_nullable_to_non_nullable
              as String?,
      childrenFaith: freezed == childrenFaith
          ? _value.childrenFaith
          : childrenFaith // ignore: cast_nullable_to_non_nullable
              as dynamic,
      childrenDevoutnessScale: freezed == childrenDevoutnessScale
          ? _value.childrenDevoutnessScale
          : childrenDevoutnessScale // ignore: cast_nullable_to_non_nullable
              as dynamic,
      primaryAccountHolderEthnicity: freezed == primaryAccountHolderEthnicity
          ? _value.primaryAccountHolderEthnicity
          : primaryAccountHolderEthnicity // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerEthnicity: freezed == partnerEthnicity
          ? _value.partnerEthnicity
          : partnerEthnicity // ignore: cast_nullable_to_non_nullable
              as String?,
      childrenEthnicity: freezed == childrenEthnicity
          ? _value.childrenEthnicity
          : childrenEthnicity // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryAccountHolderPolitics: freezed == primaryAccountHolderPolitics
          ? _value.primaryAccountHolderPolitics
          : primaryAccountHolderPolitics // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerPolitics: freezed == partnerPolitics
          ? _value.partnerPolitics
          : partnerPolitics // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryAccountHolderSmoking: freezed == primaryAccountHolderSmoking
          ? _value.primaryAccountHolderSmoking
          : primaryAccountHolderSmoking // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryAccountHolderDrinking: freezed == primaryAccountHolderDrinking
          ? _value.primaryAccountHolderDrinking
          : primaryAccountHolderDrinking // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryAccountHolderPets: freezed == primaryAccountHolderPets
          ? _value.primaryAccountHolderPets
          : primaryAccountHolderPets // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryAccountHolderPetsAdditionalDetail: freezed ==
              primaryAccountHolderPetsAdditionalDetail
          ? _value.primaryAccountHolderPetsAdditionalDetail
          : primaryAccountHolderPetsAdditionalDetail // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserOnboardingImpl implements _UserOnboarding {
  const _$UserOnboardingImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "family_structure") this.familyStructure,
      @JsonKey(name: "household") this.household,
      @JsonKey(name: "household_additional_detail")
      this.householdAdditionalDetail,
      @JsonKey(name: "family_consideration") this.familyConsideration,
      @JsonKey(name: "partner_age") this.partnerAge,
      @JsonKey(name: "number_of_children") this.numberOfChildren,
      @JsonKey(name: "children_age_ranges") this.childrenAgeRanges,
      @JsonKey(name: "primary_account_holder_education")
      this.primaryAccountHolderEducation,
      @JsonKey(name: "partner_education") this.partnerEducation,
      @JsonKey(name: "primary_account_holder_faith")
      this.primaryAccountHolderFaith,
      @JsonKey(name: "primary_account_holder_devoutness_scale")
      this.primaryAccountHolderDevoutnessScale,
      @JsonKey(name: "partner_faith") this.partnerFaith,
      @JsonKey(name: "partner_devoutness_scale") this.partnerDevoutnessScale,
      @JsonKey(name: "children_faith") this.childrenFaith,
      @JsonKey(name: "children_devoutness_scale") this.childrenDevoutnessScale,
      @JsonKey(name: "primary_account_holder_ethnicity")
      this.primaryAccountHolderEthnicity,
      @JsonKey(name: "partner_ethnicity") this.partnerEthnicity,
      @JsonKey(name: "children_ethnicity") this.childrenEthnicity,
      @JsonKey(name: "primary_account_holder_politics")
      this.primaryAccountHolderPolitics,
      @JsonKey(name: "partner_politics") this.partnerPolitics,
      @JsonKey(name: "primary_account_holder_smoking")
      this.primaryAccountHolderSmoking,
      @JsonKey(name: "primary_account_holder_drinking")
      this.primaryAccountHolderDrinking,
      @JsonKey(name: "primary_account_holder_pets")
      this.primaryAccountHolderPets,
      @JsonKey(name: "primary_account_holder_pets_additional_detail")
      this.primaryAccountHolderPetsAdditionalDetail,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt});

  factory _$UserOnboardingImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserOnboardingImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "user_id")
  final int? userId;
  @override
  @JsonKey(name: "family_structure")
  final String? familyStructure;
  @override
  @JsonKey(name: "household")
  final String? household;
  @override
  @JsonKey(name: "household_additional_detail")
  final String? householdAdditionalDetail;
  @override
  @JsonKey(name: "family_consideration")
  final String? familyConsideration;
  @override
  @JsonKey(name: "partner_age")
  final String? partnerAge;
  @override
  @JsonKey(name: "number_of_children")
  final String? numberOfChildren;
  @override
  @JsonKey(name: "children_age_ranges")
  final String? childrenAgeRanges;
  @override
  @JsonKey(name: "primary_account_holder_education")
  final String? primaryAccountHolderEducation;
  @override
  @JsonKey(name: "partner_education")
  final String? partnerEducation;
  @override
  @JsonKey(name: "primary_account_holder_faith")
  final String? primaryAccountHolderFaith;
  @override
  @JsonKey(name: "primary_account_holder_devoutness_scale")
  final String? primaryAccountHolderDevoutnessScale;
  @override
  @JsonKey(name: "partner_faith")
  final String? partnerFaith;
  @override
  @JsonKey(name: "partner_devoutness_scale")
  final String? partnerDevoutnessScale;
  @override
  @JsonKey(name: "children_faith")
  final dynamic childrenFaith;
  @override
  @JsonKey(name: "children_devoutness_scale")
  final dynamic childrenDevoutnessScale;
  @override
  @JsonKey(name: "primary_account_holder_ethnicity")
  final String? primaryAccountHolderEthnicity;
  @override
  @JsonKey(name: "partner_ethnicity")
  final String? partnerEthnicity;
  @override
  @JsonKey(name: "children_ethnicity")
  final String? childrenEthnicity;
  @override
  @JsonKey(name: "primary_account_holder_politics")
  final String? primaryAccountHolderPolitics;
  @override
  @JsonKey(name: "partner_politics")
  final String? partnerPolitics;
  @override
  @JsonKey(name: "primary_account_holder_smoking")
  final String? primaryAccountHolderSmoking;
  @override
  @JsonKey(name: "primary_account_holder_drinking")
  final String? primaryAccountHolderDrinking;
  @override
  @JsonKey(name: "primary_account_holder_pets")
  final String? primaryAccountHolderPets;
  @override
  @JsonKey(name: "primary_account_holder_pets_additional_detail")
  final String? primaryAccountHolderPetsAdditionalDetail;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserOnboarding(id: $id, userId: $userId, familyStructure: $familyStructure, household: $household, householdAdditionalDetail: $householdAdditionalDetail, familyConsideration: $familyConsideration, partnerAge: $partnerAge, numberOfChildren: $numberOfChildren, childrenAgeRanges: $childrenAgeRanges, primaryAccountHolderEducation: $primaryAccountHolderEducation, partnerEducation: $partnerEducation, primaryAccountHolderFaith: $primaryAccountHolderFaith, primaryAccountHolderDevoutnessScale: $primaryAccountHolderDevoutnessScale, partnerFaith: $partnerFaith, partnerDevoutnessScale: $partnerDevoutnessScale, childrenFaith: $childrenFaith, childrenDevoutnessScale: $childrenDevoutnessScale, primaryAccountHolderEthnicity: $primaryAccountHolderEthnicity, partnerEthnicity: $partnerEthnicity, childrenEthnicity: $childrenEthnicity, primaryAccountHolderPolitics: $primaryAccountHolderPolitics, partnerPolitics: $partnerPolitics, primaryAccountHolderSmoking: $primaryAccountHolderSmoking, primaryAccountHolderDrinking: $primaryAccountHolderDrinking, primaryAccountHolderPets: $primaryAccountHolderPets, primaryAccountHolderPetsAdditionalDetail: $primaryAccountHolderPetsAdditionalDetail, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserOnboardingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.familyStructure, familyStructure) ||
                other.familyStructure == familyStructure) &&
            (identical(other.household, household) ||
                other.household == household) &&
            (identical(other.householdAdditionalDetail, householdAdditionalDetail) ||
                other.householdAdditionalDetail == householdAdditionalDetail) &&
            (identical(other.familyConsideration, familyConsideration) ||
                other.familyConsideration == familyConsideration) &&
            (identical(other.partnerAge, partnerAge) ||
                other.partnerAge == partnerAge) &&
            (identical(other.numberOfChildren, numberOfChildren) ||
                other.numberOfChildren == numberOfChildren) &&
            (identical(other.childrenAgeRanges, childrenAgeRanges) ||
                other.childrenAgeRanges == childrenAgeRanges) &&
            (identical(other.primaryAccountHolderEducation, primaryAccountHolderEducation) ||
                other.primaryAccountHolderEducation ==
                    primaryAccountHolderEducation) &&
            (identical(other.partnerEducation, partnerEducation) ||
                other.partnerEducation == partnerEducation) &&
            (identical(other.primaryAccountHolderFaith, primaryAccountHolderFaith) ||
                other.primaryAccountHolderFaith == primaryAccountHolderFaith) &&
            (identical(other.primaryAccountHolderDevoutnessScale, primaryAccountHolderDevoutnessScale) ||
                other.primaryAccountHolderDevoutnessScale ==
                    primaryAccountHolderDevoutnessScale) &&
            (identical(other.partnerFaith, partnerFaith) ||
                other.partnerFaith == partnerFaith) &&
            (identical(other.partnerDevoutnessScale, partnerDevoutnessScale) ||
                other.partnerDevoutnessScale == partnerDevoutnessScale) &&
            const DeepCollectionEquality()
                .equals(other.childrenFaith, childrenFaith) &&
            const DeepCollectionEquality().equals(
                other.childrenDevoutnessScale, childrenDevoutnessScale) &&
            (identical(other.primaryAccountHolderEthnicity, primaryAccountHolderEthnicity) ||
                other.primaryAccountHolderEthnicity ==
                    primaryAccountHolderEthnicity) &&
            (identical(other.partnerEthnicity, partnerEthnicity) ||
                other.partnerEthnicity == partnerEthnicity) &&
            (identical(other.childrenEthnicity, childrenEthnicity) ||
                other.childrenEthnicity == childrenEthnicity) &&
            (identical(other.primaryAccountHolderPolitics, primaryAccountHolderPolitics) ||
                other.primaryAccountHolderPolitics ==
                    primaryAccountHolderPolitics) &&
            (identical(other.partnerPolitics, partnerPolitics) ||
                other.partnerPolitics == partnerPolitics) &&
            (identical(other.primaryAccountHolderSmoking, primaryAccountHolderSmoking) ||
                other.primaryAccountHolderSmoking ==
                    primaryAccountHolderSmoking) &&
            (identical(other.primaryAccountHolderDrinking, primaryAccountHolderDrinking) || other.primaryAccountHolderDrinking == primaryAccountHolderDrinking) &&
            (identical(other.primaryAccountHolderPets, primaryAccountHolderPets) || other.primaryAccountHolderPets == primaryAccountHolderPets) &&
            (identical(other.primaryAccountHolderPetsAdditionalDetail, primaryAccountHolderPetsAdditionalDetail) || other.primaryAccountHolderPetsAdditionalDetail == primaryAccountHolderPetsAdditionalDetail) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        familyStructure,
        household,
        householdAdditionalDetail,
        familyConsideration,
        partnerAge,
        numberOfChildren,
        childrenAgeRanges,
        primaryAccountHolderEducation,
        partnerEducation,
        primaryAccountHolderFaith,
        primaryAccountHolderDevoutnessScale,
        partnerFaith,
        partnerDevoutnessScale,
        const DeepCollectionEquality().hash(childrenFaith),
        const DeepCollectionEquality().hash(childrenDevoutnessScale),
        primaryAccountHolderEthnicity,
        partnerEthnicity,
        childrenEthnicity,
        primaryAccountHolderPolitics,
        partnerPolitics,
        primaryAccountHolderSmoking,
        primaryAccountHolderDrinking,
        primaryAccountHolderPets,
        primaryAccountHolderPetsAdditionalDetail,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of UserOnboarding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserOnboardingImplCopyWith<_$UserOnboardingImpl> get copyWith =>
      __$$UserOnboardingImplCopyWithImpl<_$UserOnboardingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserOnboardingImplToJson(
      this,
    );
  }
}

abstract class _UserOnboarding implements UserOnboarding {
  const factory _UserOnboarding(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "user_id") final int? userId,
      @JsonKey(name: "family_structure") final String? familyStructure,
      @JsonKey(name: "household") final String? household,
      @JsonKey(name: "household_additional_detail")
      final String? householdAdditionalDetail,
      @JsonKey(name: "family_consideration") final String? familyConsideration,
      @JsonKey(name: "partner_age") final String? partnerAge,
      @JsonKey(name: "number_of_children") final String? numberOfChildren,
      @JsonKey(name: "children_age_ranges") final String? childrenAgeRanges,
      @JsonKey(name: "primary_account_holder_education")
      final String? primaryAccountHolderEducation,
      @JsonKey(name: "partner_education") final String? partnerEducation,
      @JsonKey(name: "primary_account_holder_faith")
      final String? primaryAccountHolderFaith,
      @JsonKey(name: "primary_account_holder_devoutness_scale")
      final String? primaryAccountHolderDevoutnessScale,
      @JsonKey(name: "partner_faith") final String? partnerFaith,
      @JsonKey(name: "partner_devoutness_scale")
      final String? partnerDevoutnessScale,
      @JsonKey(name: "children_faith") final dynamic childrenFaith,
      @JsonKey(name: "children_devoutness_scale")
      final dynamic childrenDevoutnessScale,
      @JsonKey(name: "primary_account_holder_ethnicity")
      final String? primaryAccountHolderEthnicity,
      @JsonKey(name: "partner_ethnicity") final String? partnerEthnicity,
      @JsonKey(name: "children_ethnicity") final String? childrenEthnicity,
      @JsonKey(name: "primary_account_holder_politics")
      final String? primaryAccountHolderPolitics,
      @JsonKey(name: "partner_politics") final String? partnerPolitics,
      @JsonKey(name: "primary_account_holder_smoking")
      final String? primaryAccountHolderSmoking,
      @JsonKey(name: "primary_account_holder_drinking")
      final String? primaryAccountHolderDrinking,
      @JsonKey(name: "primary_account_holder_pets")
      final String? primaryAccountHolderPets,
      @JsonKey(name: "primary_account_holder_pets_additional_detail")
      final String? primaryAccountHolderPetsAdditionalDetail,
      @JsonKey(name: "created_at") final DateTime? createdAt,
      @JsonKey(name: "updated_at")
      final DateTime? updatedAt}) = _$UserOnboardingImpl;

  factory _UserOnboarding.fromJson(Map<String, dynamic> json) =
      _$UserOnboardingImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "user_id")
  int? get userId;
  @override
  @JsonKey(name: "family_structure")
  String? get familyStructure;
  @override
  @JsonKey(name: "household")
  String? get household;
  @override
  @JsonKey(name: "household_additional_detail")
  String? get householdAdditionalDetail;
  @override
  @JsonKey(name: "family_consideration")
  String? get familyConsideration;
  @override
  @JsonKey(name: "partner_age")
  String? get partnerAge;
  @override
  @JsonKey(name: "number_of_children")
  String? get numberOfChildren;
  @override
  @JsonKey(name: "children_age_ranges")
  String? get childrenAgeRanges;
  @override
  @JsonKey(name: "primary_account_holder_education")
  String? get primaryAccountHolderEducation;
  @override
  @JsonKey(name: "partner_education")
  String? get partnerEducation;
  @override
  @JsonKey(name: "primary_account_holder_faith")
  String? get primaryAccountHolderFaith;
  @override
  @JsonKey(name: "primary_account_holder_devoutness_scale")
  String? get primaryAccountHolderDevoutnessScale;
  @override
  @JsonKey(name: "partner_faith")
  String? get partnerFaith;
  @override
  @JsonKey(name: "partner_devoutness_scale")
  String? get partnerDevoutnessScale;
  @override
  @JsonKey(name: "children_faith")
  dynamic get childrenFaith;
  @override
  @JsonKey(name: "children_devoutness_scale")
  dynamic get childrenDevoutnessScale;
  @override
  @JsonKey(name: "primary_account_holder_ethnicity")
  String? get primaryAccountHolderEthnicity;
  @override
  @JsonKey(name: "partner_ethnicity")
  String? get partnerEthnicity;
  @override
  @JsonKey(name: "children_ethnicity")
  String? get childrenEthnicity;
  @override
  @JsonKey(name: "primary_account_holder_politics")
  String? get primaryAccountHolderPolitics;
  @override
  @JsonKey(name: "partner_politics")
  String? get partnerPolitics;
  @override
  @JsonKey(name: "primary_account_holder_smoking")
  String? get primaryAccountHolderSmoking;
  @override
  @JsonKey(name: "primary_account_holder_drinking")
  String? get primaryAccountHolderDrinking;
  @override
  @JsonKey(name: "primary_account_holder_pets")
  String? get primaryAccountHolderPets;
  @override
  @JsonKey(name: "primary_account_holder_pets_additional_detail")
  String? get primaryAccountHolderPetsAdditionalDetail;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;

  /// Create a copy of UserOnboarding
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserOnboardingImplCopyWith<_$UserOnboardingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserRelationShipChoices _$UserRelationShipChoicesFromJson(
    Map<String, dynamic> json) {
  return _UserRelationShipChoices.fromJson(json);
}

/// @nodoc
mixin _$UserRelationShipChoices {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "roles_sought")
  String? get rolesSought => throw _privateConstructorUsedError;
  @JsonKey(name: "roles_to_fulfil")
  String? get rolesToFulfil => throw _privateConstructorUsedError;
  @JsonKey(name: "involvement")
  String? get involvement => throw _privateConstructorUsedError;
  @JsonKey(name: "involvement_specific")
  dynamic get involvementSpecific => throw _privateConstructorUsedError;
  @JsonKey(name: "involvement_additional_details")
  dynamic get involvementAdditionalDetails =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "distance_range")
  String? get distanceRange => throw _privateConstructorUsedError;
  @JsonKey(name: "additional_location")
  dynamic get additionalLocation => throw _privateConstructorUsedError;
  @JsonKey(name: "roles_sought_faith_preferences")
  String? get rolesSoughtFaithPreferences => throw _privateConstructorUsedError;
  @JsonKey(name: "roles_sought_devoutness_scale")
  String? get rolesSoughtDevoutnessScale => throw _privateConstructorUsedError;
  @JsonKey(name: "roles_sought_faith_preferences_is_deal_breaker")
  int? get rolesSoughtFaithPreferencesIsDealBreaker =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "roles_sought_faith_preferences_aditional_details")
  dynamic get rolesSoughtFaithPreferencesAditionalDetails =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "roles_sought_ethnicity")
  String? get rolesSoughtEthnicity => throw _privateConstructorUsedError;
  @JsonKey(name: "roles_sought_ethnicity_is_deal_breaker")
  int? get rolesSoughtEthnicityIsDealBreaker =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "roles_sought_ethnicity_additional_details")
  dynamic get rolesSoughtEthnicityAdditionalDetails =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "roles_sought_political_preferences")
  String? get rolesSoughtPoliticalPreferences =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "roles_sought_political_preferences_is_deal_breaker")
  int? get rolesSoughtPoliticalPreferencesIsDealBreaker =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "roles_sought_political_preferences_additional_detail")
  dynamic get rolesSoughtPoliticalPreferencesAdditionalDetail =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "roles_sought_smoking")
  String? get rolesSoughtSmoking => throw _privateConstructorUsedError;
  @JsonKey(name: "roles_sought_smoking_is_deal_breaker")
  int? get rolesSoughtSmokingIsDealBreaker =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "roles_sought_smoking_additional_details")
  dynamic get rolesSoughtSmokingAdditionalDetails =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "roles_sought_drinking")
  String? get rolesSoughtDrinking => throw _privateConstructorUsedError;
  @JsonKey(name: "roles_sought_drinking_is_deal_breaker")
  int? get rolesSoughtDrinkingIsDealBreaker =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "roles_sought_drinking_additional_details")
  dynamic get rolesSoughtDrinkingAdditionalDetails =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "roles_sought_pet_type")
  String? get rolesSoughtPetType => throw _privateConstructorUsedError;
  @JsonKey(name: "roles_sought_pet_type_is_deal_breaker")
  int? get rolesSoughtPetTypeIsDealBreaker =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "roles_sought_pet_type_additional_details")
  dynamic get rolesSoughtPetTypeAdditionalDetails =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "roles_sought_lifestyle_notes")
  dynamic get rolesSoughtLifestyleNotes => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserRelationShipChoices to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserRelationShipChoices
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserRelationShipChoicesCopyWith<UserRelationShipChoices> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRelationShipChoicesCopyWith<$Res> {
  factory $UserRelationShipChoicesCopyWith(UserRelationShipChoices value,
          $Res Function(UserRelationShipChoices) then) =
      _$UserRelationShipChoicesCopyWithImpl<$Res, UserRelationShipChoices>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
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
      @JsonKey(name: "updated_at") DateTime? updatedAt});
}

/// @nodoc
class _$UserRelationShipChoicesCopyWithImpl<$Res,
        $Val extends UserRelationShipChoices>
    implements $UserRelationShipChoicesCopyWith<$Res> {
  _$UserRelationShipChoicesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserRelationShipChoices
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? rolesSought = freezed,
    Object? rolesToFulfil = freezed,
    Object? involvement = freezed,
    Object? involvementSpecific = freezed,
    Object? involvementAdditionalDetails = freezed,
    Object? distanceRange = freezed,
    Object? additionalLocation = freezed,
    Object? rolesSoughtFaithPreferences = freezed,
    Object? rolesSoughtDevoutnessScale = freezed,
    Object? rolesSoughtFaithPreferencesIsDealBreaker = freezed,
    Object? rolesSoughtFaithPreferencesAditionalDetails = freezed,
    Object? rolesSoughtEthnicity = freezed,
    Object? rolesSoughtEthnicityIsDealBreaker = freezed,
    Object? rolesSoughtEthnicityAdditionalDetails = freezed,
    Object? rolesSoughtPoliticalPreferences = freezed,
    Object? rolesSoughtPoliticalPreferencesIsDealBreaker = freezed,
    Object? rolesSoughtPoliticalPreferencesAdditionalDetail = freezed,
    Object? rolesSoughtSmoking = freezed,
    Object? rolesSoughtSmokingIsDealBreaker = freezed,
    Object? rolesSoughtSmokingAdditionalDetails = freezed,
    Object? rolesSoughtDrinking = freezed,
    Object? rolesSoughtDrinkingIsDealBreaker = freezed,
    Object? rolesSoughtDrinkingAdditionalDetails = freezed,
    Object? rolesSoughtPetType = freezed,
    Object? rolesSoughtPetTypeIsDealBreaker = freezed,
    Object? rolesSoughtPetTypeAdditionalDetails = freezed,
    Object? rolesSoughtLifestyleNotes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      rolesSought: freezed == rolesSought
          ? _value.rolesSought
          : rolesSought // ignore: cast_nullable_to_non_nullable
              as String?,
      rolesToFulfil: freezed == rolesToFulfil
          ? _value.rolesToFulfil
          : rolesToFulfil // ignore: cast_nullable_to_non_nullable
              as String?,
      involvement: freezed == involvement
          ? _value.involvement
          : involvement // ignore: cast_nullable_to_non_nullable
              as String?,
      involvementSpecific: freezed == involvementSpecific
          ? _value.involvementSpecific
          : involvementSpecific // ignore: cast_nullable_to_non_nullable
              as dynamic,
      involvementAdditionalDetails: freezed == involvementAdditionalDetails
          ? _value.involvementAdditionalDetails
          : involvementAdditionalDetails // ignore: cast_nullable_to_non_nullable
              as dynamic,
      distanceRange: freezed == distanceRange
          ? _value.distanceRange
          : distanceRange // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalLocation: freezed == additionalLocation
          ? _value.additionalLocation
          : additionalLocation // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rolesSoughtFaithPreferences: freezed == rolesSoughtFaithPreferences
          ? _value.rolesSoughtFaithPreferences
          : rolesSoughtFaithPreferences // ignore: cast_nullable_to_non_nullable
              as String?,
      rolesSoughtDevoutnessScale: freezed == rolesSoughtDevoutnessScale
          ? _value.rolesSoughtDevoutnessScale
          : rolesSoughtDevoutnessScale // ignore: cast_nullable_to_non_nullable
              as String?,
      rolesSoughtFaithPreferencesIsDealBreaker: freezed ==
              rolesSoughtFaithPreferencesIsDealBreaker
          ? _value.rolesSoughtFaithPreferencesIsDealBreaker
          : rolesSoughtFaithPreferencesIsDealBreaker // ignore: cast_nullable_to_non_nullable
              as int?,
      rolesSoughtFaithPreferencesAditionalDetails: freezed ==
              rolesSoughtFaithPreferencesAditionalDetails
          ? _value.rolesSoughtFaithPreferencesAditionalDetails
          : rolesSoughtFaithPreferencesAditionalDetails // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rolesSoughtEthnicity: freezed == rolesSoughtEthnicity
          ? _value.rolesSoughtEthnicity
          : rolesSoughtEthnicity // ignore: cast_nullable_to_non_nullable
              as String?,
      rolesSoughtEthnicityIsDealBreaker: freezed ==
              rolesSoughtEthnicityIsDealBreaker
          ? _value.rolesSoughtEthnicityIsDealBreaker
          : rolesSoughtEthnicityIsDealBreaker // ignore: cast_nullable_to_non_nullable
              as int?,
      rolesSoughtEthnicityAdditionalDetails: freezed ==
              rolesSoughtEthnicityAdditionalDetails
          ? _value.rolesSoughtEthnicityAdditionalDetails
          : rolesSoughtEthnicityAdditionalDetails // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rolesSoughtPoliticalPreferences: freezed ==
              rolesSoughtPoliticalPreferences
          ? _value.rolesSoughtPoliticalPreferences
          : rolesSoughtPoliticalPreferences // ignore: cast_nullable_to_non_nullable
              as String?,
      rolesSoughtPoliticalPreferencesIsDealBreaker: freezed ==
              rolesSoughtPoliticalPreferencesIsDealBreaker
          ? _value.rolesSoughtPoliticalPreferencesIsDealBreaker
          : rolesSoughtPoliticalPreferencesIsDealBreaker // ignore: cast_nullable_to_non_nullable
              as int?,
      rolesSoughtPoliticalPreferencesAdditionalDetail: freezed ==
              rolesSoughtPoliticalPreferencesAdditionalDetail
          ? _value.rolesSoughtPoliticalPreferencesAdditionalDetail
          : rolesSoughtPoliticalPreferencesAdditionalDetail // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rolesSoughtSmoking: freezed == rolesSoughtSmoking
          ? _value.rolesSoughtSmoking
          : rolesSoughtSmoking // ignore: cast_nullable_to_non_nullable
              as String?,
      rolesSoughtSmokingIsDealBreaker: freezed ==
              rolesSoughtSmokingIsDealBreaker
          ? _value.rolesSoughtSmokingIsDealBreaker
          : rolesSoughtSmokingIsDealBreaker // ignore: cast_nullable_to_non_nullable
              as int?,
      rolesSoughtSmokingAdditionalDetails: freezed ==
              rolesSoughtSmokingAdditionalDetails
          ? _value.rolesSoughtSmokingAdditionalDetails
          : rolesSoughtSmokingAdditionalDetails // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rolesSoughtDrinking: freezed == rolesSoughtDrinking
          ? _value.rolesSoughtDrinking
          : rolesSoughtDrinking // ignore: cast_nullable_to_non_nullable
              as String?,
      rolesSoughtDrinkingIsDealBreaker: freezed ==
              rolesSoughtDrinkingIsDealBreaker
          ? _value.rolesSoughtDrinkingIsDealBreaker
          : rolesSoughtDrinkingIsDealBreaker // ignore: cast_nullable_to_non_nullable
              as int?,
      rolesSoughtDrinkingAdditionalDetails: freezed ==
              rolesSoughtDrinkingAdditionalDetails
          ? _value.rolesSoughtDrinkingAdditionalDetails
          : rolesSoughtDrinkingAdditionalDetails // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rolesSoughtPetType: freezed == rolesSoughtPetType
          ? _value.rolesSoughtPetType
          : rolesSoughtPetType // ignore: cast_nullable_to_non_nullable
              as String?,
      rolesSoughtPetTypeIsDealBreaker: freezed ==
              rolesSoughtPetTypeIsDealBreaker
          ? _value.rolesSoughtPetTypeIsDealBreaker
          : rolesSoughtPetTypeIsDealBreaker // ignore: cast_nullable_to_non_nullable
              as int?,
      rolesSoughtPetTypeAdditionalDetails: freezed ==
              rolesSoughtPetTypeAdditionalDetails
          ? _value.rolesSoughtPetTypeAdditionalDetails
          : rolesSoughtPetTypeAdditionalDetails // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rolesSoughtLifestyleNotes: freezed == rolesSoughtLifestyleNotes
          ? _value.rolesSoughtLifestyleNotes
          : rolesSoughtLifestyleNotes // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRelationShipChoicesImplCopyWith<$Res>
    implements $UserRelationShipChoicesCopyWith<$Res> {
  factory _$$UserRelationShipChoicesImplCopyWith(
          _$UserRelationShipChoicesImpl value,
          $Res Function(_$UserRelationShipChoicesImpl) then) =
      __$$UserRelationShipChoicesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
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
      @JsonKey(name: "updated_at") DateTime? updatedAt});
}

/// @nodoc
class __$$UserRelationShipChoicesImplCopyWithImpl<$Res>
    extends _$UserRelationShipChoicesCopyWithImpl<$Res,
        _$UserRelationShipChoicesImpl>
    implements _$$UserRelationShipChoicesImplCopyWith<$Res> {
  __$$UserRelationShipChoicesImplCopyWithImpl(
      _$UserRelationShipChoicesImpl _value,
      $Res Function(_$UserRelationShipChoicesImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserRelationShipChoices
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? rolesSought = freezed,
    Object? rolesToFulfil = freezed,
    Object? involvement = freezed,
    Object? involvementSpecific = freezed,
    Object? involvementAdditionalDetails = freezed,
    Object? distanceRange = freezed,
    Object? additionalLocation = freezed,
    Object? rolesSoughtFaithPreferences = freezed,
    Object? rolesSoughtDevoutnessScale = freezed,
    Object? rolesSoughtFaithPreferencesIsDealBreaker = freezed,
    Object? rolesSoughtFaithPreferencesAditionalDetails = freezed,
    Object? rolesSoughtEthnicity = freezed,
    Object? rolesSoughtEthnicityIsDealBreaker = freezed,
    Object? rolesSoughtEthnicityAdditionalDetails = freezed,
    Object? rolesSoughtPoliticalPreferences = freezed,
    Object? rolesSoughtPoliticalPreferencesIsDealBreaker = freezed,
    Object? rolesSoughtPoliticalPreferencesAdditionalDetail = freezed,
    Object? rolesSoughtSmoking = freezed,
    Object? rolesSoughtSmokingIsDealBreaker = freezed,
    Object? rolesSoughtSmokingAdditionalDetails = freezed,
    Object? rolesSoughtDrinking = freezed,
    Object? rolesSoughtDrinkingIsDealBreaker = freezed,
    Object? rolesSoughtDrinkingAdditionalDetails = freezed,
    Object? rolesSoughtPetType = freezed,
    Object? rolesSoughtPetTypeIsDealBreaker = freezed,
    Object? rolesSoughtPetTypeAdditionalDetails = freezed,
    Object? rolesSoughtLifestyleNotes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserRelationShipChoicesImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      rolesSought: freezed == rolesSought
          ? _value.rolesSought
          : rolesSought // ignore: cast_nullable_to_non_nullable
              as String?,
      rolesToFulfil: freezed == rolesToFulfil
          ? _value.rolesToFulfil
          : rolesToFulfil // ignore: cast_nullable_to_non_nullable
              as String?,
      involvement: freezed == involvement
          ? _value.involvement
          : involvement // ignore: cast_nullable_to_non_nullable
              as String?,
      involvementSpecific: freezed == involvementSpecific
          ? _value.involvementSpecific
          : involvementSpecific // ignore: cast_nullable_to_non_nullable
              as dynamic,
      involvementAdditionalDetails: freezed == involvementAdditionalDetails
          ? _value.involvementAdditionalDetails
          : involvementAdditionalDetails // ignore: cast_nullable_to_non_nullable
              as dynamic,
      distanceRange: freezed == distanceRange
          ? _value.distanceRange
          : distanceRange // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalLocation: freezed == additionalLocation
          ? _value.additionalLocation
          : additionalLocation // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rolesSoughtFaithPreferences: freezed == rolesSoughtFaithPreferences
          ? _value.rolesSoughtFaithPreferences
          : rolesSoughtFaithPreferences // ignore: cast_nullable_to_non_nullable
              as String?,
      rolesSoughtDevoutnessScale: freezed == rolesSoughtDevoutnessScale
          ? _value.rolesSoughtDevoutnessScale
          : rolesSoughtDevoutnessScale // ignore: cast_nullable_to_non_nullable
              as String?,
      rolesSoughtFaithPreferencesIsDealBreaker: freezed ==
              rolesSoughtFaithPreferencesIsDealBreaker
          ? _value.rolesSoughtFaithPreferencesIsDealBreaker
          : rolesSoughtFaithPreferencesIsDealBreaker // ignore: cast_nullable_to_non_nullable
              as int?,
      rolesSoughtFaithPreferencesAditionalDetails: freezed ==
              rolesSoughtFaithPreferencesAditionalDetails
          ? _value.rolesSoughtFaithPreferencesAditionalDetails
          : rolesSoughtFaithPreferencesAditionalDetails // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rolesSoughtEthnicity: freezed == rolesSoughtEthnicity
          ? _value.rolesSoughtEthnicity
          : rolesSoughtEthnicity // ignore: cast_nullable_to_non_nullable
              as String?,
      rolesSoughtEthnicityIsDealBreaker: freezed ==
              rolesSoughtEthnicityIsDealBreaker
          ? _value.rolesSoughtEthnicityIsDealBreaker
          : rolesSoughtEthnicityIsDealBreaker // ignore: cast_nullable_to_non_nullable
              as int?,
      rolesSoughtEthnicityAdditionalDetails: freezed ==
              rolesSoughtEthnicityAdditionalDetails
          ? _value.rolesSoughtEthnicityAdditionalDetails
          : rolesSoughtEthnicityAdditionalDetails // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rolesSoughtPoliticalPreferences: freezed ==
              rolesSoughtPoliticalPreferences
          ? _value.rolesSoughtPoliticalPreferences
          : rolesSoughtPoliticalPreferences // ignore: cast_nullable_to_non_nullable
              as String?,
      rolesSoughtPoliticalPreferencesIsDealBreaker: freezed ==
              rolesSoughtPoliticalPreferencesIsDealBreaker
          ? _value.rolesSoughtPoliticalPreferencesIsDealBreaker
          : rolesSoughtPoliticalPreferencesIsDealBreaker // ignore: cast_nullable_to_non_nullable
              as int?,
      rolesSoughtPoliticalPreferencesAdditionalDetail: freezed ==
              rolesSoughtPoliticalPreferencesAdditionalDetail
          ? _value.rolesSoughtPoliticalPreferencesAdditionalDetail
          : rolesSoughtPoliticalPreferencesAdditionalDetail // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rolesSoughtSmoking: freezed == rolesSoughtSmoking
          ? _value.rolesSoughtSmoking
          : rolesSoughtSmoking // ignore: cast_nullable_to_non_nullable
              as String?,
      rolesSoughtSmokingIsDealBreaker: freezed ==
              rolesSoughtSmokingIsDealBreaker
          ? _value.rolesSoughtSmokingIsDealBreaker
          : rolesSoughtSmokingIsDealBreaker // ignore: cast_nullable_to_non_nullable
              as int?,
      rolesSoughtSmokingAdditionalDetails: freezed ==
              rolesSoughtSmokingAdditionalDetails
          ? _value.rolesSoughtSmokingAdditionalDetails
          : rolesSoughtSmokingAdditionalDetails // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rolesSoughtDrinking: freezed == rolesSoughtDrinking
          ? _value.rolesSoughtDrinking
          : rolesSoughtDrinking // ignore: cast_nullable_to_non_nullable
              as String?,
      rolesSoughtDrinkingIsDealBreaker: freezed ==
              rolesSoughtDrinkingIsDealBreaker
          ? _value.rolesSoughtDrinkingIsDealBreaker
          : rolesSoughtDrinkingIsDealBreaker // ignore: cast_nullable_to_non_nullable
              as int?,
      rolesSoughtDrinkingAdditionalDetails: freezed ==
              rolesSoughtDrinkingAdditionalDetails
          ? _value.rolesSoughtDrinkingAdditionalDetails
          : rolesSoughtDrinkingAdditionalDetails // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rolesSoughtPetType: freezed == rolesSoughtPetType
          ? _value.rolesSoughtPetType
          : rolesSoughtPetType // ignore: cast_nullable_to_non_nullable
              as String?,
      rolesSoughtPetTypeIsDealBreaker: freezed ==
              rolesSoughtPetTypeIsDealBreaker
          ? _value.rolesSoughtPetTypeIsDealBreaker
          : rolesSoughtPetTypeIsDealBreaker // ignore: cast_nullable_to_non_nullable
              as int?,
      rolesSoughtPetTypeAdditionalDetails: freezed ==
              rolesSoughtPetTypeAdditionalDetails
          ? _value.rolesSoughtPetTypeAdditionalDetails
          : rolesSoughtPetTypeAdditionalDetails // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rolesSoughtLifestyleNotes: freezed == rolesSoughtLifestyleNotes
          ? _value.rolesSoughtLifestyleNotes
          : rolesSoughtLifestyleNotes // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRelationShipChoicesImpl implements _UserRelationShipChoices {
  const _$UserRelationShipChoicesImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "roles_sought") this.rolesSought,
      @JsonKey(name: "roles_to_fulfil") this.rolesToFulfil,
      @JsonKey(name: "involvement") this.involvement,
      @JsonKey(name: "involvement_specific") this.involvementSpecific,
      @JsonKey(name: "involvement_additional_details")
      this.involvementAdditionalDetails,
      @JsonKey(name: "distance_range") this.distanceRange,
      @JsonKey(name: "additional_location") this.additionalLocation,
      @JsonKey(name: "roles_sought_faith_preferences")
      this.rolesSoughtFaithPreferences,
      @JsonKey(name: "roles_sought_devoutness_scale")
      this.rolesSoughtDevoutnessScale,
      @JsonKey(name: "roles_sought_faith_preferences_is_deal_breaker")
      this.rolesSoughtFaithPreferencesIsDealBreaker,
      @JsonKey(name: "roles_sought_faith_preferences_aditional_details")
      this.rolesSoughtFaithPreferencesAditionalDetails,
      @JsonKey(name: "roles_sought_ethnicity") this.rolesSoughtEthnicity,
      @JsonKey(name: "roles_sought_ethnicity_is_deal_breaker")
      this.rolesSoughtEthnicityIsDealBreaker,
      @JsonKey(name: "roles_sought_ethnicity_additional_details")
      this.rolesSoughtEthnicityAdditionalDetails,
      @JsonKey(name: "roles_sought_political_preferences")
      this.rolesSoughtPoliticalPreferences,
      @JsonKey(name: "roles_sought_political_preferences_is_deal_breaker")
      this.rolesSoughtPoliticalPreferencesIsDealBreaker,
      @JsonKey(name: "roles_sought_political_preferences_additional_detail")
      this.rolesSoughtPoliticalPreferencesAdditionalDetail,
      @JsonKey(name: "roles_sought_smoking") this.rolesSoughtSmoking,
      @JsonKey(name: "roles_sought_smoking_is_deal_breaker")
      this.rolesSoughtSmokingIsDealBreaker,
      @JsonKey(name: "roles_sought_smoking_additional_details")
      this.rolesSoughtSmokingAdditionalDetails,
      @JsonKey(name: "roles_sought_drinking") this.rolesSoughtDrinking,
      @JsonKey(name: "roles_sought_drinking_is_deal_breaker")
      this.rolesSoughtDrinkingIsDealBreaker,
      @JsonKey(name: "roles_sought_drinking_additional_details")
      this.rolesSoughtDrinkingAdditionalDetails,
      @JsonKey(name: "roles_sought_pet_type") this.rolesSoughtPetType,
      @JsonKey(name: "roles_sought_pet_type_is_deal_breaker")
      this.rolesSoughtPetTypeIsDealBreaker,
      @JsonKey(name: "roles_sought_pet_type_additional_details")
      this.rolesSoughtPetTypeAdditionalDetails,
      @JsonKey(name: "roles_sought_lifestyle_notes")
      this.rolesSoughtLifestyleNotes,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt});

  factory _$UserRelationShipChoicesImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRelationShipChoicesImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "user_id")
  final int? userId;
  @override
  @JsonKey(name: "roles_sought")
  final String? rolesSought;
  @override
  @JsonKey(name: "roles_to_fulfil")
  final String? rolesToFulfil;
  @override
  @JsonKey(name: "involvement")
  final String? involvement;
  @override
  @JsonKey(name: "involvement_specific")
  final dynamic involvementSpecific;
  @override
  @JsonKey(name: "involvement_additional_details")
  final dynamic involvementAdditionalDetails;
  @override
  @JsonKey(name: "distance_range")
  final String? distanceRange;
  @override
  @JsonKey(name: "additional_location")
  final dynamic additionalLocation;
  @override
  @JsonKey(name: "roles_sought_faith_preferences")
  final String? rolesSoughtFaithPreferences;
  @override
  @JsonKey(name: "roles_sought_devoutness_scale")
  final String? rolesSoughtDevoutnessScale;
  @override
  @JsonKey(name: "roles_sought_faith_preferences_is_deal_breaker")
  final int? rolesSoughtFaithPreferencesIsDealBreaker;
  @override
  @JsonKey(name: "roles_sought_faith_preferences_aditional_details")
  final dynamic rolesSoughtFaithPreferencesAditionalDetails;
  @override
  @JsonKey(name: "roles_sought_ethnicity")
  final String? rolesSoughtEthnicity;
  @override
  @JsonKey(name: "roles_sought_ethnicity_is_deal_breaker")
  final int? rolesSoughtEthnicityIsDealBreaker;
  @override
  @JsonKey(name: "roles_sought_ethnicity_additional_details")
  final dynamic rolesSoughtEthnicityAdditionalDetails;
  @override
  @JsonKey(name: "roles_sought_political_preferences")
  final String? rolesSoughtPoliticalPreferences;
  @override
  @JsonKey(name: "roles_sought_political_preferences_is_deal_breaker")
  final int? rolesSoughtPoliticalPreferencesIsDealBreaker;
  @override
  @JsonKey(name: "roles_sought_political_preferences_additional_detail")
  final dynamic rolesSoughtPoliticalPreferencesAdditionalDetail;
  @override
  @JsonKey(name: "roles_sought_smoking")
  final String? rolesSoughtSmoking;
  @override
  @JsonKey(name: "roles_sought_smoking_is_deal_breaker")
  final int? rolesSoughtSmokingIsDealBreaker;
  @override
  @JsonKey(name: "roles_sought_smoking_additional_details")
  final dynamic rolesSoughtSmokingAdditionalDetails;
  @override
  @JsonKey(name: "roles_sought_drinking")
  final String? rolesSoughtDrinking;
  @override
  @JsonKey(name: "roles_sought_drinking_is_deal_breaker")
  final int? rolesSoughtDrinkingIsDealBreaker;
  @override
  @JsonKey(name: "roles_sought_drinking_additional_details")
  final dynamic rolesSoughtDrinkingAdditionalDetails;
  @override
  @JsonKey(name: "roles_sought_pet_type")
  final String? rolesSoughtPetType;
  @override
  @JsonKey(name: "roles_sought_pet_type_is_deal_breaker")
  final int? rolesSoughtPetTypeIsDealBreaker;
  @override
  @JsonKey(name: "roles_sought_pet_type_additional_details")
  final dynamic rolesSoughtPetTypeAdditionalDetails;
  @override
  @JsonKey(name: "roles_sought_lifestyle_notes")
  final dynamic rolesSoughtLifestyleNotes;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserRelationShipChoices(id: $id, userId: $userId, rolesSought: $rolesSought, rolesToFulfil: $rolesToFulfil, involvement: $involvement, involvementSpecific: $involvementSpecific, involvementAdditionalDetails: $involvementAdditionalDetails, distanceRange: $distanceRange, additionalLocation: $additionalLocation, rolesSoughtFaithPreferences: $rolesSoughtFaithPreferences, rolesSoughtDevoutnessScale: $rolesSoughtDevoutnessScale, rolesSoughtFaithPreferencesIsDealBreaker: $rolesSoughtFaithPreferencesIsDealBreaker, rolesSoughtFaithPreferencesAditionalDetails: $rolesSoughtFaithPreferencesAditionalDetails, rolesSoughtEthnicity: $rolesSoughtEthnicity, rolesSoughtEthnicityIsDealBreaker: $rolesSoughtEthnicityIsDealBreaker, rolesSoughtEthnicityAdditionalDetails: $rolesSoughtEthnicityAdditionalDetails, rolesSoughtPoliticalPreferences: $rolesSoughtPoliticalPreferences, rolesSoughtPoliticalPreferencesIsDealBreaker: $rolesSoughtPoliticalPreferencesIsDealBreaker, rolesSoughtPoliticalPreferencesAdditionalDetail: $rolesSoughtPoliticalPreferencesAdditionalDetail, rolesSoughtSmoking: $rolesSoughtSmoking, rolesSoughtSmokingIsDealBreaker: $rolesSoughtSmokingIsDealBreaker, rolesSoughtSmokingAdditionalDetails: $rolesSoughtSmokingAdditionalDetails, rolesSoughtDrinking: $rolesSoughtDrinking, rolesSoughtDrinkingIsDealBreaker: $rolesSoughtDrinkingIsDealBreaker, rolesSoughtDrinkingAdditionalDetails: $rolesSoughtDrinkingAdditionalDetails, rolesSoughtPetType: $rolesSoughtPetType, rolesSoughtPetTypeIsDealBreaker: $rolesSoughtPetTypeIsDealBreaker, rolesSoughtPetTypeAdditionalDetails: $rolesSoughtPetTypeAdditionalDetails, rolesSoughtLifestyleNotes: $rolesSoughtLifestyleNotes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRelationShipChoicesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.rolesSought, rolesSought) ||
                other.rolesSought == rolesSought) &&
            (identical(other.rolesToFulfil, rolesToFulfil) ||
                other.rolesToFulfil == rolesToFulfil) &&
            (identical(other.involvement, involvement) ||
                other.involvement == involvement) &&
            const DeepCollectionEquality()
                .equals(other.involvementSpecific, involvementSpecific) &&
            const DeepCollectionEquality().equals(
                other.involvementAdditionalDetails,
                involvementAdditionalDetails) &&
            (identical(other.distanceRange, distanceRange) ||
                other.distanceRange == distanceRange) &&
            const DeepCollectionEquality()
                .equals(other.additionalLocation, additionalLocation) &&
            (identical(other.rolesSoughtFaithPreferences, rolesSoughtFaithPreferences) ||
                other.rolesSoughtFaithPreferences ==
                    rolesSoughtFaithPreferences) &&
            (identical(other.rolesSoughtDevoutnessScale, rolesSoughtDevoutnessScale) ||
                other.rolesSoughtDevoutnessScale ==
                    rolesSoughtDevoutnessScale) &&
            (identical(other.rolesSoughtFaithPreferencesIsDealBreaker, rolesSoughtFaithPreferencesIsDealBreaker) ||
                other.rolesSoughtFaithPreferencesIsDealBreaker ==
                    rolesSoughtFaithPreferencesIsDealBreaker) &&
            const DeepCollectionEquality().equals(
                other.rolesSoughtFaithPreferencesAditionalDetails,
                rolesSoughtFaithPreferencesAditionalDetails) &&
            (identical(other.rolesSoughtEthnicity, rolesSoughtEthnicity) ||
                other.rolesSoughtEthnicity == rolesSoughtEthnicity) &&
            (identical(other.rolesSoughtEthnicityIsDealBreaker, rolesSoughtEthnicityIsDealBreaker) ||
                other.rolesSoughtEthnicityIsDealBreaker ==
                    rolesSoughtEthnicityIsDealBreaker) &&
            const DeepCollectionEquality().equals(
                other.rolesSoughtEthnicityAdditionalDetails,
                rolesSoughtEthnicityAdditionalDetails) &&
            (identical(other.rolesSoughtPoliticalPreferences, rolesSoughtPoliticalPreferences) ||
                other.rolesSoughtPoliticalPreferences ==
                    rolesSoughtPoliticalPreferences) &&
            (identical(other.rolesSoughtPoliticalPreferencesIsDealBreaker, rolesSoughtPoliticalPreferencesIsDealBreaker) ||
                other.rolesSoughtPoliticalPreferencesIsDealBreaker ==
                    rolesSoughtPoliticalPreferencesIsDealBreaker) &&
            const DeepCollectionEquality().equals(
                other.rolesSoughtPoliticalPreferencesAdditionalDetail,
                rolesSoughtPoliticalPreferencesAdditionalDetail) &&
            (identical(other.rolesSoughtSmoking, rolesSoughtSmoking) ||
                other.rolesSoughtSmoking == rolesSoughtSmoking) &&
            (identical(other.rolesSoughtSmokingIsDealBreaker, rolesSoughtSmokingIsDealBreaker) || other.rolesSoughtSmokingIsDealBreaker == rolesSoughtSmokingIsDealBreaker) &&
            const DeepCollectionEquality().equals(other.rolesSoughtSmokingAdditionalDetails, rolesSoughtSmokingAdditionalDetails) &&
            (identical(other.rolesSoughtDrinking, rolesSoughtDrinking) || other.rolesSoughtDrinking == rolesSoughtDrinking) &&
            (identical(other.rolesSoughtDrinkingIsDealBreaker, rolesSoughtDrinkingIsDealBreaker) || other.rolesSoughtDrinkingIsDealBreaker == rolesSoughtDrinkingIsDealBreaker) &&
            const DeepCollectionEquality().equals(other.rolesSoughtDrinkingAdditionalDetails, rolesSoughtDrinkingAdditionalDetails) &&
            (identical(other.rolesSoughtPetType, rolesSoughtPetType) || other.rolesSoughtPetType == rolesSoughtPetType) &&
            (identical(other.rolesSoughtPetTypeIsDealBreaker, rolesSoughtPetTypeIsDealBreaker) || other.rolesSoughtPetTypeIsDealBreaker == rolesSoughtPetTypeIsDealBreaker) &&
            const DeepCollectionEquality().equals(other.rolesSoughtPetTypeAdditionalDetails, rolesSoughtPetTypeAdditionalDetails) &&
            const DeepCollectionEquality().equals(other.rolesSoughtLifestyleNotes, rolesSoughtLifestyleNotes) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        rolesSought,
        rolesToFulfil,
        involvement,
        const DeepCollectionEquality().hash(involvementSpecific),
        const DeepCollectionEquality().hash(involvementAdditionalDetails),
        distanceRange,
        const DeepCollectionEquality().hash(additionalLocation),
        rolesSoughtFaithPreferences,
        rolesSoughtDevoutnessScale,
        rolesSoughtFaithPreferencesIsDealBreaker,
        const DeepCollectionEquality()
            .hash(rolesSoughtFaithPreferencesAditionalDetails),
        rolesSoughtEthnicity,
        rolesSoughtEthnicityIsDealBreaker,
        const DeepCollectionEquality()
            .hash(rolesSoughtEthnicityAdditionalDetails),
        rolesSoughtPoliticalPreferences,
        rolesSoughtPoliticalPreferencesIsDealBreaker,
        const DeepCollectionEquality()
            .hash(rolesSoughtPoliticalPreferencesAdditionalDetail),
        rolesSoughtSmoking,
        rolesSoughtSmokingIsDealBreaker,
        const DeepCollectionEquality()
            .hash(rolesSoughtSmokingAdditionalDetails),
        rolesSoughtDrinking,
        rolesSoughtDrinkingIsDealBreaker,
        const DeepCollectionEquality()
            .hash(rolesSoughtDrinkingAdditionalDetails),
        rolesSoughtPetType,
        rolesSoughtPetTypeIsDealBreaker,
        const DeepCollectionEquality()
            .hash(rolesSoughtPetTypeAdditionalDetails),
        const DeepCollectionEquality().hash(rolesSoughtLifestyleNotes),
        createdAt,
        updatedAt
      ]);

  /// Create a copy of UserRelationShipChoices
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRelationShipChoicesImplCopyWith<_$UserRelationShipChoicesImpl>
      get copyWith => __$$UserRelationShipChoicesImplCopyWithImpl<
          _$UserRelationShipChoicesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRelationShipChoicesImplToJson(
      this,
    );
  }
}

abstract class _UserRelationShipChoices implements UserRelationShipChoices {
  const factory _UserRelationShipChoices(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "user_id") final int? userId,
      @JsonKey(name: "roles_sought") final String? rolesSought,
      @JsonKey(name: "roles_to_fulfil") final String? rolesToFulfil,
      @JsonKey(name: "involvement") final String? involvement,
      @JsonKey(name: "involvement_specific") final dynamic involvementSpecific,
      @JsonKey(name: "involvement_additional_details")
      final dynamic involvementAdditionalDetails,
      @JsonKey(name: "distance_range") final String? distanceRange,
      @JsonKey(name: "additional_location") final dynamic additionalLocation,
      @JsonKey(name: "roles_sought_faith_preferences")
      final String? rolesSoughtFaithPreferences,
      @JsonKey(name: "roles_sought_devoutness_scale")
      final String? rolesSoughtDevoutnessScale,
      @JsonKey(name: "roles_sought_faith_preferences_is_deal_breaker")
      final int? rolesSoughtFaithPreferencesIsDealBreaker,
      @JsonKey(name: "roles_sought_faith_preferences_aditional_details")
      final dynamic rolesSoughtFaithPreferencesAditionalDetails,
      @JsonKey(name: "roles_sought_ethnicity")
      final String? rolesSoughtEthnicity,
      @JsonKey(name: "roles_sought_ethnicity_is_deal_breaker")
      final int? rolesSoughtEthnicityIsDealBreaker,
      @JsonKey(name: "roles_sought_ethnicity_additional_details")
      final dynamic rolesSoughtEthnicityAdditionalDetails,
      @JsonKey(name: "roles_sought_political_preferences")
      final String? rolesSoughtPoliticalPreferences,
      @JsonKey(name: "roles_sought_political_preferences_is_deal_breaker")
      final int? rolesSoughtPoliticalPreferencesIsDealBreaker,
      @JsonKey(name: "roles_sought_political_preferences_additional_detail")
      final dynamic rolesSoughtPoliticalPreferencesAdditionalDetail,
      @JsonKey(name: "roles_sought_smoking") final String? rolesSoughtSmoking,
      @JsonKey(name: "roles_sought_smoking_is_deal_breaker")
      final int? rolesSoughtSmokingIsDealBreaker,
      @JsonKey(name: "roles_sought_smoking_additional_details")
      final dynamic rolesSoughtSmokingAdditionalDetails,
      @JsonKey(name: "roles_sought_drinking") final String? rolesSoughtDrinking,
      @JsonKey(name: "roles_sought_drinking_is_deal_breaker")
      final int? rolesSoughtDrinkingIsDealBreaker,
      @JsonKey(name: "roles_sought_drinking_additional_details")
      final dynamic rolesSoughtDrinkingAdditionalDetails,
      @JsonKey(name: "roles_sought_pet_type") final String? rolesSoughtPetType,
      @JsonKey(name: "roles_sought_pet_type_is_deal_breaker")
      final int? rolesSoughtPetTypeIsDealBreaker,
      @JsonKey(name: "roles_sought_pet_type_additional_details")
      final dynamic rolesSoughtPetTypeAdditionalDetails,
      @JsonKey(name: "roles_sought_lifestyle_notes")
      final dynamic rolesSoughtLifestyleNotes,
      @JsonKey(name: "created_at") final DateTime? createdAt,
      @JsonKey(name: "updated_at")
      final DateTime? updatedAt}) = _$UserRelationShipChoicesImpl;

  factory _UserRelationShipChoices.fromJson(Map<String, dynamic> json) =
      _$UserRelationShipChoicesImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "user_id")
  int? get userId;
  @override
  @JsonKey(name: "roles_sought")
  String? get rolesSought;
  @override
  @JsonKey(name: "roles_to_fulfil")
  String? get rolesToFulfil;
  @override
  @JsonKey(name: "involvement")
  String? get involvement;
  @override
  @JsonKey(name: "involvement_specific")
  dynamic get involvementSpecific;
  @override
  @JsonKey(name: "involvement_additional_details")
  dynamic get involvementAdditionalDetails;
  @override
  @JsonKey(name: "distance_range")
  String? get distanceRange;
  @override
  @JsonKey(name: "additional_location")
  dynamic get additionalLocation;
  @override
  @JsonKey(name: "roles_sought_faith_preferences")
  String? get rolesSoughtFaithPreferences;
  @override
  @JsonKey(name: "roles_sought_devoutness_scale")
  String? get rolesSoughtDevoutnessScale;
  @override
  @JsonKey(name: "roles_sought_faith_preferences_is_deal_breaker")
  int? get rolesSoughtFaithPreferencesIsDealBreaker;
  @override
  @JsonKey(name: "roles_sought_faith_preferences_aditional_details")
  dynamic get rolesSoughtFaithPreferencesAditionalDetails;
  @override
  @JsonKey(name: "roles_sought_ethnicity")
  String? get rolesSoughtEthnicity;
  @override
  @JsonKey(name: "roles_sought_ethnicity_is_deal_breaker")
  int? get rolesSoughtEthnicityIsDealBreaker;
  @override
  @JsonKey(name: "roles_sought_ethnicity_additional_details")
  dynamic get rolesSoughtEthnicityAdditionalDetails;
  @override
  @JsonKey(name: "roles_sought_political_preferences")
  String? get rolesSoughtPoliticalPreferences;
  @override
  @JsonKey(name: "roles_sought_political_preferences_is_deal_breaker")
  int? get rolesSoughtPoliticalPreferencesIsDealBreaker;
  @override
  @JsonKey(name: "roles_sought_political_preferences_additional_detail")
  dynamic get rolesSoughtPoliticalPreferencesAdditionalDetail;
  @override
  @JsonKey(name: "roles_sought_smoking")
  String? get rolesSoughtSmoking;
  @override
  @JsonKey(name: "roles_sought_smoking_is_deal_breaker")
  int? get rolesSoughtSmokingIsDealBreaker;
  @override
  @JsonKey(name: "roles_sought_smoking_additional_details")
  dynamic get rolesSoughtSmokingAdditionalDetails;
  @override
  @JsonKey(name: "roles_sought_drinking")
  String? get rolesSoughtDrinking;
  @override
  @JsonKey(name: "roles_sought_drinking_is_deal_breaker")
  int? get rolesSoughtDrinkingIsDealBreaker;
  @override
  @JsonKey(name: "roles_sought_drinking_additional_details")
  dynamic get rolesSoughtDrinkingAdditionalDetails;
  @override
  @JsonKey(name: "roles_sought_pet_type")
  String? get rolesSoughtPetType;
  @override
  @JsonKey(name: "roles_sought_pet_type_is_deal_breaker")
  int? get rolesSoughtPetTypeIsDealBreaker;
  @override
  @JsonKey(name: "roles_sought_pet_type_additional_details")
  dynamic get rolesSoughtPetTypeAdditionalDetails;
  @override
  @JsonKey(name: "roles_sought_lifestyle_notes")
  dynamic get rolesSoughtLifestyleNotes;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;

  /// Create a copy of UserRelationShipChoices
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRelationShipChoicesImplCopyWith<_$UserRelationShipChoicesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DetailedScores _$DetailedScoresFromJson(Map<String, dynamic> json) {
  return _DetailedScores.fromJson(json);
}

/// @nodoc
mixin _$DetailedScores {
  @JsonKey(name: "faith")
  int get faith => throw _privateConstructorUsedError;
  @JsonKey(name: "race")
  int get race => throw _privateConstructorUsedError;
  @JsonKey(name: "politics")
  int get politics => throw _privateConstructorUsedError;
  @JsonKey(name: "lifestyle")
  int get lifestyle => throw _privateConstructorUsedError;
  @JsonKey(name: "roles")
  int get roles => throw _privateConstructorUsedError;
  @JsonKey(name: "location")
  double get location => throw _privateConstructorUsedError;

  /// Serializes this DetailedScores to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailedScores
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailedScoresCopyWith<DetailedScores> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailedScoresCopyWith<$Res> {
  factory $DetailedScoresCopyWith(
          DetailedScores value, $Res Function(DetailedScores) then) =
      _$DetailedScoresCopyWithImpl<$Res, DetailedScores>;
  @useResult
  $Res call(
      {@JsonKey(name: "faith") int faith,
      @JsonKey(name: "race") int race,
      @JsonKey(name: "politics") int politics,
      @JsonKey(name: "lifestyle") int lifestyle,
      @JsonKey(name: "roles") int roles,
      @JsonKey(name: "location") double location});
}

/// @nodoc
class _$DetailedScoresCopyWithImpl<$Res, $Val extends DetailedScores>
    implements $DetailedScoresCopyWith<$Res> {
  _$DetailedScoresCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailedScores
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faith = null,
    Object? race = null,
    Object? politics = null,
    Object? lifestyle = null,
    Object? roles = null,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      faith: null == faith
          ? _value.faith
          : faith // ignore: cast_nullable_to_non_nullable
              as int,
      race: null == race
          ? _value.race
          : race // ignore: cast_nullable_to_non_nullable
              as int,
      politics: null == politics
          ? _value.politics
          : politics // ignore: cast_nullable_to_non_nullable
              as int,
      lifestyle: null == lifestyle
          ? _value.lifestyle
          : lifestyle // ignore: cast_nullable_to_non_nullable
              as int,
      roles: null == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailedScoresImplCopyWith<$Res>
    implements $DetailedScoresCopyWith<$Res> {
  factory _$$DetailedScoresImplCopyWith(_$DetailedScoresImpl value,
          $Res Function(_$DetailedScoresImpl) then) =
      __$$DetailedScoresImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "faith") int faith,
      @JsonKey(name: "race") int race,
      @JsonKey(name: "politics") int politics,
      @JsonKey(name: "lifestyle") int lifestyle,
      @JsonKey(name: "roles") int roles,
      @JsonKey(name: "location") double location});
}

/// @nodoc
class __$$DetailedScoresImplCopyWithImpl<$Res>
    extends _$DetailedScoresCopyWithImpl<$Res, _$DetailedScoresImpl>
    implements _$$DetailedScoresImplCopyWith<$Res> {
  __$$DetailedScoresImplCopyWithImpl(
      _$DetailedScoresImpl _value, $Res Function(_$DetailedScoresImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailedScores
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faith = null,
    Object? race = null,
    Object? politics = null,
    Object? lifestyle = null,
    Object? roles = null,
    Object? location = null,
  }) {
    return _then(_$DetailedScoresImpl(
      faith: null == faith
          ? _value.faith
          : faith // ignore: cast_nullable_to_non_nullable
              as int,
      race: null == race
          ? _value.race
          : race // ignore: cast_nullable_to_non_nullable
              as int,
      politics: null == politics
          ? _value.politics
          : politics // ignore: cast_nullable_to_non_nullable
              as int,
      lifestyle: null == lifestyle
          ? _value.lifestyle
          : lifestyle // ignore: cast_nullable_to_non_nullable
              as int,
      roles: null == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailedScoresImpl implements _DetailedScores {
  const _$DetailedScoresImpl(
      {@JsonKey(name: "faith") required this.faith,
      @JsonKey(name: "race") required this.race,
      @JsonKey(name: "politics") required this.politics,
      @JsonKey(name: "lifestyle") required this.lifestyle,
      @JsonKey(name: "roles") required this.roles,
      @JsonKey(name: "location") required this.location});

  factory _$DetailedScoresImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailedScoresImplFromJson(json);

  @override
  @JsonKey(name: "faith")
  final int faith;
  @override
  @JsonKey(name: "race")
  final int race;
  @override
  @JsonKey(name: "politics")
  final int politics;
  @override
  @JsonKey(name: "lifestyle")
  final int lifestyle;
  @override
  @JsonKey(name: "roles")
  final int roles;
  @override
  @JsonKey(name: "location")
  final double location;

  @override
  String toString() {
    return 'DetailedScores(faith: $faith, race: $race, politics: $politics, lifestyle: $lifestyle, roles: $roles, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailedScoresImpl &&
            (identical(other.faith, faith) || other.faith == faith) &&
            (identical(other.race, race) || other.race == race) &&
            (identical(other.politics, politics) ||
                other.politics == politics) &&
            (identical(other.lifestyle, lifestyle) ||
                other.lifestyle == lifestyle) &&
            (identical(other.roles, roles) || other.roles == roles) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, faith, race, politics, lifestyle, roles, location);

  /// Create a copy of DetailedScores
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailedScoresImplCopyWith<_$DetailedScoresImpl> get copyWith =>
      __$$DetailedScoresImplCopyWithImpl<_$DetailedScoresImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailedScoresImplToJson(
      this,
    );
  }
}

abstract class _DetailedScores implements DetailedScores {
  const factory _DetailedScores(
          {@JsonKey(name: "faith") required final int faith,
          @JsonKey(name: "race") required final int race,
          @JsonKey(name: "politics") required final int politics,
          @JsonKey(name: "lifestyle") required final int lifestyle,
          @JsonKey(name: "roles") required final int roles,
          @JsonKey(name: "location") required final double location}) =
      _$DetailedScoresImpl;

  factory _DetailedScores.fromJson(Map<String, dynamic> json) =
      _$DetailedScoresImpl.fromJson;

  @override
  @JsonKey(name: "faith")
  int get faith;
  @override
  @JsonKey(name: "race")
  int get race;
  @override
  @JsonKey(name: "politics")
  int get politics;
  @override
  @JsonKey(name: "lifestyle")
  int get lifestyle;
  @override
  @JsonKey(name: "roles")
  int get roles;
  @override
  @JsonKey(name: "location")
  double get location;

  /// Create a copy of DetailedScores
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailedScoresImplCopyWith<_$DetailedScoresImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserShowcaseImages _$UserShowcaseImagesFromJson(Map<String, dynamic> json) {
  return _UserShowcaseImages.fromJson(json);
}

/// @nodoc
mixin _$UserShowcaseImages {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "caption")
  String? get caption => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserShowcaseImages to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserShowcaseImages
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserShowcaseImagesCopyWith<UserShowcaseImages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserShowcaseImagesCopyWith<$Res> {
  factory $UserShowcaseImagesCopyWith(
          UserShowcaseImages value, $Res Function(UserShowcaseImages) then) =
      _$UserShowcaseImagesCopyWithImpl<$Res, UserShowcaseImages>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "user_id") int? userId,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "caption") String? caption,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt});
}

/// @nodoc
class _$UserShowcaseImagesCopyWithImpl<$Res, $Val extends UserShowcaseImages>
    implements $UserShowcaseImagesCopyWith<$Res> {
  _$UserShowcaseImagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserShowcaseImages
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? image = freezed,
    Object? caption = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserShowcaseImagesImplCopyWith<$Res>
    implements $UserShowcaseImagesCopyWith<$Res> {
  factory _$$UserShowcaseImagesImplCopyWith(_$UserShowcaseImagesImpl value,
          $Res Function(_$UserShowcaseImagesImpl) then) =
      __$$UserShowcaseImagesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "user_id") int? userId,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "caption") String? caption,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt});
}

/// @nodoc
class __$$UserShowcaseImagesImplCopyWithImpl<$Res>
    extends _$UserShowcaseImagesCopyWithImpl<$Res, _$UserShowcaseImagesImpl>
    implements _$$UserShowcaseImagesImplCopyWith<$Res> {
  __$$UserShowcaseImagesImplCopyWithImpl(_$UserShowcaseImagesImpl _value,
      $Res Function(_$UserShowcaseImagesImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserShowcaseImages
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? image = freezed,
    Object? caption = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserShowcaseImagesImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserShowcaseImagesImpl implements _UserShowcaseImages {
  const _$UserShowcaseImagesImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "image") this.image,
      @JsonKey(name: "caption") this.caption,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt});

  factory _$UserShowcaseImagesImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserShowcaseImagesImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "user_id")
  final int? userId;
  @override
  @JsonKey(name: "image")
  final String? image;
  @override
  @JsonKey(name: "caption")
  final String? caption;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserShowcaseImages(id: $id, userId: $userId, image: $image, caption: $caption, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserShowcaseImagesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, image, caption, createdAt, updatedAt);

  /// Create a copy of UserShowcaseImages
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserShowcaseImagesImplCopyWith<_$UserShowcaseImagesImpl> get copyWith =>
      __$$UserShowcaseImagesImplCopyWithImpl<_$UserShowcaseImagesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserShowcaseImagesImplToJson(
      this,
    );
  }
}

abstract class _UserShowcaseImages implements UserShowcaseImages {
  const factory _UserShowcaseImages(
          {@JsonKey(name: "id") final int? id,
          @JsonKey(name: "user_id") final int? userId,
          @JsonKey(name: "image") final String? image,
          @JsonKey(name: "caption") final String? caption,
          @JsonKey(name: "created_at") final DateTime? createdAt,
          @JsonKey(name: "updated_at") final DateTime? updatedAt}) =
      _$UserShowcaseImagesImpl;

  factory _UserShowcaseImages.fromJson(Map<String, dynamic> json) =
      _$UserShowcaseImagesImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "user_id")
  int? get userId;
  @override
  @JsonKey(name: "image")
  String? get image;
  @override
  @JsonKey(name: "caption")
  String? get caption;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;

  /// Create a copy of UserShowcaseImages
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserShowcaseImagesImplCopyWith<_$UserShowcaseImagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
