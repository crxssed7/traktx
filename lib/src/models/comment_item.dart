import 'package:traktx/src/models/episode_comment_item.dart';
import 'package:traktx/src/models/list_comment_item.dart';
import 'package:traktx/src/models/movie_comment_item.dart';
import 'package:traktx/src/models/season_comment_item.dart';
import 'package:traktx/src/models/show_comment_item.dart';
import 'package:traktx/src/models/unknown_comment_item.dart';

abstract class CommentItem {
  factory CommentItem.fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'movie':
        return MovieCommentItem.fromJson(json);
      case 'show':
        return ShowCommentItem.fromJson(json);
      case 'season':
        return SeasonCommentItem.fromJson(json);
      case 'episode':
        return EpisodeCommentItem.fromJson(json);
      case 'list':
        return ListCommentItem.fromJson(json);
      default:
        return UnknownCommentItem.fromJson(json);
    }
  }

  Map<String, dynamic> toJson() {
    throw UnimplementedError('Implement in subclass');
  }
}
