// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scrobble_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScrobbleMovie _$ScrobbleMovieFromJson(Map<String, dynamic> json) =>
    ScrobbleMovie(
      id: (json['id'] as num).toInt(),
      action: json['action'] as String,
      progress: (json['progress'] as num).toDouble(),
      sharing: Sharing.fromJson(json['sharing'] as Map<String, dynamic>),
      movie: Movie.fromJson(json['movie'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScrobbleMovieToJson(ScrobbleMovie instance) =>
    <String, dynamic>{
      'id': instance.id,
      'action': instance.action,
      'progress': instance.progress,
      'sharing': instance.sharing.toJson(),
      'movie': instance.movie.toJson(),
    };
