import 'dart:convert';

import 'package:traktx/src/core/client.dart';
import 'package:traktx/src/models/comment.dart';
import 'package:traktx/src/models/episode.dart';
import 'package:traktx/src/models/ratings.dart';
import 'package:traktx/src/models/list.dart' as list;
import 'package:traktx/src/models/stats.dart';
import 'package:traktx/src/models/translation.dart';
import 'package:traktx/src/models/user.dart';
import 'package:traktx/src/models/video.dart';

class EpisodesService {
  final Client _client;

  EpisodesService(this._client);

  Future<Episode> get(
    String showId, {
    required int seasonNumber,
    required int episodeNumber,
  }) async {
    final response = await _client.get(
      '/shows/$showId/seasons/$seasonNumber/episodes/$episodeNumber',
    );
    final Map<String, dynamic> raw = json.decode(response.body);
    return Episode.fromJson(raw);
  }

  Future<List<Translation>> translations(
    String showId, {
    required int seasonNumber,
    required int episodeNumber,
    String? language,
  }) async {
    var path = '/shows/$showId/seasons/$seasonNumber/episodes/$episodeNumber';
    if (language != null) {
      path = '$path/$language';
    }
    final response = await _client.get(path);
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList
        .map((translation) => Translation.fromJson(translation))
        .toList();
  }

  Future<List<Comment>> comments(
    String showId, {
    required int seasonNumber,
    required int episodeNumber,
    String sort = 'newest',
  }) async {
    final response = await _client.get(
      '/shows/$showId/seasons/$seasonNumber/episodes/$episodeNumber/comments/$sort',
    );
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((release) => Comment.fromJson(release)).toList();
  }

  Future<List<list.List>> lists(
    String showId, {
    required int seasonNumber,
    required int episodeNumber,
    String type = 'all',
    String sort = 'popular',
  }) async {
    final response = await _client.get(
      '/shows/$showId/seasons/$seasonNumber/episodes/$episodeNumber/lists/$type/$sort',
    );
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((l) => list.List.fromJson(l)).toList();
  }

  // TODO: People

  Future<Ratings> ratings(
    String showId, {
    required int seasonNumber,
    required int episodeNumber,
  }) async {
    final response = await _client.get(
      '/shows/$showId/seasons/$seasonNumber/episodes/$episodeNumber/ratings',
    );
    final Map<String, dynamic> raw = json.decode(response.body);
    return Ratings.fromJson(raw);
  }

  Future<Stats> stats(
    String showId, {
    required int seasonNumber,
    required int episodeNumber,
  }) async {
    final response = await _client.get(
      '/shows/$showId/seasons/$seasonNumber/episodes/$episodeNumber/stats',
    );
    final Map<String, dynamic> raw = json.decode(response.body);
    return Stats.fromJson(raw);
  }

  Future<List<User>> watching(
    String showId, {
    required int seasonNumber,
    required int episodeNumber,
  }) async {
    final response = await _client.get(
      '/shows/$showId/seasons/$seasonNumber/episodes/$episodeNumber/watching',
    );
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((user) => User.fromJson(user)).toList();
  }

  Future<List<Video>> videos(
    String showId, {
    required int seasonNumber,
    required int episodeNumber,
  }) async {
    final response = await _client.get(
      '/shows/$showId/seasons/$seasonNumber/episodes/$episodeNumber/videos',
    );
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((video) => Video.fromJson(video)).toList();
  }
}
