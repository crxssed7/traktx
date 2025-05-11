import 'package:test/test.dart';
import 'package:traktx/src/models/show_comment_item.dart';
import 'package:traktx/src/models/show.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:traktx/src/models/comment.dart';
import 'package:traktx/src/models/user.dart';
import 'package:traktx/src/models/user_stats.dart';

void main() {
  group('ShowCommentItem', () {
    group('fromJson', () {
      test('it converts json with comment', () {
        final json = {
          'type': 'show',
          'show': {
            'title': 'Breaking Bad',
            'year': 2008,
            'ids': {'trakt': 111, 'slug': 'breaking-bad'},
          },
          'comment': {
            'id': 789,
            'parent_id': 0,
            'created_at': '2021-05-01T12:00:00Z',
            'comment': 'Amazing series!',
            'spoiler': false,
            'review': false,
            'replies': 10,
            'likes': 500,
            'user_stats': {'play_count': 1, 'completed_count': 1},
            'user': {
              'username': 'walter',
              'private': false,
              'name': 'Walter White',
              'vip': true,
              'vip_ep': false,
              'ids': {'slug': 'walter'},
            },
          },
        };

        final item = ShowCommentItem.fromJson(json);

        expect(item.type, 'show');
        expect(item.show.title, 'Breaking Bad');
        expect(item.comment?.id, 789);
        expect(item.comment?.user.username, 'walter');
      });

      test('it converts json without comment', () {
        final json = {
          'type': 'show',
          'show': {
            'title': 'Breaking Bad',
            'year': 2008,
            'ids': {'trakt': 111, 'slug': 'breaking-bad'},
          },
        };

        final item = ShowCommentItem.fromJson(json);

        expect(item.type, 'show');
        expect(item.show.title, 'Breaking Bad');
        expect(item.comment, isNull);
      });
    });

    group('toJson', () {
      test('it converts to json with comment', () {
        final item = ShowCommentItem(
          type: 'show',
          show: Show(
            title: 'Breaking Bad',
            year: 2008,
            ids: TraktIds(trakt: 111, slug: 'breaking-bad'),
          ),
          comment: Comment(
            id: 789,
            parentId: 0,
            createdAt: DateTime.parse('2021-05-01T12:00:00Z'),
            comment: 'Amazing series!',
            spoiler: false,
            review: false,
            replies: 10,
            likes: 500,
            userStats: UserStats(playCount: 1, completedCount: 1),
            user: User(
              username: 'walter',
              private: false,
              name: 'Walter White',
              vip: true,
              vipEp: false,
              ids: TraktIds(slug: 'walter'),
            ),
          ),
        );

        final json = item.toJson();

        expect(json['type'], 'show');
        expect(json['show']['title'], 'Breaking Bad');
        expect(json['comment']['id'], 789);
        expect(json['comment']['user']['username'], 'walter');
      });

      test('it omits null comment', () {
        final item = ShowCommentItem(
          type: 'show',
          show: Show(
            title: 'Breaking Bad',
            year: 2008,
            ids: TraktIds(trakt: 111, slug: 'breaking-bad'),
          ),
        );

        final json = item.toJson();

        expect(json['type'], 'show');
        expect(json['show']['title'], 'Breaking Bad');
        expect(json.containsKey('comment'), isFalse);
      });
    });
  });
}
