import 'dart:convert';

import 'package:traktx/src/core/client.dart';
import 'package:traktx/src/models/alias.dart';
import 'package:traktx/src/models/comment.dart';
import 'package:traktx/src/models/movie.dart';
import 'package:traktx/src/models/network.dart';
import 'package:traktx/src/models/ratings.dart';
import 'package:traktx/src/models/release.dart';
import 'package:traktx/src/models/stats.dart';
import 'package:traktx/src/models/translation.dart';
import 'package:traktx/src/models/list.dart' as list;
import 'package:traktx/src/models/user.dart';
import 'package:traktx/src/models/video.dart';

class MoviesService {
  final Client _client;

  MoviesService(this._client);

  // TODO: Add wrapper classes

  Future<List<Movie>> trending() async {
    final response = await _client.get('/movies/trending');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((movie) => Movie.fromJson(movie['movie'])).toList();
  }

  Future<List<Movie>> popular() async {
    final response = await _client.get('/movies/popular');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((movie) => Movie.fromJson(movie)).toList();
  }

  Future<List<Movie>> favorited({String period = 'all'}) async {
    final response = await _client.get('/movies/favorited/$period');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((movie) => Movie.fromJson(movie['movie'])).toList();
  }

  Future<List<Movie>> mostPlayed({String period = 'all'}) async {
    final response = await _client.get('/movies/played/$period');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((movie) => Movie.fromJson(movie['movie'])).toList();
  }

  Future<List<Movie>> mostWatched({String period = 'all'}) async {
    final response = await _client.get('/movies/watched/$period');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((movie) => Movie.fromJson(movie['movie'])).toList();
  }

  Future<List<Movie>> mostCollected({String period = 'all'}) async {
    final response = await _client.get('/movies/collected/$period');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((movie) => Movie.fromJson(movie['movie'])).toList();
  }

  Future<List<Movie>> anticipated() async {
    final response = await _client.get('/movies/anticipated');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((movie) => Movie.fromJson(movie['movie'])).toList();
  }

  Future<List<Movie>> boxoffice() async {
    final response = await _client.get('/movies/boxoffice');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((movie) => Movie.fromJson(movie['movie'])).toList();
  }

  Future<List<Movie>> updated({DateTime? startDate}) async {
    var path = '/movies/updates';
    if (startDate != null) {
      path = '$path/$startDate';
    }
    final response = await _client.get(path);
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((movie) => Movie.fromJson(movie['movie'])).toList();
  }

  Future<List<int>> updatedIds({DateTime? startDate}) async {
    var path = '/movies/updates/id';
    if (startDate != null) {
      path = '$path/$startDate';
    }
    final response = await _client.get(path);
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((i) => i as int).toList();
  }

  Future<Movie> get(dynamic id) async {
    final response = await _client.get('/movies/$id');
    final Map<String, dynamic> raw = json.decode(response.body);
    return Movie.fromJson(raw);
  }

  Future<List<Alias>> aliases(dynamic id) async {
    final response = await _client.get('/movies/$id/aliases');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((alias) => Alias.fromJson(alias)).toList();
  }

  Future<List<Release>> releases(dynamic id, {String? country}) async {
    var path = '/movies/$id/releases';
    if (country != null) {
      path = '$path/$country';
    }
    final response = await _client.get(path);
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((release) => Release.fromJson(release)).toList();
  }

  Future<List<Translation>> translations(dynamic id, {String? language}) async {
    var path = '/movies/$id/translations';
    if (language != null) {
      path = '$path/$language';
    }
    final response = await _client.get(path);
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((release) => Translation.fromJson(release)).toList();
  }

  Future<List<Comment>> comments(dynamic id, {String sort = 'newest'}) async {
    final response = await _client.get('/movies/$id/comments/$sort');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((release) => Comment.fromJson(release)).toList();
  }

  Future<List<list.List>> lists(
    dynamic id, {
    String type = 'all',
    String sort = 'popular',
  }) async {
    final response = await _client.get('/movies/$id/lists/$type/$sort');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((release) => list.List.fromJson(release)).toList();
  }

  // TODO: People

  Future<Ratings> ratings(dynamic id) async {
    final response = await _client.get('/movies/$id/ratings');
    final Map<String, dynamic> raw = json.decode(response.body);
    return Ratings.fromJson(raw);
  }

  Future<List<Movie>> related(dynamic id) async {
    final response = await _client.get('/movies/$id/related');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((movie) => Movie.fromJson(movie)).toList();
  }

  Future<Stats> stats(dynamic id) async {
    final response = await _client.get('/movies/$id/stats');
    final Map<String, dynamic> raw = json.decode(response.body);
    return Stats.fromJson(raw);
  }

  Future<List<Network>> studios(dynamic id) async {
    final response = await _client.get('/movies/$id/studios');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((studio) => Network.fromJson(studio)).toList();
  }

  Future<List<User>> watching(dynamic id) async {
    final response = await _client.get('/movies/$id/watching');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((user) => User.fromJson(user)).toList();
  }

  Future<List<Video>> videos(dynamic id) async {
    final response = await _client.get('/movies/$id/videos');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((video) => Video.fromJson(video)).toList();
  }

  Future<void> refresh(dynamic id) async {
    await _client.post('/movies/$id/refresh');
  }
}
