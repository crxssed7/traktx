import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/comment.dart';
import 'package:traktx/src/models/comment_item.dart';
import 'package:traktx/src/models/episode.dart';
part 'episode_comment_item.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class EpisodeCommentItem implements CommentItem {
  final String type;
  final Episode episode;
  final Comment? comment;

  EpisodeCommentItem({required this.type, required this.episode, this.comment});

  factory EpisodeCommentItem.fromJson(Map<String, dynamic> json) =>
      _$EpisodeCommentItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EpisodeCommentItemToJson(this);
}
