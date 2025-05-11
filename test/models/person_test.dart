import 'package:traktx/src/models/person.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:test/test.dart';

void main() {
  group('Person', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'name': 'John Doe',
          'ids': {'trakt': 123, 'tmdb': 456, 'imdb': 'tt1234567'},
        };
        final person = Person.fromJson(json);

        expect(person.name, 'John Doe');
        expect(person.ids.trakt, 123);
        expect(person.ids.tmdb, 456);
        expect(person.ids.imdb, 'tt1234567');
      });

      test('it handles missing fields gracefully', () {
        final json = {
          'name': 'John Doe',
          'ids': {'trakt': 123}, // Missing tmdb and imdb
        };
        final person = Person.fromJson(json);

        expect(person.name, 'John Doe');
        expect(person.ids.trakt, 123);
        expect(person.ids.tmdb, null); // Should be null as it's missing
        expect(person.ids.imdb, null); // Should be null as it's missing
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final ids = TraktIds(trakt: 123, tmdb: 456, imdb: 'tt1234567');
        final person = Person(name: 'John Doe', ids: ids);
        final expectedJson = {
          'name': 'John Doe',
          'ids': {'trakt': 123, 'tmdb': 456, 'imdb': 'tt1234567'},
        };

        expect(person.toJson(), expectedJson);
      });

      test('it handles null values in ids', () {
        final ids = TraktIds(trakt: 123, tmdb: null, imdb: null);
        final person = Person(name: 'John Doe', ids: ids);
        final expectedJson = {
          'name': 'John Doe',
          'ids': {'trakt': 123},
        };

        expect(person.toJson(), expectedJson);
      });
    });
  });
}
