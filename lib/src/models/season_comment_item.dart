import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/comment.dart';
import 'package:traktx/src/models/comment_item.dart';
import 'package:traktx/src/models/season.dart';
part 'season_comment_item.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SeasonCommentItem implements CommentItem {
  final String type;
  final Season season;
  final Comment? comment;

  SeasonCommentItem({required this.type, required this.season, this.comment});

  factory SeasonCommentItem.fromJson(Map<String, dynamic> json) =>
      _$SeasonCommentItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SeasonCommentItemToJson(this);
}
