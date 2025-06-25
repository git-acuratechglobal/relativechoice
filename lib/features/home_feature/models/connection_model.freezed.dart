// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConnectionModel _$ConnectionModelFromJson(Map<String, dynamic> json) {
  return _ConnectionModel.fromJson(json);
}

/// @nodoc
mixin _$ConnectionModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_user_id')
  int get targetUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_connected')
  int get isConnected => throw _privateConstructorUsedError;
  @JsonKey(name: 'connection_status')
  int get connectionStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'connection_accepted_at')
  String? get connectionAcceptedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'connection_request_message')
  String? get connectionRequestMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_removed')
  int get isRemoved => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_blocked')
  int get isBlocked => throw _privateConstructorUsedError;
  @JsonKey(name: 'blocked_by')
  int? get blockedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_reported')
  int get isReported => throw _privateConstructorUsedError;
  @JsonKey(name: 'reported_by')
  int? get reportedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'report_reason')
  String? get reportReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_user')
  User? get targetUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  User? get user => throw _privateConstructorUsedError;

  /// Serializes this ConnectionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConnectionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConnectionModelCopyWith<ConnectionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionModelCopyWith<$Res> {
  factory $ConnectionModelCopyWith(
          ConnectionModel value, $Res Function(ConnectionModel) then) =
      _$ConnectionModelCopyWithImpl<$Res, ConnectionModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'target_user_id') int targetUserId,
      @JsonKey(name: 'is_connected') int isConnected,
      @JsonKey(name: 'connection_status') int connectionStatus,
      @JsonKey(name: 'connection_accepted_at') String? connectionAcceptedAt,
      @JsonKey(name: 'connection_request_message')
      String? connectionRequestMessage,
      @JsonKey(name: 'is_removed') int isRemoved,
      @JsonKey(name: 'is_blocked') int isBlocked,
      @JsonKey(name: 'blocked_by') int? blockedBy,
      @JsonKey(name: 'is_reported') int isReported,
      @JsonKey(name: 'reported_by') int? reportedBy,
      @JsonKey(name: 'report_reason') String? reportReason,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'target_user') User? targetUser,
      @JsonKey(name: 'user') User? user});

  $UserCopyWith<$Res>? get targetUser;
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$ConnectionModelCopyWithImpl<$Res, $Val extends ConnectionModel>
    implements $ConnectionModelCopyWith<$Res> {
  _$ConnectionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConnectionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? targetUserId = null,
    Object? isConnected = null,
    Object? connectionStatus = null,
    Object? connectionAcceptedAt = freezed,
    Object? connectionRequestMessage = freezed,
    Object? isRemoved = null,
    Object? isBlocked = null,
    Object? blockedBy = freezed,
    Object? isReported = null,
    Object? reportedBy = freezed,
    Object? reportReason = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? targetUser = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      targetUserId: null == targetUserId
          ? _value.targetUserId
          : targetUserId // ignore: cast_nullable_to_non_nullable
              as int,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as int,
      connectionStatus: null == connectionStatus
          ? _value.connectionStatus
          : connectionStatus // ignore: cast_nullable_to_non_nullable
              as int,
      connectionAcceptedAt: freezed == connectionAcceptedAt
          ? _value.connectionAcceptedAt
          : connectionAcceptedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      connectionRequestMessage: freezed == connectionRequestMessage
          ? _value.connectionRequestMessage
          : connectionRequestMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isRemoved: null == isRemoved
          ? _value.isRemoved
          : isRemoved // ignore: cast_nullable_to_non_nullable
              as int,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as int,
      blockedBy: freezed == blockedBy
          ? _value.blockedBy
          : blockedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      isReported: null == isReported
          ? _value.isReported
          : isReported // ignore: cast_nullable_to_non_nullable
              as int,
      reportedBy: freezed == reportedBy
          ? _value.reportedBy
          : reportedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      reportReason: freezed == reportReason
          ? _value.reportReason
          : reportReason // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      targetUser: freezed == targetUser
          ? _value.targetUser
          : targetUser // ignore: cast_nullable_to_non_nullable
              as User?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  /// Create a copy of ConnectionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get targetUser {
    if (_value.targetUser == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.targetUser!, (value) {
      return _then(_value.copyWith(targetUser: value) as $Val);
    });
  }

  /// Create a copy of ConnectionModel
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
}

/// @nodoc
abstract class _$$ConnectionModelImplCopyWith<$Res>
    implements $ConnectionModelCopyWith<$Res> {
  factory _$$ConnectionModelImplCopyWith(_$ConnectionModelImpl value,
          $Res Function(_$ConnectionModelImpl) then) =
      __$$ConnectionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'target_user_id') int targetUserId,
      @JsonKey(name: 'is_connected') int isConnected,
      @JsonKey(name: 'connection_status') int connectionStatus,
      @JsonKey(name: 'connection_accepted_at') String? connectionAcceptedAt,
      @JsonKey(name: 'connection_request_message')
      String? connectionRequestMessage,
      @JsonKey(name: 'is_removed') int isRemoved,
      @JsonKey(name: 'is_blocked') int isBlocked,
      @JsonKey(name: 'blocked_by') int? blockedBy,
      @JsonKey(name: 'is_reported') int isReported,
      @JsonKey(name: 'reported_by') int? reportedBy,
      @JsonKey(name: 'report_reason') String? reportReason,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'target_user') User? targetUser,
      @JsonKey(name: 'user') User? user});

  @override
  $UserCopyWith<$Res>? get targetUser;
  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ConnectionModelImplCopyWithImpl<$Res>
    extends _$ConnectionModelCopyWithImpl<$Res, _$ConnectionModelImpl>
    implements _$$ConnectionModelImplCopyWith<$Res> {
  __$$ConnectionModelImplCopyWithImpl(
      _$ConnectionModelImpl _value, $Res Function(_$ConnectionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConnectionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? targetUserId = null,
    Object? isConnected = null,
    Object? connectionStatus = null,
    Object? connectionAcceptedAt = freezed,
    Object? connectionRequestMessage = freezed,
    Object? isRemoved = null,
    Object? isBlocked = null,
    Object? blockedBy = freezed,
    Object? isReported = null,
    Object? reportedBy = freezed,
    Object? reportReason = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? targetUser = freezed,
    Object? user = freezed,
  }) {
    return _then(_$ConnectionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      targetUserId: null == targetUserId
          ? _value.targetUserId
          : targetUserId // ignore: cast_nullable_to_non_nullable
              as int,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as int,
      connectionStatus: null == connectionStatus
          ? _value.connectionStatus
          : connectionStatus // ignore: cast_nullable_to_non_nullable
              as int,
      connectionAcceptedAt: freezed == connectionAcceptedAt
          ? _value.connectionAcceptedAt
          : connectionAcceptedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      connectionRequestMessage: freezed == connectionRequestMessage
          ? _value.connectionRequestMessage
          : connectionRequestMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isRemoved: null == isRemoved
          ? _value.isRemoved
          : isRemoved // ignore: cast_nullable_to_non_nullable
              as int,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as int,
      blockedBy: freezed == blockedBy
          ? _value.blockedBy
          : blockedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      isReported: null == isReported
          ? _value.isReported
          : isReported // ignore: cast_nullable_to_non_nullable
              as int,
      reportedBy: freezed == reportedBy
          ? _value.reportedBy
          : reportedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      reportReason: freezed == reportReason
          ? _value.reportReason
          : reportReason // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      targetUser: freezed == targetUser
          ? _value.targetUser
          : targetUser // ignore: cast_nullable_to_non_nullable
              as User?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConnectionModelImpl implements _ConnectionModel {
  const _$ConnectionModelImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'target_user_id') required this.targetUserId,
      @JsonKey(name: 'is_connected') required this.isConnected,
      @JsonKey(name: 'connection_status') required this.connectionStatus,
      @JsonKey(name: 'connection_accepted_at') this.connectionAcceptedAt,
      @JsonKey(name: 'connection_request_message')
      this.connectionRequestMessage,
      @JsonKey(name: 'is_removed') required this.isRemoved,
      @JsonKey(name: 'is_blocked') required this.isBlocked,
      @JsonKey(name: 'blocked_by') this.blockedBy,
      @JsonKey(name: 'is_reported') required this.isReported,
      @JsonKey(name: 'reported_by') this.reportedBy,
      @JsonKey(name: 'report_reason') this.reportReason,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'target_user') required this.targetUser,
      @JsonKey(name: 'user') required this.user});

  factory _$ConnectionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConnectionModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'target_user_id')
  final int targetUserId;
  @override
  @JsonKey(name: 'is_connected')
  final int isConnected;
  @override
  @JsonKey(name: 'connection_status')
  final int connectionStatus;
  @override
  @JsonKey(name: 'connection_accepted_at')
  final String? connectionAcceptedAt;
  @override
  @JsonKey(name: 'connection_request_message')
  final String? connectionRequestMessage;
  @override
  @JsonKey(name: 'is_removed')
  final int isRemoved;
  @override
  @JsonKey(name: 'is_blocked')
  final int isBlocked;
  @override
  @JsonKey(name: 'blocked_by')
  final int? blockedBy;
  @override
  @JsonKey(name: 'is_reported')
  final int isReported;
  @override
  @JsonKey(name: 'reported_by')
  final int? reportedBy;
  @override
  @JsonKey(name: 'report_reason')
  final String? reportReason;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'target_user')
  final User? targetUser;
  @override
  @JsonKey(name: 'user')
  final User? user;

  @override
  String toString() {
    return 'ConnectionModel(id: $id, userId: $userId, targetUserId: $targetUserId, isConnected: $isConnected, connectionStatus: $connectionStatus, connectionAcceptedAt: $connectionAcceptedAt, connectionRequestMessage: $connectionRequestMessage, isRemoved: $isRemoved, isBlocked: $isBlocked, blockedBy: $blockedBy, isReported: $isReported, reportedBy: $reportedBy, reportReason: $reportReason, createdAt: $createdAt, updatedAt: $updatedAt, targetUser: $targetUser, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.targetUserId, targetUserId) ||
                other.targetUserId == targetUserId) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.connectionStatus, connectionStatus) ||
                other.connectionStatus == connectionStatus) &&
            (identical(other.connectionAcceptedAt, connectionAcceptedAt) ||
                other.connectionAcceptedAt == connectionAcceptedAt) &&
            (identical(
                    other.connectionRequestMessage, connectionRequestMessage) ||
                other.connectionRequestMessage == connectionRequestMessage) &&
            (identical(other.isRemoved, isRemoved) ||
                other.isRemoved == isRemoved) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.blockedBy, blockedBy) ||
                other.blockedBy == blockedBy) &&
            (identical(other.isReported, isReported) ||
                other.isReported == isReported) &&
            (identical(other.reportedBy, reportedBy) ||
                other.reportedBy == reportedBy) &&
            (identical(other.reportReason, reportReason) ||
                other.reportReason == reportReason) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.targetUser, targetUser) ||
                other.targetUser == targetUser) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      targetUserId,
      isConnected,
      connectionStatus,
      connectionAcceptedAt,
      connectionRequestMessage,
      isRemoved,
      isBlocked,
      blockedBy,
      isReported,
      reportedBy,
      reportReason,
      createdAt,
      updatedAt,
      targetUser,
      user);

  /// Create a copy of ConnectionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionModelImplCopyWith<_$ConnectionModelImpl> get copyWith =>
      __$$ConnectionModelImplCopyWithImpl<_$ConnectionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConnectionModelImplToJson(
      this,
    );
  }
}

abstract class _ConnectionModel implements ConnectionModel {
  const factory _ConnectionModel(
      {required final int id,
      @JsonKey(name: 'user_id') required final int userId,
      @JsonKey(name: 'target_user_id') required final int targetUserId,
      @JsonKey(name: 'is_connected') required final int isConnected,
      @JsonKey(name: 'connection_status') required final int connectionStatus,
      @JsonKey(name: 'connection_accepted_at')
      final String? connectionAcceptedAt,
      @JsonKey(name: 'connection_request_message')
      final String? connectionRequestMessage,
      @JsonKey(name: 'is_removed') required final int isRemoved,
      @JsonKey(name: 'is_blocked') required final int isBlocked,
      @JsonKey(name: 'blocked_by') final int? blockedBy,
      @JsonKey(name: 'is_reported') required final int isReported,
      @JsonKey(name: 'reported_by') final int? reportedBy,
      @JsonKey(name: 'report_reason') final String? reportReason,
      @JsonKey(name: 'created_at') required final String createdAt,
      @JsonKey(name: 'updated_at') required final String updatedAt,
      @JsonKey(name: 'target_user') required final User? targetUser,
      @JsonKey(name: 'user')
      required final User? user}) = _$ConnectionModelImpl;

  factory _ConnectionModel.fromJson(Map<String, dynamic> json) =
      _$ConnectionModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'target_user_id')
  int get targetUserId;
  @override
  @JsonKey(name: 'is_connected')
  int get isConnected;
  @override
  @JsonKey(name: 'connection_status')
  int get connectionStatus;
  @override
  @JsonKey(name: 'connection_accepted_at')
  String? get connectionAcceptedAt;
  @override
  @JsonKey(name: 'connection_request_message')
  String? get connectionRequestMessage;
  @override
  @JsonKey(name: 'is_removed')
  int get isRemoved;
  @override
  @JsonKey(name: 'is_blocked')
  int get isBlocked;
  @override
  @JsonKey(name: 'blocked_by')
  int? get blockedBy;
  @override
  @JsonKey(name: 'is_reported')
  int get isReported;
  @override
  @JsonKey(name: 'reported_by')
  int? get reportedBy;
  @override
  @JsonKey(name: 'report_reason')
  String? get reportReason;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(name: 'target_user')
  User? get targetUser;
  @override
  @JsonKey(name: 'user')
  User? get user;

  /// Create a copy of ConnectionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectionModelImplCopyWith<_$ConnectionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
