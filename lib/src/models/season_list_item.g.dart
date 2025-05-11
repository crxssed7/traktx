// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeasonListItem _$SeasonListItemFromJson(Map<String, dynamic> json) =>
    SeasonListItem(
      rank: (json['rank'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      listedAt: DateTime.parse(json['listed_at'] as String),
      type: json['type'] as String,
      season: Season.fromJson(json['season'] as Map<String, dynamic>),
      show: Show.fromJson(json['show'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SeasonListItemToJson(SeasonListItem instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'id': instance.id,
      'listed_at': instance.listedAt.toIso8601String(),
      'type': instance.type,
      'season': instance.season.toJson(),
      'show': instance.show.toJson(),
    };
