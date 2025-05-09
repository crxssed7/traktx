import 'dart:convert';

import 'package:traktx/src/core/client.dart';
import 'package:traktx/src/core/constants.dart';
import 'package:traktx/src/models/auth_token.dart';

class OauthService {
  final Client _client;

  OauthService(this._client);

  String buildOauthRedirectUrl() {
    var url = baseUrl.replaceFirst('api.', '');
    url = url.replaceFirst('api-', '');
    return '$url/oauth/authorize?client_id=${_client.clientId}&redirect_uri=${_client.redirectUri}&response_type=code';
  }

  Future<AuthToken> exchange(String code) async {
    return await _sendRequest(code, 'authorization_code');
  }

  Future<AuthToken> refresh(String refreshToken) async {
    return await _sendRequest(refreshToken, 'refresh_token');
  }

  Future<void> revoke(String accessToken) async {
    final body = {
      'token': accessToken,
      'client_id': _client.clientId,
      'client_secret': _client.clientSecret,
    };
    await _client.post('/oauth/revoke', body: body);
  }

  Future<AuthToken> _sendRequest(String code, String grantType) async {
    final codeTypeMap = {
      'authorization_code': 'code',
      'refresh_token': 'refresh_token',
    };
    final codeType = codeTypeMap[grantType] ?? 'authorization_code';
    final body = {
      'client_id': _client.clientId,
      'client_secret': _client.clientSecret,
      'redirect_uri': _client.redirectUri,
      'grant_type': grantType,
    };
    body[codeType] = code;
    final response = await _client.post('/oauth/token', body: body);
    final Map<String, dynamic> rawJson = json.decode(response.body);
    return AuthToken.fromJson(rawJson);
  }
}
