// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeSearchResult _$EpisodeSearchResultFromJson(Map<String, dynamic> json) =>
    EpisodeSearchResult(
      type: json['type'] as String,
      score: (json['score'] as num).toDouble(),
      episode: Episode.fromJson(json['episode'] as Map<String, dynamic>),
      show: Show.fromJson(json['show'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EpisodeSearchResultToJson(
  EpisodeSearchResult instance,
) => <String, dynamic>{
  'type': instance.type,
  'score': instance.score,
  'episode': instance.episode.toJson(),
  'show': instance.show.toJson(),
};
