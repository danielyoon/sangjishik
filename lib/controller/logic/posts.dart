import 'dart:convert';

import 'package:http/http.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/controller/models/post.dart';
import 'package:sangjishik/service/nodejs.dart';

class Posts extends ChangeNotifier {
  List<Post> posts = [];

  NodeJs get nodejs => GetIt.I.get<NodeJs>();

  Future<void> getPosts() async {
    Response response = await nodejs.getPosts();

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      for (int i = 0; i < data.length; i++) {
        posts.add(Post.fromJson(data[0]));
      }
    }
  }
}
