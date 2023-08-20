import 'package:image_picker/image_picker.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/service/nodejs.dart';
import 'package:sangjishik/business_logic/models/post.dart';
import 'package:sangjishik/business_logic/utils/string_utils.dart';
import 'package:sangjishik/business_logic/models/user.dart';
import 'package:sangjishik/business_logic/data/token.dart';

import 'package:sangjishik/business_logic/data/temp_posts.dart';

class UserService {
  NodeJs get nodeJs => GetIt.I.get<NodeJs>();

  Future<void> loginWithToken(String token) async {
    Map<String, dynamic>? data =
        await nodeJs.loginWithToken(token);
    if (data != null) {
      Token token =
          Token(data['jwtToken'], data['refreshToken']);
      tokens.updateToken(token);

      Map<String, dynamic> userData = data['user'];
      User user = User.fromJson(userData);
      appModel.currentUser = user;
    }
  }

  Future<bool> loginWithEmail(
      String email, String password) async {
    Map<String, dynamic>? data =
        await nodeJs.loginWithEmail(email, password);
    if (data != null) {
      Token token =
          Token(data['jwtToken'], data['refreshToken']);
      tokens.updateToken(token);

      Map<String, dynamic> userData = data['user'];
      User user = User.fromJson(userData);
      appModel.currentUser = user;

      return true;
    }

    return false;
  }

  Future<bool> forgotPassword(String email) async {
    bool success = await nodeJs.forgotPassword(email);

    return success;
  }

  Future<bool> sendVerificationEmail(String email) async {
    bool success =
        await nodeJs.sendVerificationEmail(email);

    return success;
  }

  Future<bool> createAccount(String email, String password,
      String verification) async {
    Map<String, dynamic>? data = await nodeJs.createAccount(
        email, password, verification);
    if (data != null) {
      Token token =
          Token(data['jwtToken'], data['refreshToken']);
      tokens.updateToken(token);

      Map<String, dynamic> userData = data['user'];
      User user = User.fromJson(userData);
      appModel.currentUser = user;

      return true;
    }
    return false;
  }

  Future<void> createPost(String title, String post,
      List<String> tags, XFile image) async {
    var response = await cloudinary.uploadImage(image.path);

    Map<String, dynamic>? data = await nodeJs.createPost(
        title, post, tags, response.url);

    if (data != null) {
      Post post = Post.fromJson(data);

      appModel.posts.add(post);
    }
  }

  Future<void> getPosts() async {
    List<Post> myPosts = [];

    for (int i = 0; i < tempPosts.length; i++) {
      String title = StringUtils.replaceSpacesWithHyphens(
          tempPosts[i]['title']);
      myPosts.add(
        Post(
            title,
            'TEST',
            tempPosts[i]['image'],
            tempPosts[i]['tags'],
            i,
            tempPosts[i]['date'],
            null),
      );
    }

    myPosts.sort((a, b) => b.date.compareTo(a.date));
    appModel.addPosts(myPosts);
  }
}
