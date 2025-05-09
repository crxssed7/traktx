import 'package:http/http.dart' as http;
import 'exceptions.dart';
import 'constants.dart';

class Client {
  final String clientId;

  Client(this.clientId);

  Future<http.Response> get(String path, [Map<String, String>? query]) async {
    final uri = Uri.parse('$baseUrl$path').replace(queryParameters: query);
    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'trakt-api-key': clientId,
        'trakt-api-version': apiVersion,
      },
    );

    if (response.statusCode >= 300) {
      throw ApiException(
        'GET $path failed: ${response.statusCode}',
        response.statusCode,
        response.body,
      );
    }

    return response;
  }
}
