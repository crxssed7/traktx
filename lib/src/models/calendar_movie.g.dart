// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarMovie _$CalendarMovieFromJson(Map<String, dynamic> json) =>
    CalendarMovie(
      released: DateTime.parse(json['released'] as String),
      movie: Movie.fromJson(json['movie'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CalendarMovieToJson(CalendarMovie instance) =>
    <String, dynamic>{
      'released': instance.released.toIso8601String(),
      'movie': instance.movie.toJson(),
    };
