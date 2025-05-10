// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin_episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckinEpisode _$CheckinEpisodeFromJson(Map<String, dynamic> json) =>
    CheckinEpisode(
      id: (json['id'] as num).toInt(),
      watchedAt: DateTime.parse(json['watched_at'] as String),
      sharing: Sharing.fromJson(json['sharing'] as Map<String, dynamic>),
      episode: Episode.fromJson(json['episode'] as Map<String, dynamic>),
      show: Show.fromJson(json['show'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckinEpisodeToJson(CheckinEpisode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'watched_at': instance.watchedAt.toIso8601String(),
      'sharing': instance.sharing.toJson(),
      'episode': instance.episode.toJson(),
      'show': instance.show.toJson(),
    };
