import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/episode.dart';
import 'package:traktx/src/models/sharing.dart';
import 'package:traktx/src/requests/checkin_request.dart';
part 'checkin_episode_request.g.dart';

@JsonSerializable(explicitToJson: true)
class CheckinEpisodeRequest implements CheckinRequest {
  final Episode episode;
  final Sharing? sharing;
  final String? message;

  CheckinEpisodeRequest({required this.episode, this.sharing, this.message});

  factory CheckinEpisodeRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckinEpisodeRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CheckinEpisodeRequestToJson(this);
}
