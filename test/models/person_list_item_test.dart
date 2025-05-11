import 'package:traktx/src/models/person_list_item.dart';
import 'package:traktx/src/models/person.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:test/test.dart';

void main() {
  group('PersonListItem', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'rank': 1,
          'id': 123,
          'listed_at': '2025-05-11T12:00:00Z',
          'type': 'actor',
          'person': {
            'name': 'John Doe',
            'ids': {'trakt': 123, 'tmdb': 456, 'imdb': 'tt1234567'},
          },
        };
        final personListItem = PersonListItem.fromJson(json);

        expect(personListItem.rank, 1);
        expect(personListItem.id, 123);
        expect(personListItem.listedAt, DateTime.parse('2025-05-11T12:00:00Z'));
        expect(personListItem.type, 'actor');
        expect(personListItem.person.name, 'John Doe');
        expect(personListItem.person.ids.trakt, 123);
        expect(personListItem.person.ids.tmdb, 456);
        expect(personListItem.person.ids.imdb, 'tt1234567');
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final person = Person(
          name: 'John Doe',
          ids: TraktIds(trakt: 123, tmdb: 456, imdb: 'tt1234567'),
        );
        final personListItem = PersonListItem(
          rank: 1,
          id: 123,
          listedAt: DateTime.parse('2025-05-11T12:00:00Z'),
          type: 'actor',
          person: person,
        );
        final expectedJson = {
          'rank': 1,
          'id': 123,
          'listed_at': '2025-05-11T12:00:00.000Z',
          'type': 'actor',
          'person': {
            'name': 'John Doe',
            'ids': {'trakt': 123, 'tmdb': 456, 'imdb': 'tt1234567'},
          },
        };

        expect(personListItem.toJson(), expectedJson);
      });
    });
  });
}
