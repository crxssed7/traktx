// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowSearchResult _$ShowSearchResultFromJson(Map<String, dynamic> json) =>
    ShowSearchResult(
      type: json['type'] as String,
      score: (json['score'] as num).toDouble(),
      show: Show.fromJson(json['show'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShowSearchResultToJson(ShowSearchResult instance) =>
    <String, dynamic>{
      'type': instance.type,
      'score': instance.score,
      'show': instance.show.toJson(),
    };
