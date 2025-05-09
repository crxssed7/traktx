import 'dart:convert';

import 'package:traktx/src/core/client.dart';
import 'package:traktx/src/models/certification.dart';

class CertificationsService {
  final Client _client;

  CertificationsService(this._client);

  Future<List<Certification>> list(String type) async {
    final response = await _client.get('/certifications/$type');
    final Map<String, dynamic> raw = json.decode(response.body);
    final List<dynamic> list = raw["us"];
    return list.map((cert) => Certification.fromJson(cert)).toList();
  }
}
