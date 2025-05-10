import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/movie.dart';
part 'calendar_movie.g.dart';

@JsonSerializable(explicitToJson: true)
class CalendarMovie {
  final DateTime released;
  final Movie movie;

  CalendarMovie({required this.released, required this.movie});

  factory CalendarMovie.fromJson(Map<String, dynamic> json) =>
      _$CalendarMovieFromJson(json);
  Map<String, dynamic> toJson() => _$CalendarMovieToJson(this);
}
