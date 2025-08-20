// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListSearchResult _$ListSearchResultFromJson(Map<String, dynamic> json) =>
    ListSearchResult(
      type: json['type'] as String,
      score: (json['score'] as num).toDouble(),
      list: List.fromJson(json['list'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListSearchResultToJson(ListSearchResult instance) =>
    <String, dynamic>{
      'type': instance.type,
      'score': instance.score,
      'list': instance.list.toJson(),
    };
