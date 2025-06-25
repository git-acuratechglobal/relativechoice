// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConnectionModelImpl _$$ConnectionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ConnectionModelImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      targetUserId: (json['target_user_id'] as num).toInt(),
      isConnected: (json['is_connected'] as num).toInt(),
      connectionStatus: (json['connection_status'] as num).toInt(),
      connectionAcceptedAt: json['connection_accepted_at'] as String?,
      connectionRequestMessage: json['connection_request_message'] as String?,
      isRemoved: (json['is_removed'] as num).toInt(),
      isBlocked: (json['is_blocked'] as num).toInt(),
      blockedBy: (json['blocked_by'] as num?)?.toInt(),
      isReported: (json['is_reported'] as num).toInt(),
      reportedBy: (json['reported_by'] as num?)?.toInt(),
      reportReason: json['report_reason'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      targetUser: json['target_user'] == null
          ? null
          : User.fromJson(json['target_user'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ConnectionModelImplToJson(
        _$ConnectionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'target_user_id': instance.targetUserId,
      'is_connected': instance.isConnected,
      'connection_status': instance.connectionStatus,
      'connection_accepted_at': instance.connectionAcceptedAt,
      'connection_request_message': instance.connectionRequestMessage,
      'is_removed': instance.isRemoved,
      'is_blocked': instance.isBlocked,
      'blocked_by': instance.blockedBy,
      'is_reported': instance.isReported,
      'reported_by': instance.reportedBy,
      'report_reason': instance.reportReason,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'target_user': instance.targetUser,
      'user': instance.user,
    };
