// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_tip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyTipModel _$DailyTipModelFromJson(Map<String, dynamic> json) =>
    DailyTipModel(
      title: json['title'] as String?,
      content: json['content'] as String?,
      imageUrl: json['image_url'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );
