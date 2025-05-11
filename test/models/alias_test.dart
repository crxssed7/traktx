import 'package:test/test.dart';
import 'package:traktx/src/models/alias.dart';

void main() {
  group('Alias', () {
    group('fromJson', () {
      test('it converts json to Alias', () {
        final json = {'title': 'Breaking Bad', 'country': 'us'};

        final alias = Alias.fromJson(json);

        expect(alias.title, 'Breaking Bad');
        expect(alias.country, 'us');
      });
    });

    group('toJson', () {
      test('it converts Alias to json', () {
        final alias = Alias(title: 'Breaking Bad', country: 'us');

        final json = alias.toJson();

        expect(json, {'title': 'Breaking Bad', 'country': 'us'});
      });
    });
  });
}
