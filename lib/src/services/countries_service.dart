import 'dart:convert';

import 'package:traktx/src/core/client.dart';
import 'package:traktx/src/models/country.dart';

class CountriesService {
  final Client _client;

  CountriesService(this._client);

  Future<List<Country>> list(String type) async {
    final response = await _client.get('/countries/$type');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((country) => Country.fromJson(country)).toList();
  }
}
