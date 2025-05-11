import 'package:test/test.dart';
import 'package:traktx/src/models/list.dart';
import 'package:traktx/src/models/sharing.dart';
import 'package:traktx/src/requests/comment_list_request.dart';

void main() {
  group('CommentListRequest', () {
    final listJson = {
      'name': 'My Favorite List',
      'description': 'A list of my favorite shows',
      'privacy': 'private',
      'share_link': 'https://share.link',
      'type': 'show',
      'display_numbers': true,
      'allow_comments': true,
      'sort_by': 'name',
      'sort_how': 'asc',
      'created_at': '2023-01-01T12:00:00.000Z',
      'updated_at': '2023-01-01T12:00:00.000Z',
      'item_count': 10,
      'comment_count': 5,
      'likes': 100,
      'ids': {'trakt': 12345},
      'user': {
        'username': 'crxssed',
        'private': false,
        'name': 'Tanveer Najib',
        'vip': true,
        'vip_ep': false,
        'ids': {'trakt': 1},
      },
    };

    final list = List.fromJson(listJson);
    final commentListRequest = CommentListRequest(
      list: list,
      comment: 'This is a great list!',
      spoiler: false,
      sharing: Sharing(mastodon: true, twitter: true, tumblr: false),
    );

    group('fromJson', () {
      test('it converts full JSON', () {
        final json = {
          'list': listJson,
          'comment': 'This is a great list!',
          'spoiler': false,
          'sharing': {'mastodon': true, 'twitter': true, 'tumblr': false},
        };

        final request = CommentListRequest.fromJson(json);

        expect(request.list.name, 'My Favorite List');
        expect(request.comment, 'This is a great list!');
        expect(request.spoiler, false);
        expect(request.sharing?.mastodon, true);
        expect(request.sharing?.twitter, true);
        expect(request.sharing?.tumblr, false);
      });

      test('it handles missing optional fields (spoiler, sharing)', () {
        final json = {'list': listJson, 'comment': 'Great list!'};

        final request = CommentListRequest.fromJson(json);

        expect(request.comment, 'Great list!');
        expect(request.spoiler, isNull);
        expect(request.sharing, isNull);
      });
    });

    group('toJson', () {
      test('it converts to full JSON', () {
        final expectedJson = {
          'list': listJson,
          'comment': 'This is a great list!',
          'spoiler': false,
          'sharing': {'mastodon': true, 'twitter': true, 'tumblr': false},
        };

        final json = commentListRequest.toJson();
        expect(json, expectedJson);
      });

      test('it omits null fields (spoiler, sharing)', () {
        final requestWithoutOptionalFields = CommentListRequest(
          list: list,
          comment: 'Amazing list!',
        );

        final expectedJson = {'list': listJson, 'comment': 'Amazing list!'};

        final json = requestWithoutOptionalFields.toJson();
        expect(json, expectedJson);
        expect(json.containsKey('spoiler'), isFalse);
        expect(json.containsKey('sharing'), isFalse);
      });
    });
  });
}
