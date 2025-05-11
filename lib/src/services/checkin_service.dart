import 'dart:convert';

import 'package:traktx/src/core/client.dart';
import 'package:traktx/src/models/checkin_movie.dart';
import 'package:traktx/src/requests/checkin_request.dart';

class CheckinService {
  final Client _client;

  CheckinService(this._client);

  Future<CheckinMovie> checkin(CheckinRequest request) async {
    final response = await _client.post('/checkin', body: request.toJson());
    final Map<String, dynamic> raw = json.decode(response.body);
    return CheckinMovie.fromJson(raw);
  }

  Future<void> delete() async {
    await _client.delete('/checkin');
  }
}
