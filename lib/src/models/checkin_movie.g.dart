// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckinMovie _$CheckinMovieFromJson(Map<String, dynamic> json) => CheckinMovie(
  id: (json['id'] as num).toInt(),
  watchedAt: DateTime.parse(json['watched_at'] as String),
  sharing: Sharing.fromJson(json['sharing'] as Map<String, dynamic>),
  movie: Movie.fromJson(json['movie'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CheckinMovieToJson(CheckinMovie instance) =>
    <String, dynamic>{
      'id': instance.id,
      'watched_at': instance.watchedAt.toIso8601String(),
      'sharing': instance.sharing.toJson(),
      'movie': instance.movie.toJson(),
    };
