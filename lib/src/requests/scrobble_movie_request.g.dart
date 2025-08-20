// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scrobble_movie_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScrobbleMovieRequest _$ScrobbleMovieRequestFromJson(
  Map<String, dynamic> json,
) => ScrobbleMovieRequest(
  movie: Movie.fromJson(json['movie'] as Map<String, dynamic>),
  progress: (json['progress'] as num).toDouble(),
);

Map<String, dynamic> _$ScrobbleMovieRequestToJson(
  ScrobbleMovieRequest instance,
) => <String, dynamic>{
  'movie': instance.movie.toJson(),
  'progress': instance.progress,
};
