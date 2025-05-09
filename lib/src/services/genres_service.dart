import 'dart:convert';

import 'package:traktx/src/core/client.dart';
import 'package:traktx/src/models/genre.dart';

class GenresService {
  final Client _client;

  GenresService(this._client);

  Future<List<Genre>> list(String type) async {
    final response = await _client.get('/genres/$type');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((genre) => Genre.fromJson(genre)).toList();
  }
}
