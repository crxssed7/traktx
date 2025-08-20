import 'dart:convert';

import 'package:traktx/src/core/client.dart';
import 'package:traktx/src/models/scrobble_episode.dart';
import 'package:traktx/src/models/scrobble_item.dart';
import 'package:traktx/src/models/scrobble_movie.dart';
import 'package:traktx/src/requests/scrobble_episode_request.dart';
import 'package:traktx/src/requests/scrobble_request.dart';

// TODO: Not tested. This needs to be manually tested, at least.
class ScrobbleService {
  final Client _client;

  ScrobbleService(this._client);

  Future<ScrobbleItem> start(ScrobbleRequest request) async {
    final response = await _client.post(
      '/scrobble/start',
      body: request.toJson(),
    );
    final Map<String, dynamic> raw = json.decode(response.body);
    if (request is ScrobbleEpisodeRequest) {
      return ScrobbleEpisode.fromJson(raw);
    } else {
      return ScrobbleMovie.fromJson(raw);
    }
  }

  Future<ScrobbleItem> pause(ScrobbleRequest request) async {
    final response = await _client.post(
      '/scrobble/pause',
      body: request.toJson(),
    );
    final Map<String, dynamic> raw = json.decode(response.body);
    if (request is ScrobbleEpisodeRequest) {
      return ScrobbleEpisode.fromJson(raw);
    } else {
      return ScrobbleMovie.fromJson(raw);
    }
  }

  Future<ScrobbleItem> stop(ScrobbleRequest request) async {
    final response = await _client.post(
      '/scrobble/stop',
      body: request.toJson(),
    );
    final Map<String, dynamic> raw = json.decode(response.body);
    if (request is ScrobbleEpisodeRequest) {
      return ScrobbleEpisode.fromJson(raw);
    } else {
      return ScrobbleMovie.fromJson(raw);
    }
  }
}
