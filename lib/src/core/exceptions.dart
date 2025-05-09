class ApiException implements Exception {
  final String message;
  final int statusCode;
  final String rawBody;

  ApiException(this.message, this.statusCode, this.rawBody);

  @override
  String toString() => 'ApiException: $message';
}
