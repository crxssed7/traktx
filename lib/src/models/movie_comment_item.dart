import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/comment.dart';
import 'package:traktx/src/models/comment_item.dart';
import 'package:traktx/src/models/movie.dart';
part 'movie_comment_item.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class MovieCommentItem implements CommentItem {
  final String type;
  final Movie movie;
  final Comment? comment;

  MovieCommentItem({required this.type, required this.movie, this.comment});

  factory MovieCommentItem.fromJson(Map<String, dynamic> json) =>
      _$MovieCommentItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MovieCommentItemToJson(this);
}
