import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/episode.dart';
import 'package:traktx/src/models/sharing.dart';
import 'package:traktx/src/requests/comment_create_request.dart';
part 'comment_episode_request.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class CommentEpisodeRequest implements CommentCreateRequest {
  final Episode episode;
  final String comment;
  final bool? spoiler;
  final Sharing? sharing;

  CommentEpisodeRequest({
    required this.episode,
    required this.comment,
    this.spoiler,
    this.sharing,
  });

  factory CommentEpisodeRequest.fromJson(Map<String, dynamic> json) =>
      _$CommentEpisodeRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CommentEpisodeRequestToJson(this);
}
