import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/movie.dart';
import 'package:traktx/src/models/scrobble_item.dart';
import 'package:traktx/src/models/sharing.dart';
part 'scrobble_movie.g.dart';

@JsonSerializable(explicitToJson: true)
class ScrobbleMovie implements ScrobbleItem {
  final int id;
  final String action;
  final double progress;
  final Sharing sharing;
  final Movie movie;

  ScrobbleMovie({
    required this.id,
    required this.action,
    required this.progress,
    required this.sharing,
    required this.movie,
  });

  factory ScrobbleMovie.fromJson(Map<String, dynamic> json) =>
      _$ScrobbleMovieFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ScrobbleMovieToJson(this);
}
