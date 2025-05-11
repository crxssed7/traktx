// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_comment_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowCommentItem _$ShowCommentItemFromJson(Map<String, dynamic> json) =>
    ShowCommentItem(
      type: json['type'] as String,
      show: Show.fromJson(json['show'] as Map<String, dynamic>),
      comment:
          json['comment'] == null
              ? null
              : Comment.fromJson(json['comment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShowCommentItemToJson(ShowCommentItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      'show': instance.show.toJson(),
      if (instance.comment?.toJson() case final value?) 'comment': value,
    };
