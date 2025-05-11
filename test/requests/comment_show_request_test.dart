import 'package:test/test.dart';
import 'package:traktx/src/models/show.dart';
import 'package:traktx/src/models/sharing.dart';
import 'package:traktx/src/requests/comment_show_request.dart';

void main() {
  group('CommentShowRequest', () {
    final showJson = {
      'ids': {'trakt': 12345, 'slug': 'show-slug'},
      'title': 'Sample Show',
      'year': 2025,
    };

    final show = Show.fromJson(showJson);
    final commentShowRequest = CommentShowRequest(
      show: show,
      comment: 'Great show!',
      spoiler: false,
      sharing: Sharing(mastodon: true, twitter: true, tumblr: false),
    );

    group('fromJson', () {
      test('it converts full JSON', () {
        final json = {
          'show': showJson,
          'comment': 'Great show!',
          'spoiler': false,
          'sharing': {'mastodon': true, 'twitter': true, 'tumblr': false},
        };

        final request = CommentShowRequest.fromJson(json);

        expect(request.show.ids.trakt, 12345);
        expect(request.show.title, 'Sample Show');
        expect(request.comment, 'Great show!');
        expect(request.spoiler, false);
        expect(request.sharing?.mastodon, true);
        expect(request.sharing?.twitter, true);
        expect(request.sharing?.tumblr, false);
      });

      test('it handles missing optional fields (spoiler, sharing)', () {
        final json = {'show': showJson, 'comment': 'Awesome show!'};

        final request = CommentShowRequest.fromJson(json);

        expect(request.comment, 'Awesome show!');
        expect(request.spoiler, isNull);
        expect(request.sharing, isNull);
      });
    });

    group('toJson', () {
      test('it converts to full JSON', () {
        final expectedJson = {
          'show': showJson,
          'comment': 'Great show!',
          'spoiler': false,
          'sharing': {'mastodon': true, 'twitter': true, 'tumblr': false},
        };

        final json = commentShowRequest.toJson();
        expect(json, expectedJson);
      });

      test('it omits null fields (spoiler, sharing)', () {
        final requestWithoutOptionalFields = CommentShowRequest(
          show: show,
          comment: 'Amazing show!',
        );

        final expectedJson = {'show': showJson, 'comment': 'Amazing show!'};

        final json = requestWithoutOptionalFields.toJson();
        expect(json, expectedJson);
        expect(json.containsKey('spoiler'), isFalse);
        expect(json.containsKey('sharing'), isFalse);
      });
    });
  });
}
