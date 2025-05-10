import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/movie.dart';
import 'package:traktx/src/models/sharing.dart';
part 'checkin_movie.g.dart';

@JsonSerializable(explicitToJson: true)
class CheckinMovie {
  final int id;
  @JsonKey(name: 'watched_at')
  final DateTime watchedAt;
  final Sharing sharing;
  final Movie movie;

  CheckinMovie({
    required this.id,
    required this.watchedAt,
    required this.sharing,
    required this.movie,
  });

  factory CheckinMovie.fromJson(Map<String, dynamic> json) =>
      _$CheckinMovieFromJson(json);
  Map<String, dynamic> toJson() => _$CheckinMovieToJson(this);
}
