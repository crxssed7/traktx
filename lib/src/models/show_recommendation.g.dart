// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_recommendation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowRecommendation _$ShowRecommendationFromJson(Map<String, dynamic> json) =>
    ShowRecommendation(
      title: json['title'] as String,
      year: (json['year'] as num).toInt(),
      ids: TraktIds.fromJson(json['ids'] as Map<String, dynamic>),
      favoritedBy:
          (json['favorited_by'] as List<dynamic>)
              .map((e) => FavouritedBy.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ShowRecommendationToJson(ShowRecommendation instance) =>
    <String, dynamic>{
      'title': instance.title,
      'year': instance.year,
      'ids': instance.ids.toJson(),
      'favorited_by': instance.favoritedBy.map((e) => e.toJson()).toList(),
    };
