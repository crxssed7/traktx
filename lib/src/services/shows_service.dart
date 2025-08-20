import 'dart:convert';

import 'package:traktx/src/core/client.dart';
import 'package:traktx/src/models/alias.dart';
import 'package:traktx/src/models/certification.dart';
import 'package:traktx/src/models/comment.dart';
import 'package:traktx/src/models/episode.dart';
import 'package:traktx/src/models/network.dart';
import 'package:traktx/src/models/ratings.dart';
import 'package:traktx/src/models/show.dart';
import 'package:traktx/src/models/stats.dart';
import 'package:traktx/src/models/translation.dart';
import 'package:traktx/src/models/list.dart' as list;
import 'package:traktx/src/models/user.dart';
import 'package:traktx/src/models/video.dart';

class ShowsService {
  final Client _client;

  ShowsService(this._client);

  // TODO: Add wrapper classes

  Future<List<Show>> trending() async {
    final response = await _client.get('/shows/trending');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((show) => Show.fromJson(show['show'])).toList();
  }

  Future<List<Show>> popular() async {
    final response = await _client.get('/shows/popular');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((show) => Show.fromJson(show)).toList();
  }

  Future<List<Show>> favorited({String period = 'all'}) async {
    final response = await _client.get('/shows/favorited/$period');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((show) => Show.fromJson(show['show'])).toList();
  }

  Future<List<Show>> mostPlayed({String period = 'all'}) async {
    final response = await _client.get('/shows/played/$period');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((show) => Show.fromJson(show['show'])).toList();
  }

  Future<List<Show>> mostWatched({String period = 'all'}) async {
    final response = await _client.get('/shows/watched/$period');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((show) => Show.fromJson(show['show'])).toList();
  }

  Future<List<Show>> mostCollected({String period = 'all'}) async {
    final response = await _client.get('/shows/collected/$period');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((show) => Show.fromJson(show['show'])).toList();
  }

  Future<List<Show>> anticipated() async {
    final response = await _client.get('/shows/anticipated');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((show) => Show.fromJson(show['show'])).toList();
  }

  Future<List<Show>> updated({DateTime? startDate}) async {
    var path = '/shows/updates';
    if (startDate != null) {
      path = '$path/$startDate';
    }
    final response = await _client.get(path);
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((show) => Show.fromJson(show['show'])).toList();
  }

  Future<List<int>> updatedIds({DateTime? startDate}) async {
    var path = '/shows/updates/id';
    if (startDate != null) {
      path = '$path/$startDate';
    }
    final response = await _client.get(path);
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((i) => i as int).toList();
  }

  Future<Show> get(String id) async {
    final response = await _client.get('/shows/$id');
    final Map<String, dynamic> raw = json.decode(response.body);
    return Show.fromJson(raw);
  }

  Future<List<Alias>> aliases(String id) async {
    final response = await _client.get('/shows/$id/aliases');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((alias) => Alias.fromJson(alias)).toList();
  }

  Future<List<Certification>> certifications(String id) async {
    var path = '/shows/$id/certifications';
    final response = await _client.get(path);
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((cert) => Certification.fromJson(cert)).toList();
  }

  Future<List<Translation>> translations(String id, {String? language}) async {
    var path = '/shows/$id/translations';
    if (language != null) {
      path = '$path/$language';
    }
    final response = await _client.get(path);
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((release) => Translation.fromJson(release)).toList();
  }

  Future<List<Comment>> comments(String id, {String sort = 'newest'}) async {
    final response = await _client.get('/shows/$id/comments/$sort');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((release) => Comment.fromJson(release)).toList();
  }

  Future<List<list.List>> lists(
    String id, {
    String type = 'all',
    String sort = 'popular',
  }) async {
    final response = await _client.get('/shows/$id/lists/$type/$sort');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((l) => list.List.fromJson(l)).toList();
  }

  // TODO: People
  // TODO: Collection progress
  // TODO: Watched progress
  // TODO: Reset watched progress

  Future<Ratings> ratings(String id) async {
    final response = await _client.get('/shows/$id/ratings');
    final Map<String, dynamic> raw = json.decode(response.body);
    return Ratings.fromJson(raw);
  }

  Future<List<Show>> related(String id) async {
    final response = await _client.get('/shows/$id/related');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((show) => Show.fromJson(show)).toList();
  }

  Future<Stats> stats(String id) async {
    final response = await _client.get('/shows/$id/stats');
    final Map<String, dynamic> raw = json.decode(response.body);
    return Stats.fromJson(raw);
  }

  Future<List<Network>> studios(String id) async {
    final response = await _client.get('/shows/$id/studios');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((studio) => Network.fromJson(studio)).toList();
  }

  Future<List<User>> watching(String id) async {
    final response = await _client.get('/shows/$id/watching');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((user) => User.fromJson(user)).toList();
  }

  Future<Episode?> nextEpisode(String id) async {
    final response = await _client.get('/shows/$id/next_episode');
    if (response.body.isNotEmpty) {
      final Map<String, dynamic> raw = json.decode(response.body);
      return Episode.fromJson(raw);
    }
    return null;
  }

  Future<Episode?> lastEpisode(String id) async {
    final response = await _client.get('/shows/$id/last_episode');
    if (response.body.isNotEmpty) {
      final Map<String, dynamic> raw = json.decode(response.body);
      return Episode.fromJson(raw);
    }
    return null;
  }

  Future<List<Video>> videos(String id) async {
    final response = await _client.get('/shows/$id/videos');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((video) => Video.fromJson(video)).toList();
  }

  Future<void> refresh(String id) async {
    await _client.post('/shows/$id/refresh');
  }
}
