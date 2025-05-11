import 'package:traktx/src/models/episode_list_item.dart';
import 'package:traktx/src/models/movie_list_item.dart';
import 'package:traktx/src/models/person_list_item.dart';
import 'package:traktx/src/models/season_list_item.dart';
import 'package:traktx/src/models/show_list_item.dart';
import 'package:traktx/src/models/unknown_list_item.dart';

abstract class ListItem {
  factory ListItem.fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'movie':
        return MovieListItem.fromJson(json);
      case 'show':
        return ShowListItem.fromJson(json);
      case 'season':
        return SeasonListItem.fromJson(json);
      case 'episode':
        return EpisodeListItem.fromJson(json);
      case 'person':
        return PersonListItem.fromJson(json);
      default:
        return UnknownListItem.fromJson(json);
    }
  }

  Map<String, dynamic> toJson() {
    throw UnimplementedError('Implement in subclass');
  }
}
