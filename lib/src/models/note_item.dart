import 'package:traktx/src/models/episode_note_item.dart';
import 'package:traktx/src/models/movie_note_item.dart';
import 'package:traktx/src/models/person_note_item.dart';
import 'package:traktx/src/models/season_note_item.dart';
import 'package:traktx/src/models/show_note_item.dart';
import 'package:traktx/src/models/unknown_note_item.dart';

abstract class NoteItem {
  factory NoteItem.fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'movie':
        return MovieNoteItem.fromJson(json);
      case 'show':
        return ShowNoteItem.fromJson(json);
      case 'season':
        return SeasonNoteItem.fromJson(json);
      case 'episode':
        return EpisodeNoteItem.fromJson(json);
      case 'person':
        return PersonNoteItem.fromJson(json);
      default:
        return UnknownNoteItem.fromJson(json);
    }
  }

  Map<String, dynamic> toJson() {
    throw UnimplementedError('Implement in subclass');
  }
}
