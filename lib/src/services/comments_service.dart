import 'dart:convert';

import 'package:traktx/src/core/client.dart';
import 'package:traktx/src/models/comment.dart';
import 'package:traktx/src/requests/comment_movie_request.dart';

class CommentsService {
  final Client _client;

  CommentsService(this._client);

  // TODO: Other request types
  Future<Comment> post(CommentMovieRequest request) async {
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

  // TODO: Other endpoints
}
