import 'package:test/test.dart';
import 'package:traktx/src/models/stats.dart';

void main() {
  group('Stats', () {
    group('fromJson', () {
      test('it converts json to Stats with all fields', () {
        final json = {
          'watchers': 10,
          'plays': 100,
          'collectors': 50,
          'collected_episodes': 25,
          'comments': 8,
          'lists': 5,
          'votes': 42,
          'favorited': 12,
        };

        final stats = Stats.fromJson(json);

        expect(stats.watchers, 10);
        expect(stats.plays, 100);
        expect(stats.collectors, 50);
        expect(stats.collectedEpisodes, 25);
        expect(stats.comments, 8);
        expect(stats.lists, 5);
        expect(stats.votes, 42);
        expect(stats.favorited, 12);
      });

      test('it converts json to Stats with null fields missing', () {
        final json = {
          'watchers': 3,
          'plays': 20,
          'collectors': 10,
          'comments': 1,
          'lists': 2,
          'votes': 5,
        };

        final stats = Stats.fromJson(json);

        expect(stats.watchers, 3);
        expect(stats.plays, 20);
        expect(stats.collectors, 10);
        expect(stats.collectedEpisodes, isNull);
        expect(stats.comments, 1);
        expect(stats.lists, 2);
        expect(stats.votes, 5);
        expect(stats.favorited, isNull);
      });
    });

    group('toJson', () {
      test('it omits null fields due to includeIfNull: false', () {
        final stats = Stats(
          watchers: 1,
          plays: 2,
          collectors: 3,
          collectedEpisodes: null,
          comments: 4,
          lists: 5,
          votes: 6,
          favorited: null,
        );

        final json = stats.toJson();

        expect(json.containsKey('collected_episodes'), isFalse);
        expect(json.containsKey('favorited'), isFalse);
        expect(json, {
          'watchers': 1,
          'plays': 2,
          'collectors': 3,
          'comments': 4,
          'lists': 5,
          'votes': 6,
        });
      });

      test('it includes all fields when not null', () {
        final stats = Stats(
          watchers: 7,
          plays: 8,
          collectors: 9,
          collectedEpisodes: 3,
          comments: 4,
          lists: 2,
          votes: 1,
          favorited: 6,
        );

        final json = stats.toJson();

        expect(json, {
          'watchers': 7,
          'plays': 8,
          'collectors': 9,
          'collected_episodes': 3,
          'comments': 4,
          'lists': 2,
          'votes': 1,
          'favorited': 6,
        });
      });
    });
  });
}
