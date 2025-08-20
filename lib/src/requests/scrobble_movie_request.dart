import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/movie.dart';
import 'package:traktx/src/requests/scrobble_request.dart';
part 'scrobble_movie_request.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ScrobbleMovieRequest implements ScrobbleRequest {
  final Movie movie;
  final double progress;

  ScrobbleMovieRequest({required this.movie, required this.progress});

  factory ScrobbleMovieRequest.fromJson(Map<String, dynamic> json) =>
      _$ScrobbleMovieRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ScrobbleMovieRequestToJson(this);
}
