import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/comment.dart';
import 'package:traktx/src/models/comment_item.dart';
import 'package:traktx/src/models/list.dart';
part 'list_comment_item.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ListCommentItem implements CommentItem {
  final String type;
  final List list;
  final Comment? comment;

  ListCommentItem({required this.type, required this.list, this.comment});

  factory ListCommentItem.fromJson(Map<String, dynamic> json) =>
      _$ListCommentItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ListCommentItemToJson(this);
}
