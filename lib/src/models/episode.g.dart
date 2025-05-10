// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Episode _$EpisodeFromJson(Map<String, dynamic> json) => Episode(
  title: json['title'] as String?,
  season: (json['season'] as num).toInt(),
  number: (json['number'] as num).toInt(),
  ids: TraktIds.fromJson(json['ids'] as Map<String, dynamic>),
);

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
  'title': instance.title,
  'season': instance.season,
  'number': instance.number,
  'ids': instance.ids.toJson(),
};
