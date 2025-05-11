import 'package:test/test.dart';
import 'package:traktx/src/models/movie_comment_item.dart';
import 'package:traktx/src/models/movie.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:traktx/src/models/comment.dart';
import 'package:traktx/src/models/user.dart';
import 'package:traktx/src/models/user_stats.dart';

void main() {
  group('MovieCommentItem', () {
    group('fromJson', () {
      test('it converts json with comment', () {
        final json = {
          'type': 'movie',
          'movie': {
            'title': 'Inception',
            'year': 2010,
            'ids': {'trakt': 12345, 'slug': 'inception'},
          },
          'comment': {
            'id': 456,
            'parent_id': 0,
            'created_at': '2021-01-01T00:00:00Z',
            'comment': 'Mind-blowing!',
            'spoiler': false,
            'review': false,
            'replies': 0,
            'likes': 100,
            'user_stats': {'play_count': 1, 'completed_count': 1},
            'user': {
              'username': 'jane_doe',
              'private': false,
              'name': 'Jane',
              'vip': true,
              'vip_ep': true,
              'ids': {'slug': 'jane_doe'},
            },
          },
        };

        final item = MovieCommentItem.fromJson(json);

        expect(item.type, 'movie');
        expect(item.movie.title, 'Inception');
        expect(item.comment?.id, 456);
        expect(item.comment?.user.username, 'jane_doe');
      });

      test('it converts json without comment', () {
        final json = {
          'type': 'movie',
          'movie': {
            'title': 'Inception',
            'year': 2010,
            'ids': {'trakt': 12345, 'slug': 'inception'},
          },
        };

        final item = MovieCommentItem.fromJson(json);

        expect(item.type, 'movie');
        expect(item.movie.title, 'Inception');
        expect(item.comment, isNull);
      });
    });

    group('toJson', () {
      test('it converts to json with comment', () {
        final item = MovieCommentItem(
          type: 'movie',
          movie: Movie(
            title: 'Inception',
            year: 2010,
            ids: TraktIds(trakt: 12345, slug: 'inception'),
          ),
          comment: Comment(
            id: 456,
            parentId: 0,
            createdAt: DateTime.parse('2021-01-01T00:00:00Z'),
            comment: 'Mind-blowing!',
            spoiler: false,
            review: false,
            replies: 0,
            likes: 100,
            userStats: UserStats(playCount: 1, completedCount: 1),
            user: User(
              username: 'jane_doe',
              private: false,
              name: 'Jane',
              vip: true,
              vipEp: true,
              ids: TraktIds(slug: 'jane_doe'),
            ),
          ),
        );

        final json = item.toJson();

        expect(json['type'], 'movie');
        expect(json['movie']['title'], 'Inception');
        expect(json['comment']['id'], 456);
        expect(json['comment']['user']['username'], 'jane_doe');
      });

      test('it omits null comment', () {
        final item = MovieCommentItem(
          type: 'movie',
          movie: Movie(
            title: 'Inception',
            year: 2010,
            ids: TraktIds(trakt: 12345, slug: 'inception'),
          ),
        );

        final json = item.toJson();

        expect(json['type'], 'movie');
        expect(json['movie']['title'], 'Inception');
        expect(json.containsKey('comment'), isFalse);
      });
    });
  });
}
