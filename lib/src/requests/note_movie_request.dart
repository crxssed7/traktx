import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/movie.dart';
import 'package:traktx/src/requests/note_create_request.dart';
part 'note_movie_request.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class NoteMovieRequest implements NoteCreateRequest {
  final Movie movie;
  final String note;
  final bool? spoiler;
  final String? privacy;

  NoteMovieRequest({
    required this.movie,
    required this.note,
    this.spoiler,
    this.privacy,
  });

  factory NoteMovieRequest.fromJson(Map<String, dynamic> json) =>
      _$NoteMovieRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NoteMovieRequestToJson(this);
}
