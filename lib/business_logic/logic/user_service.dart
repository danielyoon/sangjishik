import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/service/nodejs.dart';
import 'package:sangjishik/business_logic/models/post.dart';

class UserService {
  NodeJs get nodeJs => GetIt.I.get<NodeJs>();

  Future<void> loginWithTokens(String token) async {}

  Future<bool> loginWithEmail(String email, String password) async {
    return false;
  }

  Future<void> forgotPassword(String email) async {
    print('Forgot Password?');
  }

  Future<void> sendVerificationEmail(String email) async {
    print('Trying to Create!');
  }

  Future<void> resendVerificationEmail(String email) async {
    print('Trying to Create pt.2');
  }

  Future<bool> createAccount(String email, String password) async {
    print('Created someone!');
    return false;
  }

  Future<void> createPost(String title, String post, List<String> tags, XFile image) async {
    var response = await cloudinary.uploadImage(image.path);

    Map<String, dynamic>? data = await nodeJs.createPost(title, post, tags, response.url);

    if (data != null) {
      Post post = Post.fromJson(data);
    }
  }

  Future<void> getPosts() async {}
}
