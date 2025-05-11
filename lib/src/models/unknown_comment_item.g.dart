// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unknown_comment_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnknownCommentItem _$UnknownCommentItemFromJson(Map<String, dynamic> json) =>
    UnknownCommentItem(
      type: json['type'] as String,
      comment:
          json['comment'] == null
              ? null
              : Comment.fromJson(json['comment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UnknownCommentItemToJson(UnknownCommentItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      if (instance.comment?.toJson() case final value?) 'comment': value,
    };
