// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieSearchResult _$MovieSearchResultFromJson(Map<String, dynamic> json) =>
    MovieSearchResult(
      type: json['type'] as String,
      score: (json['score'] as num).toDouble(),
      movie: Movie.fromJson(json['movie'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieSearchResultToJson(MovieSearchResult instance) =>
    <String, dynamic>{
      'type': instance.type,
      'score': instance.score,
      'movie': instance.movie.toJson(),
    };
