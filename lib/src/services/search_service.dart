import 'dart:convert';

import 'package:traktx/src/core/client.dart';
import 'package:traktx/src/models/search_result.dart';

class SearchService {
  final Client _client;

  SearchService(this._client);

  Future<List<SearchResult>> text(String type, String query) async {
    final response = await _client.get(
      '/search/$type',
      query: {'query': query},
    );
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((res) => SearchResult.fromJson(res)).toList();
  }

  // TODO: ID Lookup
}
