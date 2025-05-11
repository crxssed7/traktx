import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/comment.dart';
import 'package:traktx/src/models/comment_item.dart';
import 'package:traktx/src/models/show.dart';
part 'show_comment_item.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ShowCommentItem implements CommentItem {
  final String type;
  final Show show;
  final Comment? comment;

  ShowCommentItem({required this.type, required this.show, this.comment});

  factory ShowCommentItem.fromJson(Map<String, dynamic> json) =>
      _$ShowCommentItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ShowCommentItemToJson(this);
}
