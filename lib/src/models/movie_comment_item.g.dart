// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_comment_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCommentItem _$MovieCommentItemFromJson(Map<String, dynamic> json) =>
    MovieCommentItem(
      type: json['type'] as String,
      movie: Movie.fromJson(json['movie'] as Map<String, dynamic>),
      comment:
          json['comment'] == null
              ? null
              : Comment.fromJson(json['comment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieCommentItemToJson(MovieCommentItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      'movie': instance.movie.toJson(),
      if (instance.comment?.toJson() case final value?) 'comment': value,
    };
