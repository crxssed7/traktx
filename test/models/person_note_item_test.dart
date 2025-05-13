import 'package:test/test.dart';
import 'package:traktx/src/models/person_note_item.dart';
import 'package:traktx/src/models/person.dart';
import 'package:traktx/src/models/trakt_ids.dart';

void main() {
  group('PersonNoteItem', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'type': 'person',
          'person': {
            'name': 'Leonardo DiCaprio',
            'ids': {'trakt': 99},
          },
        };

        final item = PersonNoteItem.fromJson(json);
        expect(item.type, 'person');
        expect(item.person.name, 'Leonardo DiCaprio');
        expect(item.person.ids.trakt, 99);
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final person = Person(
          name: 'Leonardo DiCaprio',
          ids: TraktIds(trakt: 99),
        );
        final item = PersonNoteItem(type: 'person', person: person);

        final expectedJson = {
          'type': 'person',
          'person': {
            'name': 'Leonardo DiCaprio',
            'ids': {'trakt': 99},
          },
        };

        expect(item.toJson(), expectedJson);
      });
    });
  });
}
