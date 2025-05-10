// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarShow _$CalendarShowFromJson(Map<String, dynamic> json) => CalendarShow(
  firstAired: DateTime.parse(json['first_aired'] as String),
  episode: Episode.fromJson(json['episode'] as Map<String, dynamic>),
  show: Show.fromJson(json['show'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CalendarShowToJson(CalendarShow instance) =>
    <String, dynamic>{
      'first_aired': instance.firstAired.toIso8601String(),
      'episode': instance.episode.toJson(),
      'show': instance.show.toJson(),
    };
