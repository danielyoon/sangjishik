import 'package:http/http.dart' as http;

class NodeJs {
  var client = http.Client();
  final _baseUrl = 'sangjishik-0fb55917ce1d.herokuapp.com';
  final Map<String, String> _headers = {};

  Future<bool> createPost(String title, String post, List<String> tags, String image) async {
    Uri url = Uri.https(_baseUrl, '/users/create-post');

    print('Title: $title');
    print('Post: $post');
    print('Tags: $tags');
    print('Image: $image');

    // _headers['Authorization'] = 'Bearer ${tokens.token.jwtToken}';
    http.Response response = await client.post(
      url,
      body: {'title': title, 'post': post, 'tags': tags.toString(), 'image': image},
    );

    if (response.statusCode == 200) {
      print('Post created successfully');
      return true;
    } else {
      print('Error creating post. Status code: ${response.statusCode}');
      return false;
    }
  }
}
