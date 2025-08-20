import 'package:traktx/src/models/episode_search_result.dart';
import 'package:traktx/src/models/list_search_result.dart';
import 'package:traktx/src/models/movie_search_result.dart';
import 'package:traktx/src/models/person_search_result.dart';
import 'package:traktx/src/models/show_search_result.dart';

abstract class SearchResult {
  factory SearchResult.fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'movie':
        return MovieSearchResult.fromJson(json);
      case 'show':
        return ShowSearchResult.fromJson(json);
      case 'episode':
        return EpisodeSearchResult.fromJson(json);
      case 'person':
        return PersonSearchResult.fromJson(json);
      case 'list':
        return ListSearchResult.fromJson(json);
      default:
        // This should never happen, in theory
        throw ArgumentError('Unknown type');
    }
  }

  Map<String, dynamic> toJson() {
    throw UnimplementedError('Implement in subclass');
  }
}
