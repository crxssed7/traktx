import 'dart:convert';

import 'package:traktx/src/core/client.dart';
import 'package:traktx/src/models/network.dart';

class NetworksService {
  final Client _client;

  NetworksService(this._client);

  Future<List<Network>> list({int page = 1, int limit = 10}) async {
    final response = await _client.get(
      '/networks',
      query: {'page': page, 'limit': limit},
    );
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((network) => Network.fromJson(network)).toList();
  }
}
