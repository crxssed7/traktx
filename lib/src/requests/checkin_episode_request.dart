import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/episode.dart';
import 'package:traktx/src/models/sharing.dart';
part 'checkin_episode_request.g.dart';

@JsonSerializable(explicitToJson: true)
class CheckinEpisodeRequest {
  final Episode episode;
  final Sharing? sharing;
  final String? message;

  CheckinEpisodeRequest({required this.episode, this.sharing, this.message});

  factory CheckinEpisodeRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckinEpisodeRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CheckinEpisodeRequestToJson(this);
}
