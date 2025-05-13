// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_note_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieNoteItem _$MovieNoteItemFromJson(Map<String, dynamic> json) =>
    MovieNoteItem(
      type: json['type'] as String,
      movie: Movie.fromJson(json['movie'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieNoteItemToJson(MovieNoteItem instance) =>
    <String, dynamic>{'type': instance.type, 'movie': instance.movie.toJson()};
