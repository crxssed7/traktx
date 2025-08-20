// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scrobble_episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScrobbleEpisode _$ScrobbleEpisodeFromJson(Map<String, dynamic> json) =>
    ScrobbleEpisode(
      id: (json['id'] as num).toInt(),
      action: json['action'] as String,
      progress: (json['progress'] as num).toDouble(),
      sharing: Sharing.fromJson(json['sharing'] as Map<String, dynamic>),
      episode: Episode.fromJson(json['episode'] as Map<String, dynamic>),
      show: Show.fromJson(json['show'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScrobbleEpisodeToJson(ScrobbleEpisode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'action': instance.action,
      'progress': instance.progress,
      'sharing': instance.sharing.toJson(),
      'episode': instance.episode.toJson(),
      'show': instance.show.toJson(),
    };
