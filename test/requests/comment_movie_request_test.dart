import 'package:test/test.dart';
import 'package:traktx/src/requests/comment_movie_request.dart';
import 'package:traktx/src/models/movie.dart';
import 'package:traktx/src/models/sharing.dart';
import 'package:traktx/src/models/trakt_ids.dart';

void main() {
  group('CommentMovieRequest', () {
    group('fromJson', () {
      test('it parses with all fields', () {
        final json = {
          'movie': {
            'title': 'Inception',
            'year': 2010,
            'ids': {'trakt': 1},
          },
          'comment': 'Mind-bending!',
          'spoiler': true,
          'sharing': {'twitter': true, 'mastodon': false, 'tumblr': false},
        };

        final request = CommentMovieRequest.fromJson(json);
        expect(request.movie.title, 'Inception');
        expect(request.movie.year, 2010);
        expect(request.movie.ids.trakt, 1);
        expect(request.comment, 'Mind-bending!');
        expect(request.spoiler, isTrue);
        expect(request.sharing?.twitter, isTrue);
      });

      test('it parses with null spoiler and null sharing', () {
        final json = {
          'movie': {
            'title': 'Dune',
            'year': 2021,
            'ids': {'trakt': 2},
          },
          'comment': 'Epic scale!',
        };

        final request = CommentMovieRequest.fromJson(json);
        expect(request.movie.title, 'Dune');
        expect(request.comment, 'Epic scale!');
        expect(request.spoiler, isNull);
        expect(request.sharing, isNull);
      });
    });

    group('toJson', () {
      test('it serializes all fields', () {
        final request = CommentMovieRequest(
          movie: Movie(title: 'Inception', year: 2010, ids: TraktIds(trakt: 1)),
          comment: 'Mind-bending!',
          spoiler: true,
          sharing: Sharing(twitter: true),
        );

        final expectedJson = {
          'movie': {
            'title': 'Inception',
            'year': 2010,
            'ids': {'trakt': 1},
          },
          'comment': 'Mind-bending!',
          'spoiler': true,
          'sharing': {'twitter': true, 'mastodon': false, 'tumblr': false},
        };

        expect(request.toJson(), expectedJson);
      });

      test('it omits null spoiler and sharing from JSON', () {
        final request = CommentMovieRequest(
          movie: Movie(title: 'Dune', year: 2021, ids: TraktIds(trakt: 2)),
          comment: 'Epic scale!',
          spoiler: null,
          sharing: null,
        );

        final json = request.toJson();

        expect(json.containsKey('spoiler'), isFalse);
        expect(json.containsKey('sharing'), isFalse);
        expect(json, {
          'movie': {
            'title': 'Dune',
            'year': 2021,
            'ids': {'trakt': 2},
          },
          'comment': 'Epic scale!',
        });
      });
    });
  });
}
