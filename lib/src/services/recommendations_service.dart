import 'dart:convert';

import 'package:traktx/src/core/client.dart';
import 'package:traktx/src/models/movie_recommendation.dart';
import 'package:traktx/src/models/show_recommendation.dart';

class RecommendationsService {
  final Client _client;

  RecommendationsService(this._client);

  Future<List<MovieRecommendation>> movies({
    bool ignoreCollected = false,
    bool ignoreWatchlist = false,
  }) async {
    final response = await _client.get(
      '/recommendations/movies',
      query: {
        'ignore_collected': '$ignoreCollected',
        'ignore_watchlist': '$ignoreWatchlist',
      },
    );
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((rec) => MovieRecommendation.fromJson(rec)).toList();
  }

  Future<void> hideMovie(String id) async {
    await _client.delete('/recommendations/movies/$id');
  }

  Future<List<ShowRecommendation>> shows({
    bool ignoreCollected = false,
    bool ignoreWatchlist = false,
  }) async {
    final response = await _client.get(
      '/recommendations/shows',
      query: {
        'ignore_collected': '$ignoreCollected',
        'ignore_watchlist': '$ignoreWatchlist',
      },
    );
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((rec) => ShowRecommendation.fromJson(rec)).toList();
  }

  Future<void> hideShow(String id) async {
    await _client.delete('/recommendations/shows/$id');
  }
}
