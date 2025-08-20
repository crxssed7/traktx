// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scrobble_episode_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScrobbleEpisodeRequest _$ScrobbleEpisodeRequestFromJson(
  Map<String, dynamic> json,
) => ScrobbleEpisodeRequest(
  episode: Episode.fromJson(json['episode'] as Map<String, dynamic>),
  progress: (json['progress'] as num).toDouble(),
);

Map<String, dynamic> _$ScrobbleEpisodeRequestToJson(
  ScrobbleEpisodeRequest instance,
) => <String, dynamic>{
  'episode': instance.episode.toJson(),
  'progress': instance.progress,
};
