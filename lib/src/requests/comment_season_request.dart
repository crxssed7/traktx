import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/season.dart';
import 'package:traktx/src/models/sharing.dart';
import 'package:traktx/src/requests/comment_create_request.dart';
part 'comment_season_request.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class CommentSeasonRequest implements CommentCreateRequest {
  final Season season;
  final String comment;
  final bool? spoiler;
  final Sharing? sharing;

  CommentSeasonRequest({
    required this.season,
    required this.comment,
    this.spoiler,
    this.sharing,
  });

  factory CommentSeasonRequest.fromJson(Map<String, dynamic> json) =>
      _$CommentSeasonRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CommentSeasonRequestToJson(this);
}
