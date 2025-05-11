// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

List _$ListFromJson(Map<String, dynamic> json) => List(
  name: json['name'] as String,
  description: json['description'] as String,
  privacy: json['privacy'] as String,
  shareLink: json['share_link'] as String,
  type: json['type'] as String,
  displayNumbers: json['display_numbers'] as bool,
  allowComments: json['allow_comments'] as bool,
  sortBy: json['sort_by'] as String,
  sortHow: json['sort_how'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  itemCount: (json['item_count'] as num).toInt(),
  commentCount: (json['comment_count'] as num).toInt(),
  likes: (json['likes'] as num).toInt(),
  ids: TraktIds.fromJson(json['ids'] as Map<String, dynamic>),
  user: User.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ListToJson(List instance) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'privacy': instance.privacy,
  'share_link': instance.shareLink,
  'type': instance.type,
  'display_numbers': instance.displayNumbers,
  'allow_comments': instance.allowComments,
  'sort_by': instance.sortBy,
  'sort_how': instance.sortHow,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'item_count': instance.itemCount,
  'comment_count': instance.commentCount,
  'likes': instance.likes,
  'ids': instance.ids.toJson(),
  'user': instance.user.toJson(),
};
