import 'dart:convert';

import 'package:traktx/src/models/comment.dart';
import 'package:traktx/src/models/list.dart' as list;
import 'package:traktx/src/core/client.dart';
import 'package:traktx/src/models/list_item.dart';
import 'package:traktx/src/models/user.dart';

class ListsService {
  final Client _client;

  ListsService(this._client);

  Future<List<list.List>> trending() async {
    final response = await _client.get('/lists/trending');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((l) => list.List.fromJson(l["list"])).toList();
  }

  Future<List<list.List>> popular() async {
    final response = await _client.get('/lists/popular');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((l) => list.List.fromJson(l["list"])).toList();
  }

  Future<list.List> get(int id) async {
    final response = await _client.get('/lists/$id');
    final Map<String, dynamic> raw = json.decode(response.body);
    return list.List.fromJson(raw);
  }

  Future<List<User>> likes(int id) async {
    final response = await _client.get('/lists/$id/likes');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((user) => User.fromJson(user["user"])).toList();
  }

  Future<void> like(int id) async {
    await _client.post('/lists/$id/like');
  }

  Future<void> unlike(int id) async {
    await _client.delete('/lists/$id/like');
  }

  Future<List<ListItem>> items(
    int id, {
    String? type,
    String sortBy = 'rank',
    String sortHow = 'asc',
  }) async {
    var path = '/lists/$id/items';
    if (type != null) {
      path = '$path/$type/$sortBy/$sortHow';
    }
    final response = await _client.get(path);
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((item) => ListItem.fromJson(item)).toList();
  }

  Future<List<Comment>> comments(int id, {String sort = 'newest'}) async {
    final response = await _client.get('/lists/$id/comments/$sort');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((comment) => Comment.fromJson(comment)).toList();
  }
}
