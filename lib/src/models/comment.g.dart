// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
  id: (json['id'] as num).toInt(),
  parentId: (json['parent_id'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  comment: json['comment'] as String,
  spoiler: json['spoiler'] as bool,
  review: json['review'] as bool,
  replies: (json['replies'] as num).toInt(),
  likes: (json['likes'] as num).toInt(),
  userStats: UserStats.fromJson(json['user_stats'] as Map<String, dynamic>),
  user: User.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
  'id': instance.id,
  'parent_id': instance.parentId,
  'created_at': instance.createdAt.toIso8601String(),
  'comment': instance.comment,
  'spoiler': instance.spoiler,
  'review': instance.review,
  'replies': instance.replies,
  'likes': instance.likes,
  'user_stats': instance.userStats.toJson(),
  'user': instance.user.toJson(),
};
