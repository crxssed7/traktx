import 'dart:convert';

import 'package:traktx/src/core/client.dart';
import 'package:traktx/src/models/note.dart';
import 'package:traktx/src/models/note_item.dart';
import 'package:traktx/src/requests/note_create_request.dart';

class NotesService {
  final Client _client;

  NotesService(this._client);

  Future<Note> post(NoteCreateRequest request) async {
    final response = await _client.post('/notes');
    final Map<String, dynamic> raw = json.decode(response.body);
    return Note.fromJson(raw);
  }

  Future<Note> get(int id) async {
    final response = await _client.get('/notes/$id');
    final Map<String, dynamic> raw = json.decode(response.body);
    return Note.fromJson(raw);
  }

  Future<Note> update(
    int id, {
    required String notes,
    bool? spoiler,
    String? privacy,
  }) async {
    final body = {
      'notes': notes,
      if (spoiler != null) 'spoiler': spoiler,
      if (privacy != null) 'privacy': privacy,
    };
    final response = await _client.put('/notes/$id', body: body);
    final Map<String, dynamic> raw = json.decode(response.body);
    return Note.fromJson(raw);
  }

  Future<void> delete(int id) async {
    await _client.delete('/notes/$id');
  }

  Future<NoteItem> item(int id) async {
    final response = await _client.get('/notes/$id/item');
    final Map<String, dynamic> raw = json.decode(response.body);
    return NoteItem.fromJson(raw);
  }
}
