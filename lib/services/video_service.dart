import 'dart:convert';
import 'package:elibrary/config/env.dart';
import 'package:elibrary/models/video.dart';
import 'package:http/http.dart' as http;

class VideoService {
  static Future<List<Video>> fetchVideos() async {
    const url = '${Env.baseApiUrl}videos';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      List<dynamic> data = result['data'];
      return data.map((item) {
        return Video(
          id: item['id'],
          name: item['name'] ?? '',
          image: item['image'] ?? '',
        );
      }).toList();
      
    } else {
      throw Exception('Failed to load video');
    }
  }
}
