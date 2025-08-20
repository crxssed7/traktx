import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/episode.dart';
import 'package:traktx/src/models/scrobble_item.dart';
import 'package:traktx/src/models/sharing.dart';
import 'package:traktx/src/models/show.dart';
part 'scrobble_episode.g.dart';

@JsonSerializable(explicitToJson: true)
class ScrobbleEpisode implements ScrobbleItem {
  final int id;
  final String action;
  final double progress;
  final Sharing sharing;
  final Episode episode;
  final Show show;

  ScrobbleEpisode({
    required this.id,
    required this.action,
    required this.progress,
    required this.sharing,
    required this.episode,
    required this.show,
  });

  factory ScrobbleEpisode.fromJson(Map<String, dynamic> json) =>
      _$ScrobbleEpisodeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ScrobbleEpisodeToJson(this);
}
