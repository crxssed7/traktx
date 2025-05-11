import 'dart:convert';

import 'package:traktx/src/core/client.dart';
import 'package:traktx/src/models/comment.dart';
import 'package:traktx/src/models/comment_item.dart';
import 'package:traktx/src/models/user.dart';
import 'package:traktx/src/requests/comment_create_request.dart';

class CommentsService {
  final Client _client;

  CommentsService(this._client);

  Future<Comment> post(CommentCreateRequest request) async {
    final response = await _client.post('/comments', body: request.toJson());
    final Map<String, dynamic> raw = json.decode(response.body);
    return Comment.fromJson(raw);
  }

  Future<Comment> get(int id) async {
    final response = await _client.get('/comments/$id');
    final Map<String, dynamic> raw = json.decode(response.body);
    return Comment.fromJson(raw);
  }

  Future<Comment> update(
    int id, {
    required String comment,
    required bool spoiler,
  }) async {
    final response = await _client.put(
      '/comments/$id',
      body: {'comment': comment, 'spoiler': spoiler},
    );
    final Map<String, dynamic> raw = json.decode(response.body);
    return Comment.fromJson(raw);
  }

  Future<void> delete(int id) async {
    await _client.delete('/comments/$id');
  }

  Future<List<Comment>> replies(int id) async {
    final response = await _client.get('/comments/$id/replies');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((reply) => Comment.fromJson(reply)).toList();
  }

  Future<Comment> postReply(
    int id, {
    required String comment,
    required bool spoiler,
  }) async {
    final response = await _client.post(
      '/comments/$id/replies',
      body: {'comment': comment, 'spoiler': spoiler},
    );
    final Map<String, dynamic> raw = json.decode(response.body);
    return Comment.fromJson(raw);
  }

  Future<CommentItem> item(int id) async {
    final response = await _client.get('/comments/$id/item');
    final Map<String, dynamic> raw = json.decode(response.body);
    return CommentItem.fromJson(raw);
  }

  Future<List<User>> likes(int id) async {
    final response = await _client.get('/comments/$id/likes');
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((raw) => User.fromJson(raw["user"])).toList();
  }

  Future<void> like(int id) async {
    await _client.post('/comments/$id/like');
  }

  Future<void> unlike(int id) async {
    await _client.delete('/comments/$id/like');
  }

  Future<List<CommentItem>> trending({
    String? commentType,
    String type = 'all',
  }) async {
    var path = '/comments/trending';
    if (commentType != null) {
      path = '$path/$commentType/$type';
    }
    final response = await _client.get(path);
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((raw) => CommentItem.fromJson(raw)).toList();
  }

  Future<List<CommentItem>> recent({
    String? commentType,
    String type = 'all',
  }) async {
    var path = '/comments/recent';
    if (commentType != null) {
      path = '$path/$commentType/$type';
    }
    final response = await _client.get(path);
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((raw) => CommentItem.fromJson(raw)).toList();
  }

  Future<List<CommentItem>> updates({
    String? commentType,
    String type = 'all',
  }) async {
    var path = '/comments/updates';
    if (commentType != null) {
      path = '$path/$commentType/$type';
    }
    final response = await _client.get(path);
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((raw) => CommentItem.fromJson(raw)).toList();
  }
}
