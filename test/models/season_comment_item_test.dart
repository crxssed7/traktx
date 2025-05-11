import 'package:test/test.dart';
import 'package:traktx/src/models/season_comment_item.dart';
import 'package:traktx/src/models/season.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:traktx/src/models/comment.dart';
import 'package:traktx/src/models/user.dart';
import 'package:traktx/src/models/user_stats.dart';

void main() {
  group('SeasonCommentItem', () {
    group('fromJson', () {
      test('it converts json with comment', () {
        final json = {
          'type': 'season',
          'season': {
            'number': 1,
            'ids': {'trakt': 123, 'slug': 'bb-s1'},
          },
          'comment': {
            'id': 456,
            'parent_id': 0,
            'created_at': '2022-01-01T00:00:00Z',
            'comment': 'Loved this season!',
            'spoiler': false,
            'review': true,
            'replies': 3,
            'likes': 100,
            'user_stats': {'play_count': 1, 'completed_count': 1},
            'user': {
              'username': 'heisenberg',
              'private': false,
              'name': 'Heisenberg',
              'vip': true,
              'vip_ep': false,
              'ids': {'slug': 'heisenberg'},
            },
          },
        };

        final item = SeasonCommentItem.fromJson(json);

        expect(item.type, 'season');
        expect(item.season.number, 1);
        expect(item.season.ids.slug, 'bb-s1');
        expect(item.comment?.id, 456);
        expect(item.comment?.user.username, 'heisenberg');
      });

      test('it converts json without comment', () {
        final json = {
          'type': 'season',
          'season': {
            'number': 1,
            'ids': {'trakt': 123, 'slug': 'bb-s1'},
          },
        };

        final item = SeasonCommentItem.fromJson(json);

        expect(item.type, 'season');
        expect(item.season.number, 1);
        expect(item.comment, isNull);
      });
    });

    group('toJson', () {
      test('it converts to json with comment', () {
        final item = SeasonCommentItem(
          type: 'season',
          season: Season(number: 1, ids: TraktIds(trakt: 123, slug: 'bb-s1')),
          comment: Comment(
            id: 456,
            parentId: 0,
            createdAt: DateTime.parse('2022-01-01T00:00:00Z'),
            comment: 'Loved this season!',
            spoiler: false,
            review: true,
            replies: 3,
            likes: 100,
            userStats: UserStats(playCount: 1, completedCount: 1),
            user: User(
              username: 'heisenberg',
              private: false,
              name: 'Heisenberg',
              vip: true,
              vipEp: false,
              ids: TraktIds(slug: 'heisenberg'),
            ),
          ),
        );

        final json = item.toJson();

        expect(json['type'], 'season');
        expect(json['season']['number'], 1);
        expect(json['comment']['id'], 456);
        expect(json['comment']['user']['username'], 'heisenberg');
      });

      test('it omits null comment', () {
        final item = SeasonCommentItem(
          type: 'season',
          season: Season(number: 1, ids: TraktIds(trakt: 123, slug: 'bb-s1')),
        );

        final json = item.toJson();

        expect(json['type'], 'season');
        expect(json['season']['number'], 1);
        expect(json.containsKey('comment'), isFalse);
      });
    });
  });
}
