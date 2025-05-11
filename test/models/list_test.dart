import 'package:traktx/src/models/list.dart';
import 'package:traktx/src/models/trakt_ids.dart';
import 'package:traktx/src/models/user.dart';
import 'package:test/test.dart';

void main() {
  group('List', () {
    final user = User(
      username: 'crxssed',
      private: false,
      vip: true,
      vipEp: false,
      ids: TraktIds(trakt: 1),
    );

    final listData = List(
      name: 'MCU',
      description:
          'All MCU movies in release order\n\n**Check out this Trello board for the timeline order:** https://trello.com/b/gfICarhA',
      privacy: 'public',
      shareLink: 'https://trakt.tv/lists/22026236',
      type: 'personal',
      displayNumbers: false,
      allowComments: true,
      sortBy: 'released',
      sortHow: 'asc',
      createdAt: DateTime.parse('2021-08-05T10:26:41.000Z'),
      updatedAt: DateTime.parse('2025-05-10T16:16:51.000Z'),
      itemCount: 39,
      commentCount: 1,
      likes: 0,
      ids: TraktIds(trakt: 22026236, slug: 'mcu'),
      user: user,
    );

    group('fromJson', () {
      test('it converts json', () {
        final json = {
          'name': 'MCU',
          'description':
              'All MCU movies in release order\n\n**Check out this Trello board for the timeline order:** https://trello.com/b/gfICarhA',
          'privacy': 'public',
          'share_link': 'https://trakt.tv/lists/22026236',
          'type': 'personal',
          'display_numbers': false,
          'allow_comments': true,
          'sort_by': 'released',
          'sort_how': 'asc',
          'created_at': '2021-08-05T10:26:41.000Z',
          'updated_at': '2025-05-10T16:16:51.000Z',
          'item_count': 39,
          'comment_count': 1,
          'likes': 0,
          'ids': {'trakt': 22026236, 'slug': 'mcu'},
          'user': {
            'username': 'crxssed',
            'private': false,
            'vip': true,
            'vip_ep': false,
            'ids': {'slug': 'crxssed'},
          },
        };

        final list = List.fromJson(json);

        expect(list.name, 'MCU');
        expect(
          list.description,
          'All MCU movies in release order\n\n**Check out this Trello board for the timeline order:** https://trello.com/b/gfICarhA',
        );
        expect(list.privacy, 'public');
        expect(list.shareLink, 'https://trakt.tv/lists/22026236');
        expect(list.type, 'personal');
        expect(list.displayNumbers, false);
        expect(list.allowComments, true);
        expect(list.sortBy, 'released');
        expect(list.sortHow, 'asc');
        expect(list.createdAt, DateTime.parse('2021-08-05T10:26:41.000Z'));
        expect(list.updatedAt, DateTime.parse('2025-05-10T16:16:51.000Z'));
        expect(list.itemCount, 39);
        expect(list.commentCount, 1);
        expect(list.likes, 0);
        expect(list.ids.trakt, 22026236);
        expect(list.ids.slug, 'mcu');
        expect(list.user.username, 'crxssed');
      });
    });

    group('toJson', () {
      test('it converts to json', () {
        final expectedJson = {
          'name': 'MCU',
          'description':
              'All MCU movies in release order\n\n**Check out this Trello board for the timeline order:** https://trello.com/b/gfICarhA',
          'privacy': 'public',
          'share_link': 'https://trakt.tv/lists/22026236',
          'type': 'personal',
          'display_numbers': false,
          'allow_comments': true,
          'sort_by': 'released',
          'sort_how': 'asc',
          'created_at': '2021-08-05T10:26:41.000Z',
          'updated_at': '2025-05-10T16:16:51.000Z',
          'item_count': 39,
          'comment_count': 1,
          'likes': 0,
          'ids': {'trakt': 22026236, 'slug': 'mcu'},
          'user': {
            'username': 'crxssed',
            'private': false,
            'name': null,
            'vip': true,
            'vip_ep': false,
            'ids': {'trakt': 1},
          },
        };

        final json = listData.toJson();

        expect(json, expectedJson);
      });
    });
  });
}
