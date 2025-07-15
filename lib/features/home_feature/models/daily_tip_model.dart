import 'package:json_annotation/json_annotation.dart';

part 'daily_tip_model.g.dart';

@JsonSerializable(createToJson: false)
class DailyTipModel {
  DailyTipModel({
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.createdAt,
  });

  final String? title;
  final String? content;

  @JsonKey(name: 'image_url')
  final dynamic imageUrl;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  factory DailyTipModel.fromJson(Map<String, dynamic> json) => _$DailyTipModelFromJson(json);

}
