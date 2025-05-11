import 'package:test/test.dart';
import 'package:traktx/src/models/episode_comment_item.dart';
import 'package:traktx/src/models/episode.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:traktx/src/models/comment.dart';
import 'package:traktx/src/models/user.dart';
import 'package:traktx/src/models/user_stats.dart';

void main() {
  group('EpisodeCommentItem', () {
    group('fromJson', () {
      test('it converts json with comment', () {
        final json = {
          'type': 'episode',
          'episode': {
            'season': 1,
            'number': 1,
            'title': 'Winter Is Coming',
            'ids': {'trakt': 1, 'slug': 'winter-is-coming'},
          },
          'comment': {
            'id': 123,
            'parent_id': 0,
            'created_at': '2021-01-01T00:00:00Z',
            'comment': 'Great episode!',
            'spoiler': false,
            'review': false,
            'replies': 0,
            'likes': 5,
            'user_stats': {'play_count': 1, 'completed_count': 1},
            'user': {
              'username': 'john_doe',
              'private': false,
              'name': 'John',
              'vip': true,
              'vip_ep': false,
              'ids': {'slug': 'john_doe'},
            },
          },
        };

        final item = EpisodeCommentItem.fromJson(json);
        expect(item.type, 'episode');
        expect(item.episode.title, 'Winter Is Coming');
        expect(item.comment?.id, 123);
        expect(item.comment?.user.username, 'john_doe');
      });

      test('it converts json without comment', () {
        final json = {
          'type': 'episode',
          'episode': {
            'season': 1,
            'number': 1,
            'title': 'Winter Is Coming',
            'ids': {'trakt': 1, 'slug': 'winter-is-coming'},
          },
        };

        final item = EpisodeCommentItem.fromJson(json);
        expect(item.type, 'episode');
        expect(item.episode.title, 'Winter Is Coming');
        expect(item.comment, isNull);
      });
    });

    group('toJson', () {
      test('it converts to json with comment', () {
        final item = EpisodeCommentItem(
          type: 'episode',
          episode: Episode(
            season: 1,
            number: 1,
            title: 'Winter Is Coming',
            ids: TraktIds(trakt: 1, slug: 'winter-is-coming'),
          ),
          comment: Comment(
            id: 123,
            parentId: 0,
            createdAt: DateTime.parse('2021-01-01T00:00:00Z'),
            comment: 'Great episode!',
            spoiler: false,
            review: false,
            replies: 0,
            likes: 5,
            userStats: UserStats(playCount: 1, completedCount: 1),
            user: User(
              username: 'john_doe',
              private: false,
              name: 'John',
              vip: true,
              vipEp: false,
              ids: TraktIds(slug: 'john_doe'),
            ),
          ),
        );

        final json = item.toJson();
        expect(json['type'], 'episode');
        expect(json['episode']['title'], 'Winter Is Coming');
        expect(json['comment']['id'], 123);
        expect(json['comment']['user']['username'], 'john_doe');
      });

      test('it omits null comment', () {
        final item = EpisodeCommentItem(
          type: 'episode',
          episode: Episode(
            season: 1,
            number: 1,
            title: 'Winter Is Coming',
            ids: TraktIds(trakt: 1, slug: 'winter-is-coming'),
          ),
        );

        final json = item.toJson();
        expect(json['type'], 'episode');
        expect(json['episode']['title'], 'Winter Is Coming');
        expect(json.containsKey('comment'), isFalse);
      });
    });
  });
}
