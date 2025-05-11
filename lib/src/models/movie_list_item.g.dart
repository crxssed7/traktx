// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListItem _$MovieListItemFromJson(Map<String, dynamic> json) =>
    MovieListItem(
      rank: (json['rank'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      listedAt: DateTime.parse(json['listed_at'] as String),
      type: json['type'] as String,
      movie: Movie.fromJson(json['movie'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieListItemToJson(MovieListItem instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'id': instance.id,
      'listed_at': instance.listedAt.toIso8601String(),
      'type': instance.type,
      'movie': instance.movie.toJson(),
    };
