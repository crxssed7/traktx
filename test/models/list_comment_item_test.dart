import 'package:test/test.dart';
import 'package:traktx/src/models/list_comment_item.dart';
import 'package:traktx/src/models/list.dart' as trakt_list;
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:traktx/src/models/user.dart';
import 'package:traktx/src/models/user_stats.dart';
import 'package:traktx/src/models/comment.dart';

void main() {
  group('ListCommentItem', () {
    group('fromJson', () {
      test('it converts json with comment', () {
        final json = {
          'type': 'list',
          'list': {
            'name': 'Watchlist',
            'description': 'My favorite shows',
            'privacy': 'public',
            'share_link': 'https://trakt.tv/users/test/lists/watchlist',
            'type': 'personal',
            'display_numbers': true,
            'allow_comments': true,
            'sort_by': 'rank',
            'sort_how': 'asc',
            'created_at': '2022-01-01T00:00:00Z',
            'updated_at': '2022-01-02T00:00:00Z',
            'item_count': 10,
            'comment_count': 5,
            'likes': 100,
            'ids': {'trakt': 1, 'slug': 'watchlist'},
            'user': {
              'username': 'testuser',
              'private': false,
              'name': 'Test User',
              'vip': false,
              'vip_ep': false,
              'ids': {'slug': 'testuser'},
            },
          },
          'comment': {
            'id': 321,
            'parent_id': 0,
            'created_at': '2022-01-01T00:00:00Z',
            'comment': 'Nice list!',
            'spoiler': false,
            'review': false,
            'replies': 2,
            'likes': 5,
            'user_stats': {'play_count': 1, 'completed_count': 1},
            'user': {
              'username': 'commenter',
              'private': false,
              'name': 'Commenter',
              'vip': false,
              'vip_ep': false,
              'ids': {'slug': 'commenter'},
            },
          },
        };

        final item = ListCommentItem.fromJson(json);

        expect(item.type, 'list');
        expect(item.list.name, 'Watchlist');
        expect(item.list.user.username, 'testuser');
        expect(item.comment?.id, 321);
        expect(item.comment?.user.username, 'commenter');
      });

      test('it converts json without comment', () {
        final json = {
          'type': 'list',
          'list': {
            'name': 'Watchlist',
            'description': 'My favorite shows',
            'privacy': 'public',
            'share_link': 'https://trakt.tv/users/test/lists/watchlist',
            'type': 'personal',
            'display_numbers': true,
            'allow_comments': true,
            'sort_by': 'rank',
            'sort_how': 'asc',
            'created_at': '2022-01-01T00:00:00Z',
            'updated_at': '2022-01-02T00:00:00Z',
            'item_count': 10,
            'comment_count': 5,
            'likes': 100,
            'ids': {'trakt': 1, 'slug': 'watchlist'},
            'user': {
              'username': 'testuser',
              'private': false,
              'name': 'Test User',
              'vip': false,
              'vip_ep': false,
              'ids': {'slug': 'testuser'},
            },
          },
        };

        final item = ListCommentItem.fromJson(json);

        expect(item.type, 'list');
        expect(item.list.name, 'Watchlist');
        expect(item.comment, isNull);
      });
    });

    group('toJson', () {
      test('it converts to json with comment', () {
        final item = ListCommentItem(
          type: 'list',
          list: trakt_list.List(
            name: 'Watchlist',
            description: 'My favorite shows',
            privacy: 'public',
            shareLink: 'https://trakt.tv/users/test/lists/watchlist',
            type: 'personal',
            displayNumbers: true,
            allowComments: true,
            sortBy: 'rank',
            sortHow: 'asc',
            createdAt: DateTime.parse('2022-01-01T00:00:00Z'),
            updatedAt: DateTime.parse('2022-01-02T00:00:00Z'),
            itemCount: 10,
            commentCount: 5,
            likes: 100,
            ids: TraktIds(trakt: 1, slug: 'watchlist'),
            user: User(
              username: 'testuser',
              private: false,
              name: 'Test User',
              vip: false,
              vipEp: false,
              ids: TraktIds(slug: 'testuser'),
            ),
          ),
          comment: Comment(
            id: 321,
            parentId: 0,
            createdAt: DateTime.parse('2022-01-01T00:00:00Z'),
            comment: 'Nice list!',
            spoiler: false,
            review: false,
            replies: 2,
            likes: 5,
            userStats: UserStats(playCount: 1, completedCount: 1),
            user: User(
              username: 'commenter',
              private: false,
              name: 'Commenter',
              vip: false,
              vipEp: false,
              ids: TraktIds(slug: 'commenter'),
            ),
          ),
        );

        final json = item.toJson();

        expect(json['type'], 'list');
        expect(json['list']['name'], 'Watchlist');
        expect(json['comment']['id'], 321);
        expect(json['comment']['user']['username'], 'commenter');
      });

      test('it omits null comment', () {
        final item = ListCommentItem(
          type: 'list',
          list: trakt_list.List(
            name: 'Watchlist',
            description: 'My favorite shows',
            privacy: 'public',
            shareLink: 'https://trakt.tv/users/test/lists/watchlist',
            type: 'personal',
            displayNumbers: true,
            allowComments: true,
            sortBy: 'rank',
            sortHow: 'asc',
            createdAt: DateTime.parse('2022-01-01T00:00:00Z'),
            updatedAt: DateTime.parse('2022-01-02T00:00:00Z'),
            itemCount: 10,
            commentCount: 5,
            likes: 100,
            ids: TraktIds(trakt: 1, slug: 'watchlist'),
            user: User(
              username: 'testuser',
              private: false,
              name: 'Test User',
              vip: false,
              vipEp: false,
              ids: TraktIds(slug: 'testuser'),
            ),
          ),
        );

        final json = item.toJson();

        expect(json['type'], 'list');
        expect(json['list']['name'], 'Watchlist');
        expect(json.containsKey('comment'), isFalse);
      });
    });
  });
}
