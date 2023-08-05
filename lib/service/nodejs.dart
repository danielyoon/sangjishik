import 'dart:convert';

import 'package:http/http.dart' as http;

class NodeJs {
  var client = http.Client();
  final _baseUrl = 'sangjishik-0fb55917ce1d.herokuapp.com';
  final Map<String, String> _headers = {};

  Future<Map<String, dynamic>?> createPost(String title,
      String post, List<String> tags, String image) async {
    Map<String, dynamic>? data;
    Uri url = Uri.https(_baseUrl, '/users/create-post');

    // _headers['Authorization'] = 'Bearer ${tokens.token.jwtToken}';
    http.Response response = await client.post(
      url,
      body: {
        'title': title,
        'post': post,
        'tags': tags.toString(),
        'image': image
      },
    );

    data = jsonDecode(response.body);

    return data;
  }
}
