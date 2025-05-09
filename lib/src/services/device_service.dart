import 'dart:convert';

import 'package:traktx/src/core/client.dart';
import 'package:traktx/src/models/auth_token.dart';
import 'package:traktx/src/models/device_code.dart';

class DeviceService {
  final Client _client;

  DeviceService(this._client);

  Future<DeviceCode> generate() async {
    final body = {'client_id': _client.clientId};
    final response = await _client.post('/oauth/device/code', body: body);
    final Map<String, dynamic> rawJson = json.decode(response.body);
    return DeviceCode.fromJson(rawJson);
  }

  Future<AuthToken> poll(String code) async {
    final body = {
      'code': code,
      'client_id': _client.clientId,
      'client_secret': _client.clientSecret,
    };
    final response = await _client.post('/oauth/device/token', body: body);
    final Map<String, dynamic> rawJson = json.decode(response.body);
    return AuthToken.fromJson(rawJson);
  }
}
