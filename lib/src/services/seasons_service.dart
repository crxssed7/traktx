import 'dart:convert';

import 'package:traktx/src/core/client.dart';
import 'package:traktx/src/models/comment.dart';
import 'package:traktx/src/models/episode.dart';
import 'package:traktx/src/models/ratings.dart';
import 'package:traktx/src/models/season.dart';
import 'package:traktx/src/models/list.dart' as list;
import 'package:traktx/src/models/stats.dart';
import 'package:traktx/src/models/translation.dart';
import 'package:traktx/src/models/user.dart';
import 'package:traktx/src/models/video.dart';

class SeasonsService {
  final Client _client;

  SeasonsService(this._client);

  Future<List<Season>> seasons(String id) async {
    final response = await _client.get('/shows/$id/seasons');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((season) => Season.fromJson(season)).toList();
  }

  Future<Season> get(String showId, {required int seasonNumber}) async {
    final response = await _client.get('/shows/$showId/seasons/$seasonNumber');
    final Map<String, dynamic> raw = json.decode(response.body);
    return Season.fromJson(raw);
  }

  Future<List<Episode>> episodes(
    String showId, {
    required int seasonNumber,
  }) async {
    final response = await _client.get('/shows/$showId/seasons/$seasonNumber');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((episode) => Episode.fromJson(episode)).toList();
  }

  Future<List<Translation>> translations(
    String showId, {
    required int seasonNumber,
    String? language,
  }) async {
    var path = '/shows/$showId/seasons/$seasonNumber';
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
    String sort = 'newest',
  }) async {
    final response = await _client.get(
      '/shows/$showId/seasons/$seasonNumber/comments/$sort',
    );
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((release) => Comment.fromJson(release)).toList();
  }

  Future<List<list.List>> lists(
    String showId, {
    required int seasonNumber,
    String type = 'all',
    String sort = 'popular',
  }) async {
    final response = await _client.get(
      '/shows/$showId/seasons/$seasonNumber/lists/$type/$sort',
    );
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((l) => list.List.fromJson(l)).toList();
  }

  // TODO: People

  Future<Ratings> ratings(String showId, {required int seasonNumber}) async {
    final response = await _client.get(
      '/shows/$showId/seasons/$seasonNumber/ratings',
    );
    final Map<String, dynamic> raw = json.decode(response.body);
    return Ratings.fromJson(raw);
  }

  Future<Stats> stats(String showId, {required int seasonNumber}) async {
    final response = await _client.get(
      '/shows/$showId/seasons/$seasonNumber/stats',
    );
    final Map<String, dynamic> raw = json.decode(response.body);
    return Stats.fromJson(raw);
  }

  Future<List<User>> watching(
    String showId, {
    required int seasonNumber,
  }) async {
    final response = await _client.get(
      '/shows/$showId/seasons/$seasonNumber/watching',
    );
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((user) => User.fromJson(user)).toList();
  }

  Future<List<Video>> videos(String showId, {required int seasonNumber}) async {
    final response = await _client.get(
      '/shows/$showId/seasons/$seasonNumber/videos',
    );
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((video) => Video.fromJson(video)).toList();
  }
}
