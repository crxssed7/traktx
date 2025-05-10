// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin_movie_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckinMovieRequest _$CheckinMovieRequestFromJson(Map<String, dynamic> json) =>
    CheckinMovieRequest(
      movie: Movie.fromJson(json['movie'] as Map<String, dynamic>),
      sharing:
          json['sharing'] == null
              ? null
              : Sharing.fromJson(json['sharing'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CheckinMovieRequestToJson(
  CheckinMovieRequest instance,
) => <String, dynamic>{
  'movie': instance.movie.toJson(),
  'sharing': instance.sharing?.toJson(),
  'message': instance.message,
};
