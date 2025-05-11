import 'package:test/test.dart';
import 'package:traktx/src/models/season.dart';
import 'package:traktx/src/models/sharing.dart';
import 'package:traktx/src/requests/comment_season_request.dart';

void main() {
  group('CommentSeasonRequest', () {
    final seasonJson = {
      'number': 1,
      'ids': {'trakt': 1234, 'slug': 'season-1'},
    };

    final season = Season.fromJson(seasonJson);
    final commentSeasonRequest = CommentSeasonRequest(
      season: season,
      comment: 'Amazing season!',
      spoiler: true,
      sharing: Sharing(mastodon: true, twitter: false, tumblr: true),
    );

    group('fromJson', () {
      test('it converts full JSON', () {
        final json = {
          'season': seasonJson,
          'comment': 'Amazing season!',
          'spoiler': true,
          'sharing': {'mastodon': true, 'twitter': false, 'tumblr': true},
        };

        final request = CommentSeasonRequest.fromJson(json);

        expect(request.season.number, 1);
        expect(request.season.ids.trakt, 1234);
        expect(request.comment, 'Amazing season!');
        expect(request.spoiler, true);
        expect(request.sharing?.mastodon, true);
        expect(request.sharing?.twitter, false);
        expect(request.sharing?.tumblr, true);
      });

      test('it handles missing optional fields (spoiler, sharing)', () {
        final json = {'season': seasonJson, 'comment': 'Great season!'};

        final request = CommentSeasonRequest.fromJson(json);

        expect(request.comment, 'Great season!');
        expect(request.spoiler, isNull);
        expect(request.sharing, isNull);
      });
    });

    group('toJson', () {
      test('it converts to full JSON', () {
        final expectedJson = {
          'season': seasonJson,
          'comment': 'Amazing season!',
          'spoiler': true,
          'sharing': {'mastodon': true, 'twitter': false, 'tumblr': true},
        };

        final json = commentSeasonRequest.toJson();
        expect(json, expectedJson);
      });

      test('it omits null fields (spoiler, sharing)', () {
        final requestWithoutOptionalFields = CommentSeasonRequest(
          season: season,
          comment: 'Amazing season!',
        );

        final expectedJson = {
          'season': seasonJson,
          'comment': 'Amazing season!',
        };

        final json = requestWithoutOptionalFields.toJson();
        expect(json, expectedJson);
        expect(json.containsKey('spoiler'), isFalse);
        expect(json.containsKey('sharing'), isFalse);
      });
    });
  });
}
