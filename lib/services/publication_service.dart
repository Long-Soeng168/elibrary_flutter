import 'dart:convert';
import 'package:elibrary/config/env.dart';
import 'package:http/http.dart' as http;
import 'package:elibrary/models/publication.dart';

class PublicationService {
  static Future<List<Publication>> fetchPublications() async {
    const url = '${Env.baseApiUrl}publications';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      List<dynamic> data = result['data'];
      return data.map((item) {
        return Publication(
          id: item['id'],
          name: item['name'] ?? '',
          image: item['image'] ?? '',
        );
      }).toList();
      
    } else {
      throw Exception('Failed to load publication');
    }
  }
}
