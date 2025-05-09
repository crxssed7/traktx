import 'dart:convert';

import 'package:traktx/src/core/client.dart';
import 'package:traktx/src/models/language.dart';

class LanguagesService {
  final Client _client;

  LanguagesService(this._client);

  Future<List<Language>> list(String type) async {
    final response = await _client.get('/languages/$type');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((lang) => Language.fromJson(lang)).toList();
  }
}
