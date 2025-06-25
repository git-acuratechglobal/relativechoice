import 'package:freezed_annotation/freezed_annotation.dart';
import '../../profile_feature/model/user_model.dart';
part 'connection_model.freezed.dart';
part 'connection_model.g.dart';

@freezed
class ConnectionModel with _$ConnectionModel {
  const factory ConnectionModel({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'target_user_id') required int targetUserId,
    @JsonKey(name: 'is_connected') required int isConnected,
    @JsonKey(name: 'connection_status') required int connectionStatus,
    @JsonKey(name: 'connection_accepted_at') String? connectionAcceptedAt,
    @JsonKey(name: 'connection_request_message') String? connectionRequestMessage,
    @JsonKey(name: 'is_removed') required int isRemoved,
    @JsonKey(name: 'is_blocked') required int isBlocked,
    @JsonKey(name: 'blocked_by') int? blockedBy,
    @JsonKey(name: 'is_reported') required int isReported,
    @JsonKey(name: 'reported_by') int? reportedBy,
    @JsonKey(name: 'report_reason') String? reportReason,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'target_user') required User? targetUser ,
    @JsonKey(name: 'user') required User? user,
  }) = _ConnectionModel;

  factory ConnectionModel.fromJson(Map<String, dynamic> json) =>
      _$ConnectionModelFromJson(json);
}







