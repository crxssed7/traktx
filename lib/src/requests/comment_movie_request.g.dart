// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_movie_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentMovieRequest _$CommentMovieRequestFromJson(Map<String, dynamic> json) =>
    CommentMovieRequest(
      movie: Movie.fromJson(json['movie'] as Map<String, dynamic>),
      comment: json['comment'] as String,
      spoiler: json['spoiler'] as bool?,
      sharing:
          json['sharing'] == null
              ? null
              : Sharing.fromJson(json['sharing'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentMovieRequestToJson(
  CommentMovieRequest instance,
) => <String, dynamic>{
  'movie': instance.movie.toJson(),
  'comment': instance.comment,
  if (instance.spoiler case final value?) 'spoiler': value,
  if (instance.sharing?.toJson() case final value?) 'sharing': value,
};
