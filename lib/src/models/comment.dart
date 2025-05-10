import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/user.dart';
import 'package:traktx/src/models/user_stats.dart';
part 'comment.g.dart';

@JsonSerializable(explicitToJson: true)
class Comment {
  final int id;
  @JsonKey(name: 'parent_id')
  final int parentId;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final String comment;
  final bool spoiler;
  final bool review;
  final int replies;
  final int likes;
  @JsonKey(name: 'user_stats')
  final UserStats userStats;
  final User user;

  Comment({
    required this.id,
    required this.parentId,
    required this.createdAt,
    required this.comment,
    required this.spoiler,
    required this.review,
    required this.replies,
    required this.likes,
    required this.userStats,
    required this.user,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
