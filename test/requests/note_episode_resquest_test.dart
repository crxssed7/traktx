import 'package:test/test.dart';
import 'package:traktx/src/models/episode.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:traktx/src/requests/note_episode_request.dart';

void main() {
  group('NoteEpisodeRequest', () {
    final episode = Episode(
      title: 'Pilot',
      season: 1,
      number: 1,
      ids: TraktIds(trakt: 123),
    );

    group('fromJson', () {
      test('it converts json with all fields', () {
        final json = {
          'episode': {
            'title': 'Pilot',
            'season': 1,
            'number': 1,
            'ids': {'trakt': 123},
          },
          'note': 'This was great!',
          'spoiler': true,
          'privacy': 'private',
        };

        final req = NoteEpisodeRequest.fromJson(json);

        expect(req.note, 'This was great!');
        expect(req.spoiler, true);
        expect(req.privacy, 'private');
        expect(req.episode.title, 'Pilot');
        expect(req.episode.season, 1);
        expect(req.episode.number, 1);
        expect(req.episode.ids.trakt, 123);
      });

      test('it handles missing optional fields (spoiler, privacy)', () {
        final json = {
          'episode': {
            'title': 'Pilot',
            'season': 1,
            'number': 1,
            'ids': {'trakt': 123},
          },
          'note': 'This was great!',
        };

        final req = NoteEpisodeRequest.fromJson(json);

        expect(req.note, 'This was great!');
        expect(req.spoiler, isNull);
        expect(req.privacy, isNull);
        expect(req.episode.title, 'Pilot');
        expect(req.episode.season, 1);
        expect(req.episode.number, 1);
        expect(req.episode.ids.trakt, 123);
      });
    });

    group('toJson', () {
      test('it converts to json with all fields', () {
        final req = NoteEpisodeRequest(
          episode: episode,
          note: 'This was great!',
          spoiler: true,
          privacy: 'friends',
        );

        final expectedJson = {
          'episode': {
            'title': 'Pilot',
            'season': 1,
            'number': 1,
            'ids': {'trakt': 123},
          },
          'note': 'This was great!',
          'spoiler': true,
          'privacy': 'friends',
        };

        expect(req.toJson(), expectedJson);
      });

      test('it omits null fields', () {
        final req = NoteEpisodeRequest(
          episode: episode,
          note: 'Interesting episode.',
        );

        final json = req.toJson();

        expect(json['note'], 'Interesting episode.');
        expect(json['spoiler'], isNull);
        expect(json['privacy'], isNull);
        expect(json.containsKey('spoiler'), isFalse);
        expect(json.containsKey('privacy'), isFalse);
      });
    });
  });
}
