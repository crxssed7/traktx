import 'package:test/test.dart';
import 'package:traktx/src/requests/checkin_episode_request.dart';
import 'package:traktx/src/models/episode.dart';
import 'package:traktx/src/models/sharing.dart';
import 'package:traktx/src/models/trakt_ids.dart';

void main() {
  group('CheckinEpisodeRequest', () {
    group('fromJson', () {
      test('it parses with all fields present', () {
        final json = {
          'episode': {
            'title': 'Pilot',
            'season': 1,
            'number': 1,
            'ids': {'trakt': 101},
          },
          'sharing': {'twitter': true, 'mastodon': false, 'tumblr': false},
          'message': 'Excited to watch this!',
        };

        final request = CheckinEpisodeRequest.fromJson(json);
        expect(request.episode.title, 'Pilot');
        expect(request.episode.season, 1);
        expect(request.episode.number, 1);
        expect(request.episode.ids.trakt, 101);
        expect(request.sharing?.twitter, true);
        expect(request.sharing?.mastodon, false);
        expect(request.sharing?.tumblr, false);
        expect(request.message, 'Excited to watch this!');
      });

      test('it parses with null sharing and null message', () {
        final json = {
          'episode': {
            'title': 'Finale',
            'season': 2,
            'number': 10,
            'ids': {'trakt': 999},
          },
          'sharing': null,
          'message': null,
        };

        final request = CheckinEpisodeRequest.fromJson(json);
        expect(request.episode.title, 'Finale');
        expect(request.sharing, isNull);
        expect(request.message, isNull);
      });
    });

    group('toJson', () {
      test('it serializes with all fields', () {
        final request = CheckinEpisodeRequest(
          episode: Episode(
            title: 'Pilot',
            season: 1,
            number: 1,
            ids: TraktIds(trakt: 101),
          ),
          sharing: Sharing(twitter: true),
          message: 'Excited to watch this!',
        );

        final expectedJson = {
          'episode': {
            'title': 'Pilot',
            'season': 1,
            'number': 1,
            'ids': {'trakt': 101},
          },
          'sharing': {'twitter': true, 'mastodon': false, 'tumblr': false},
          'message': 'Excited to watch this!',
        };

        expect(request.toJson(), expectedJson);
      });

      test('it serializes with null sharing and null message', () {
        final request = CheckinEpisodeRequest(
          episode: Episode(
            title: 'Finale',
            season: 2,
            number: 10,
            ids: TraktIds(trakt: 999),
          ),
          sharing: null,
          message: null,
        );

        final expectedJson = {
          'episode': {
            'title': 'Finale',
            'season': 2,
            'number': 10,
            'ids': {'trakt': 999},
          },
          'sharing': null,
          'message': null,
        };

        expect(request.toJson(), expectedJson);
      });
    });
  });
}
