import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/episode.dart';
import 'package:traktx/src/requests/scrobble_request.dart';
part 'scrobble_episode_request.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ScrobbleEpisodeRequest implements ScrobbleRequest {
  final Episode episode;
  final double progress;

  ScrobbleEpisodeRequest({required this.episode, required this.progress});

  factory ScrobbleEpisodeRequest.fromJson(Map<String, dynamic> json) =>
      _$ScrobbleEpisodeRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ScrobbleEpisodeRequestToJson(this);
}
