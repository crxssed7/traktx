import 'package:test/test.dart';
import 'package:traktx/src/models/show.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:traktx/src/requests/note_show_request.dart';

void main() {
  group('NoteShowRequest', () {
    final show = Show(
      title: 'Breaking Bad',
      year: 2008,
      ids: TraktIds(trakt: 123),
    );

    group('fromJson', () {
      test('it converts json with all fields', () {
        final json = {
          'show': {
            'title': 'Breaking Bad',
            'year': 2008,
            'ids': {'trakt': 123},
          },
          'note': 'Masterpiece!',
          'spoiler': true,
          'privacy': 'private',
        };

        final req = NoteShowRequest.fromJson(json);
        expect(req.note, 'Masterpiece!');
        expect(req.spoiler, true);
        expect(req.privacy, 'private');
        expect(req.show.title, 'Breaking Bad');
        expect(req.show.year, 2008);
        expect(req.show.ids.trakt, 123);
      });

      test('it handles missing optional fields (spoiler, privacy)', () {
        final json = {
          'show': {
            'title': 'Breaking Bad',
            'year': 2008,
            'ids': {'trakt': 123},
          },
          'note': 'Amazing show!',
        };

        final req = NoteShowRequest.fromJson(json);

        expect(req.note, 'Amazing show!');
        expect(req.spoiler, isNull);
        expect(req.privacy, isNull);
        expect(req.show.title, 'Breaking Bad');
        expect(req.show.year, 2008);
        expect(req.show.ids.trakt, 123);
      });
    });

    group('toJson', () {
      test('it converts to json with all fields', () {
        final req = NoteShowRequest(
          show: show,
          note: 'Masterpiece!',
          spoiler: false,
          privacy: 'friends',
        );

        final expectedJson = {
          'show': {
            'title': 'Breaking Bad',
            'year': 2008,
            'ids': {'trakt': 123},
          },
          'note': 'Masterpiece!',
          'spoiler': false,
          'privacy': 'friends',
        };

        expect(req.toJson(), expectedJson);
      });

      test('it omits null fields', () {
        final req = NoteShowRequest(show: show, note: 'Incredible!');

        final json = req.toJson();

        expect(json['note'], 'Incredible!');
        expect(json['spoiler'], isNull);
        expect(json['privacy'], isNull);
        expect(json.containsKey('spoiler'), isFalse);
        expect(json.containsKey('privacy'), isFalse);
      });
    });
  });
}
