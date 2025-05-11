import 'package:test/test.dart';
import 'package:traktx/src/models/episode.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:traktx/src/models/sharing.dart';
import 'package:traktx/src/requests/comment_episode_request.dart';

void main() {
  group('CommentEpisodeRequest', () {
    final episode = Episode(
      season: 1,
      number: 2,
      title: 'Pilot',
      ids: TraktIds(
        trakt: 1234,
        slug: 'pilot',
        tvdb: 5678,
        imdb: 'tt1234567',
        tmdb: 4321,
      ),
    );

    group('fromJson', () {
      test('parses JSON with all fields', () {
        final json = {
          'episode': {
            'season': 1,
            'number': 2,
            'title': 'Pilot',
            'ids': {
              'trakt': 1234,
              'slug': 'pilot',
              'tvdb': 5678,
              'imdb': 'tt1234567',
              'tmdb': 4321,
            },
          },
          'comment': 'Great episode!',
          'spoiler': true,
          'sharing': {'mastodon': true, 'twitter': false, 'tumblr': true},
        };

        final request = CommentEpisodeRequest.fromJson(json);

        expect(request.comment, 'Great episode!');
        expect(request.spoiler, true);
        expect(request.episode.title, 'Pilot');
        expect(request.sharing?.mastodon, true);
      });

      test('parses JSON without optional fields', () {
        final json = {
          'episode': {
            'season': 1,
            'number': 2,
            'title': 'Pilot',
            'ids': {
              'trakt': 1234,
              'slug': 'pilot',
              'tvdb': 5678,
              'imdb': 'tt1234567',
              'tmdb': 4321,
            },
          },
          'comment': 'No spoilers here!',
        };

        final request = CommentEpisodeRequest.fromJson(json);

        expect(request.comment, 'No spoilers here!');
        expect(request.spoiler, isNull);
        expect(request.sharing, isNull);
      });
    });

    group('toJson', () {
      test('serializes with all fields', () {
        final request = CommentEpisodeRequest(
          episode: episode,
          comment: 'Nice!',
          spoiler: false,
          sharing: Sharing(twitter: false, mastodon: false, tumblr: false),
        );

        final json = request.toJson();

        expect(json['comment'], 'Nice!');
        expect(json['spoiler'], false);
        expect(json['sharing']['twitter'], false);
        expect(json['episode']['title'], 'Pilot');
      });

      test('omits null fields', () {
        final request = CommentEpisodeRequest(
          episode: episode,
          comment: 'Short and sweet.',
        );

        final json = request.toJson();

        expect(json['comment'], 'Short and sweet.');
        expect(json.containsKey('spoiler'), isFalse);
        expect(json.containsKey('sharing'), isFalse);
      });
    });
  });
}
