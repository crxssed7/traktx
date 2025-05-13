import 'package:json_annotation/json_annotation.dart';
import 'package:traktx/src/models/movie.dart';
import 'package:traktx/src/models/note_item.dart';
part 'movie_note_item.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieNoteItem implements NoteItem {
  final String type;
  final Movie movie;

  MovieNoteItem({required this.type, required this.movie});

  factory MovieNoteItem.fromJson(Map<String, dynamic> json) =>
      _$MovieNoteItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MovieNoteItemToJson(this);
}
