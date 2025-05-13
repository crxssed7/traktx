// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_movie_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteMovieRequest _$NoteMovieRequestFromJson(Map<String, dynamic> json) =>
    NoteMovieRequest(
      movie: Movie.fromJson(json['movie'] as Map<String, dynamic>),
      note: json['note'] as String,
      spoiler: json['spoiler'] as bool?,
      privacy: json['privacy'] as String?,
    );

Map<String, dynamic> _$NoteMovieRequestToJson(NoteMovieRequest instance) =>
    <String, dynamic>{
      'movie': instance.movie.toJson(),
      'note': instance.note,
      if (instance.spoiler case final value?) 'spoiler': value,
      if (instance.privacy case final value?) 'privacy': value,
    };
