import 'package:traktx/src/models/country.dart';
import 'package:test/test.dart';

void main() {
  group('Country', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {'name': 'Great Britain', 'code': 'gb'};
        final country = Country.fromJson(json);
        expect(country.name, 'Great Britain');
        expect(country.code, 'gb');
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final country = Country(name: 'Great Britain', code: 'gb');
        final expectedJson = {'name': 'Great Britain', 'code': 'gb'};
        expect(country.toJson(), expectedJson);
      });
    });
  });
}
