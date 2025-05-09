import 'package:traktx/src/models/language.dart';
import 'package:test/test.dart';

void main() {
  group('Language', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {'name': 'Bri\'ish', 'code': 'bri\'ish'};
        final language = Language.fromJson(json);
        expect(language.name, 'Bri\'ish');
        expect(language.code, 'bri\'ish');
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final language = Language(name: 'Bri\'ish', code: 'bri\'ish');
        final expectedJson = {'name': 'Bri\'ish', 'code': 'bri\'ish'};
        expect(language.toJson(), expectedJson);
      });
    });
  });
}
