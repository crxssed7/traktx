import 'package:test/test.dart';
import 'package:traktx/src/models/comment.dart';
import 'package:traktx/src/models/user.dart';
import 'package:traktx/src/models/user_stats.dart';
import 'package:traktx/src/models/trakt_ids.dart';

void main() {
  group('Comment', () {
    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'id': 123,
          'parent_id': 0,
          'created_at': '2023-01-01T12:00:00.000Z',
          'comment': 'Great episode!',
          'spoiler': false,
          'review': false,
          'replies': 2,
          'likes': 10,
          'user_stats': {'rating': 8, 'play_count': 1, 'completed_count': 1},
          'user': {
            'username': 'crxssed',
            'private': false,
            'name': 'Tanveer Najib',
            'vip': true,
            'vip_ep': false,
            'ids': {'trakt': 1},
          },
        };

        final comment = Comment.fromJson(json);
        expect(comment.id, 123);
        expect(comment.parentId, 0);
        expect(
          comment.createdAt.toUtc().toIso8601String(),
          '2023-01-01T12:00:00.000Z',
        );
        expect(comment.comment, 'Great episode!');
        expect(comment.spoiler, false);
        expect(comment.review, false);
        expect(comment.replies, 2);
        expect(comment.likes, 10);
        expect(comment.userStats.rating, 8);
        expect(comment.user.username, 'crxssed');
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final comment = Comment(
          id: 123,
          parentId: 0,
          createdAt: DateTime.parse('2023-01-01T12:00:00.000Z'),
          comment: 'Great episode!',
          spoiler: false,
          review: false,
          replies: 2,
          likes: 10,
          userStats: UserStats(rating: 8, playCount: 1, completedCount: 1),
          user: User(
            username: 'crxssed',
            private: false,
            name: 'Tanveer Najib',
            vip: true,
            vipEp: false,
            ids: TraktIds(trakt: 1),
          ),
        );

        final expectedJson = {
          'id': 123,
          'parent_id': 0,
          'created_at': '2023-01-01T12:00:00.000Z',
          'comment': 'Great episode!',
          'spoiler': false,
          'review': false,
          'replies': 2,
          'likes': 10,
          'user_stats': {'rating': 8, 'play_count': 1, 'completed_count': 1},
          'user': {
            'username': 'crxssed',
            'private': false,
            'name': 'Tanveer Najib',
            'vip': true,
            'vip_ep': false,
            'ids': {'trakt': 1},
          },
        };

        expect(comment.toJson(), expectedJson);
      });
    });
  });
}
