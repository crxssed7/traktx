import 'package:test/test.dart';
import 'package:traktx/src/models/person.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:traktx/src/requests/note_person_request.dart';

void main() {
  group('NotePersonRequest', () {
    final person = Person(name: 'Leonardo DiCaprio', ids: TraktIds(trakt: 123));

    group('fromJson', () {
      test('it converts json with all fields', () {
        final json = {
          'person': {
            'name': 'Leonardo DiCaprio',
            'ids': {'trakt': 123},
          },
          'note': 'Great actor!',
          'spoiler': false,
          'privacy': 'private',
        };

        final req = NotePersonRequest.fromJson(json);

        expect(req.note, 'Great actor!');
        expect(req.spoiler, false);
        expect(req.privacy, 'private');
        expect(req.person.name, 'Leonardo DiCaprio');
        expect(req.person.ids.trakt, 123);
      });

      test('it handles missing optional fields (spoiler, privacy)', () {
        final json = {
          'person': {
            'name': 'Leonardo DiCaprio',
            'ids': {'trakt': 123},
          },
          'note': 'Great actor!',
        };

        final req = NotePersonRequest.fromJson(json);

        expect(req.note, 'Great actor!');
        expect(req.spoiler, isNull);
        expect(req.privacy, isNull);
        expect(req.person.name, 'Leonardo DiCaprio');
        expect(req.person.ids.trakt, 123);
      });
    });

    group('toJson', () {
      test('it converts to json with all fields', () {
        final req = NotePersonRequest(
          person: person,
          note: 'Great actor!',
          spoiler: false,
          privacy: 'public',
        );

        final expectedJson = {
          'person': {
            'name': 'Leonardo DiCaprio',
            'ids': {'trakt': 123},
          },
          'note': 'Great actor!',
          'spoiler': false,
          'privacy': 'public',
        };

        expect(req.toJson(), expectedJson);
      });

      test('it omits null fields', () {
        final req = NotePersonRequest(
          person: person,
          note: 'Amazing performance!',
        );

        final json = req.toJson();

        expect(json['note'], 'Amazing performance!');
        expect(json['spoiler'], isNull);
        expect(json['privacy'], isNull);
        expect(json.containsKey('spoiler'), isFalse);
        expect(json.containsKey('privacy'), isFalse);
      });
    });
  });
}
