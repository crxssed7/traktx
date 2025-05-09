import 'package:traktx/src/models/device_code.dart';
import 'package:test/test.dart';

void main() {
  group('DeviceCode', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'device_code': 'code',
          'user_code': 'user',
          'verification_url': 'https://example.com',
          'expires_in': 100,
          'interval': 1,
        };
        final code = DeviceCode.fromJson(json);
        expect(code.deviceCode, 'code');
        expect(code.userCode, 'user');
        expect(code.verificationUrl, 'https://example.com');
        expect(code.expiresIn, 100);
        expect(code.interval, 1);
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final code = DeviceCode(
          deviceCode: 'code',
          userCode: 'user',
          verificationUrl: 'https://example.com',
          expiresIn: 100,
          interval: 1,
        );
        final expectedJson = {
          'device_code': 'code',
          'user_code': 'user',
          'verification_url': 'https://example.com',
          'expires_in': 100,
          'interval': 1,
        };
        expect(code.toJson(), expectedJson);
      });
    });
  });
}
