// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_recommendation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieRecommendation _$MovieRecommendationFromJson(Map<String, dynamic> json) =>
    MovieRecommendation(
      title: json['title'] as String,
      year: (json['year'] as num?)?.toInt(),
      ids: TraktIds.fromJson(json['ids'] as Map<String, dynamic>),
      favoritedBy:
          (json['favorited_by'] as List<dynamic>)
              .map((e) => FavouritedBy.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$MovieRecommendationToJson(
  MovieRecommendation instance,
) => <String, dynamic>{
  'title': instance.title,
  'year': instance.year,
  'ids': instance.ids.toJson(),
  'favorited_by': instance.favoritedBy.map((e) => e.toJson()).toList(),
};
