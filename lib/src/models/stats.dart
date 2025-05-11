import 'package:json_annotation/json_annotation.dart';
part 'stats.g.dart';

@JsonSerializable(includeIfNull: false)
class Stats {
  final int watchers;
  final int plays;
  final int collectors;
  @JsonKey(name: 'collected_episodes')
  final int? collectedEpisodes;
  final int comments;
  final int lists;
  final int votes;
  final int? favorited;

  Stats({
    required this.watchers,
    required this.plays,
    required this.collectors,
    this.collectedEpisodes,
    required this.comments,
    required this.lists,
    required this.votes,
    this.favorited,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
  Map<String, dynamic> toJson() => _$StatsToJson(this);
}
