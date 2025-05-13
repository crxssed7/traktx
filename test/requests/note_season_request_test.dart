import 'package:test/test.dart';
import 'package:traktx/src/models/season.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:traktx/src/requests/note_season_request.dart';

void main() {
  group('NoteSeasonRequest', () {
    final season = Season(number: 1, ids: TraktIds(trakt: 123));

    group('fromJson', () {
      test('it converts json with all fields', () {
        final json = {
          'season': {
            'number': 1,
            'ids': {'trakt': 123},
          },
          'note': 'Great season!',
          'spoiler': true,
          'privacy': 'private',
        };

        final req = NoteSeasonRequest.fromJson(json);

        expect(req.note, 'Great season!');
        expect(req.spoiler, true);
        expect(req.privacy, 'private');
        expect(req.season.number, 1);
        expect(req.season.ids.trakt, 123);
      });

      test('it handles missing optional fields (spoiler, privacy)', () {
        final json = {
          'season': {
            'number': 1,
            'ids': {'trakt': 123},
          },
          'note': 'Fantastic season!',
        };

        final req = NoteSeasonRequest.fromJson(json);

        expect(req.note, 'Fantastic season!');
        expect(req.spoiler, isNull);
        expect(req.privacy, isNull);
        expect(req.season.number, 1);
        expect(req.season.ids.trakt, 123);
      });
    });

    group('toJson', () {
      test('it converts to json with all fields', () {
        final req = NoteSeasonRequest(
          season: season,
          note: 'Amazing season!',
          spoiler: false,
          privacy: 'friends',
        );

        final expectedJson = {
          'season': {
            'number': 1,
            'ids': {'trakt': 123},
          },
          'note': 'Amazing season!',
          'spoiler': false,
          'privacy': 'friends',
        };

        expect(req.toJson(), expectedJson);
      });

      test('it omits null fields', () {
        final req = NoteSeasonRequest(
          season: season,
          note: 'Incredible season!',
        );

        final json = req.toJson();

        expect(json['note'], 'Incredible season!');
        expect(json['spoiler'], isNull);
        expect(json['privacy'], isNull);
        expect(json.containsKey('spoiler'), isFalse);
        expect(json.containsKey('privacy'), isFalse);
      });
    });
  });
}
