import 'dart:convert';

import 'package:http/http.dart' as http;
import 'exceptions.dart';
import 'constants.dart';

class Client {
  final String clientId;
  final String clientSecret;
  final String redirectUri;

  String? accessToken;

  Client(this.clientId, this.clientSecret, this.redirectUri);

  Future<http.Response> get(String path, {Map<String, String>? query}) async {
    final uri = _buildUri(path, query);
    final response = await http.get(uri, headers: _headers());
    return _handleResponse(response);
  }

  Future<http.Response> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? query,
  }) async {
    final uri = _buildUri(path, query);
    final response = await http.post(
      uri,
      headers: _headers(),
      body: jsonEncode(body),
    );
    return _handleResponse(response);
  }

  Uri _buildUri(String path, [Map<String, String>? query]) {
    return Uri.parse('$baseUrl$path').replace(queryParameters: query);
  }

  Map<String, String> _headers() {
    return {
      'Content-Type': 'application/json',
      'trakt-api-key': clientId,
      'trakt-api-version': apiVersion,
      if (accessToken != null) 'Authorization': 'Bearer $accessToken',
    };
  }

  http.Response _handleResponse(http.Response response) {
    if (response.statusCode >= 300) {
      throw ApiException(
        'GET ${response.request?.url.path} failed: ${response.statusCode}',
        response.statusCode,
        response.body,
      );
    }

    return response;
  }
}
