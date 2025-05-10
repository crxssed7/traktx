import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/episode.dart';
import 'package:traktx/src/models/sharing.dart';
import 'package:traktx/src/models/show.dart';
part 'checkin_episode.g.dart';

@JsonSerializable(explicitToJson: true)
class CheckinEpisode {
  final int id;
  @JsonKey(name: 'watched_at')
  final DateTime watchedAt;
  final Sharing sharing;
  final Episode episode;
  final Show show;

  CheckinEpisode({
    required this.id,
    required this.watchedAt,
    required this.sharing,
    required this.episode,
    required this.show,
  });

  factory CheckinEpisode.fromJson(Map<String, dynamic> json) =>
      _$CheckinEpisodeFromJson(json);
  Map<String, dynamic> toJson() => _$CheckinEpisodeToJson(this);
}
