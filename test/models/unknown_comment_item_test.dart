import 'package:test/test.dart';
import 'package:traktx/src/models/unknown_comment_item.dart';
import 'package:traktx/src/models/comment.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:traktx/src/models/user.dart';
import 'package:traktx/src/models/user_stats.dart';

void main() {
  group('UnknownCommentItem', () {
    group('fromJson', () {
      test('parses JSON with comment', () {
        final json = {
          'type': 'unknown',
          'comment': {
            'id': 42,
            'parent_id': 0,
            'created_at': '2022-01-01T00:00:00Z',
            'comment': 'Some comment',
            'spoiler': false,
            'review': false,
            'replies': 1,
            'likes': 3,
            'user_stats': {'play_count': 1, 'completed_count': 1},
            'user': {
              'username': 'anonymous',
              'private': false,
              'name': 'Anon',
              'vip': false,
              'vip_ep': false,
              'ids': {'slug': 'anonymous'},
            },
          },
        };

        final item = UnknownCommentItem.fromJson(json);

        expect(item.type, 'unknown');
        expect(item.comment?.id, 42);
        expect(item.comment?.comment, 'Some comment');
        expect(item.comment?.user.username, 'anonymous');
      });

      test('parses JSON without comment', () {
        final json = {'type': 'unknown'};

        final item = UnknownCommentItem.fromJson(json);

        expect(item.type, 'unknown');
        expect(item.comment, isNull);
      });
    });

    group('toJson', () {
      test('serializes with comment', () {
        final item = UnknownCommentItem(
          type: 'unknown',
          comment: Comment(
            id: 42,
            parentId: 0,
            createdAt: DateTime.parse('2022-01-01T00:00:00Z'),
            comment: 'Some comment',
            spoiler: false,
            review: false,
            replies: 1,
            likes: 3,
            userStats: UserStats(playCount: 1, completedCount: 1),
            user: User(
              username: 'anonymous',
              private: false,
              name: 'Anon',
              vip: false,
              vipEp: false,
              ids: TraktIds(slug: 'anonymous'),
            ),
          ),
        );

        final json = item.toJson();

        expect(json['type'], 'unknown');
        expect(json['comment']['id'], 42);
        expect(json['comment']['user']['username'], 'anonymous');
      });

      test('omits null comment', () {
        final item = UnknownCommentItem(type: 'unknown');

        final json = item.toJson();

        expect(json['type'], 'unknown');
        expect(json.containsKey('comment'), isFalse);
      });
    });
  });
}
