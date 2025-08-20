// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonSearchResult _$PersonSearchResultFromJson(Map<String, dynamic> json) =>
    PersonSearchResult(
      type: json['type'] as String,
      score: (json['score'] as num).toDouble(),
      person: Person.fromJson(json['person'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonSearchResultToJson(PersonSearchResult instance) =>
    <String, dynamic>{
      'type': instance.type,
      'score': instance.score,
      'person': instance.person.toJson(),
    };
