import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/movie.dart';
import 'package:traktx/src/models/sharing.dart';
part 'comment_movie_request.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class CommentMovieRequest {
  final Movie movie;
  final String comment;
  final bool? spoiler;
  final Sharing? sharing;

  CommentMovieRequest({
    required this.movie,
    required this.comment,
    this.spoiler,
    this.sharing,
  });

  factory CommentMovieRequest.fromJson(Map<String, dynamic> json) =>
      _$CommentMovieRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CommentMovieRequestToJson(this);
}
