import 'package:test/test.dart';
import 'package:traktx/src/models/checkin_episode.dart';
import 'package:traktx/src/models/episode.dart';
import 'package:traktx/src/models/show.dart';
import 'package:traktx/src/models/sharing.dart';
import 'package:traktx/src/models/trakt_ids.dart';

void main() {
  group('CheckinEpisode', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'id': 1,
          'watched_at': '2023-01-01T21:00:00.000Z',
          'sharing': {'twitter': true, 'mastodon': false, 'tumblr': true},
          'episode': {
            'title': 'Pilot',
            'season': 1,
            'number': 1,
            'ids': {'trakt': 101},
          },
          'show': {
            'title': 'Breaking Bad',
            'year': 2008,
            'ids': {'trakt': 202},
          },
        };

        final checkin = CheckinEpisode.fromJson(json);
        expect(checkin.id, 1);
        expect(
          checkin.watchedAt.toUtc().toIso8601String(),
          '2023-01-01T21:00:00.000Z',
        );
        expect(checkin.sharing.twitter, true);
        expect(checkin.sharing.mastodon, false);
        expect(checkin.sharing.tumblr, true);
        expect(checkin.episode.title, 'Pilot');
        expect(checkin.episode.season, 1);
        expect(checkin.episode.number, 1);
        expect(checkin.episode.ids.trakt, 101);
        expect(checkin.show.title, 'Breaking Bad');
        expect(checkin.show.year, 2008);
        expect(checkin.show.ids.trakt, 202);
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final checkin = CheckinEpisode(
          id: 1,
          watchedAt: DateTime.parse('2023-01-01T21:00:00.000Z'),
          sharing: Sharing(twitter: true, mastodon: false, tumblr: true),
          episode: Episode(
            title: 'Pilot',
            season: 1,
            number: 1,
            ids: TraktIds(trakt: 101),
          ),
          show: Show(
            title: 'Breaking Bad',
            year: 2008,
            ids: TraktIds(trakt: 202),
          ),
        );

        final expectedJson = {
          'id': 1,
          'watched_at': '2023-01-01T21:00:00.000Z',
          'sharing': {'twitter': true, 'mastodon': false, 'tumblr': true},
          'episode': {
            'title': 'Pilot',
            'season': 1,
            'number': 1,
            'ids': {'trakt': 101},
          },
          'show': {
            'title': 'Breaking Bad',
            'year': 2008,
            'ids': {'trakt': 202},
          },
        };

        expect(checkin.toJson(), expectedJson);
      });
    });
  });
}
