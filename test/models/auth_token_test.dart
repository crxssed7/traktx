import 'package:traktx/src/models/auth_token.dart';
import 'package:test/test.dart';

void main() {
  group('AuthToken', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'access_token': 'token',
          'token_type': 'token type',
          'expires_in': 123,
          'refresh_token': 'refresh token',
          'scope': 'public',
          'created_at': 123,
        };
        final token = AuthToken.fromJson(json);
        expect(token.accessToken, 'token');
        expect(token.tokenType, 'token type');
        expect(token.expiresIn, 123);
        expect(token.refreshToken, 'refresh token');
        expect(token.scope, 'public');
        expect(token.createdAt, 123);
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final token = AuthToken(
          accessToken: 'token',
          tokenType: 'token type',
          expiresIn: 123,
          refreshToken: 'refresh token',
          scope: 'public',
          createdAt: 123,
        );
        final expectedJson = {
          'access_token': 'token',
          'token_type': 'token type',
          'expires_in': 123,
          'refresh_token': 'refresh token',
          'scope': 'public',
          'created_at': 123,
        };
        expect(token.toJson(), expectedJson);
      });
    });
  });
}
