// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stats _$StatsFromJson(Map<String, dynamic> json) => Stats(
  watchers: (json['watchers'] as num).toInt(),
  plays: (json['plays'] as num).toInt(),
  collectors: (json['collectors'] as num).toInt(),
  collectedEpisodes: (json['collected_episodes'] as num?)?.toInt(),
  comments: (json['comments'] as num).toInt(),
  lists: (json['lists'] as num).toInt(),
  votes: (json['votes'] as num).toInt(),
  favorited: (json['favorited'] as num?)?.toInt(),
);

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
  'watchers': instance.watchers,
  'plays': instance.plays,
  'collectors': instance.collectors,
  if (instance.collectedEpisodes case final value?) 'collected_episodes': value,
  'comments': instance.comments,
  'lists': instance.lists,
  'votes': instance.votes,
  if (instance.favorited case final value?) 'favorited': value,
};
