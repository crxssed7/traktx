import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/comment.dart';
import 'package:traktx/src/models/comment_item.dart';
part 'unknown_comment_item.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class UnknownCommentItem implements CommentItem {
  final String type;
  final Comment? comment;

  UnknownCommentItem({required this.type, this.comment});

  factory UnknownCommentItem.fromJson(Map<String, dynamic> json) =>
      _$UnknownCommentItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UnknownCommentItemToJson(this);
}
