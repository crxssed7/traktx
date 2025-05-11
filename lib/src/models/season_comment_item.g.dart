// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_comment_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeasonCommentItem _$SeasonCommentItemFromJson(Map<String, dynamic> json) =>
    SeasonCommentItem(
      type: json['type'] as String,
      season: Season.fromJson(json['season'] as Map<String, dynamic>),
      comment:
          json['comment'] == null
              ? null
              : Comment.fromJson(json['comment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SeasonCommentItemToJson(SeasonCommentItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      'season': instance.season.toJson(),
      if (instance.comment?.toJson() case final value?) 'comment': value,
    };
