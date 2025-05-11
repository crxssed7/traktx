// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_comment_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCommentItem _$ListCommentItemFromJson(Map<String, dynamic> json) =>
    ListCommentItem(
      type: json['type'] as String,
      list: List.fromJson(json['list'] as Map<String, dynamic>),
      comment:
          json['comment'] == null
              ? null
              : Comment.fromJson(json['comment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListCommentItemToJson(ListCommentItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      'list': instance.list.toJson(),
      if (instance.comment?.toJson() case final value?) 'comment': value,
    };
