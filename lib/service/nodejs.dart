import 'dart:convert';
import 'package:sangjishik/core_packages.dart';

import 'package:http/http.dart' as http;

class NodeJs {
  var client = http.Client();
  final _baseUrl = 'sangjishik.com';
  final Map<String, String> _headers = {};

  // Future<Map<String, dynamic>?> createPost(String title, String post, List<String> tags, String image) async {
  //   Map<String, dynamic>? data;
  //   Uri url = Uri.https(_baseUrl, '/users/create-post');
  //
  //   _headers['Authorization'] = 'Bearer ${tokens.token.jwtToken}';
  //   http.Response response = await client.post(
  //     url,
  //     body: {'title': title, 'post': post, 'tags': tags.toString(), 'image': image},
  //   );
  //
  //   data = jsonDecode(response.body);
  //
  //   return data;
  // }

  Future<http.Response> loginWithEmail(String email, String password) async {
    Uri url = Uri.https(_baseUrl, '/users/login-with-email');
    http.Response response = await client.post(url, body: {'email': email, 'password': password});

    return response;
  }

  Future<Map<String, dynamic>?> loginWithToken(String token) async {
    Uri url = Uri.https(_baseUrl, '/users/login-with-token');
    http.Response response = await client.post(url, body: {'token': token});

    if (response.statusCode != 200) return null;

    Map<String, dynamic> data = jsonDecode(response.body);

    return data;
  }

  Future<bool> forgotPassword(String email) async {
    Uri url = Uri.https(_baseUrl, '/users/forgot-password');
    http.Response response = await client.post(url, body: {'email': email});

    if (response.statusCode == 200) return true;

    return false;
  }

  Future<bool> sendVerificationEmail(String email) async {
    Uri url = Uri.https(_baseUrl, '/users/send-verification-email');
    http.Response response = await client.post(url, body: {'email': email});

    if (response.statusCode == 200) return true;

    return false;
  }

  Future<Map<String, dynamic>?> createAccount(String email, String password, String verification) async {
    Uri url = Uri.https(_baseUrl, '/users/create-account');
    http.Response response =
        await client.post(url, body: {'email': email, 'password': password, 'verification': verification});

    if (response.statusCode != 200) return null;

    Map<String, dynamic> data = jsonDecode(response.body);

    return data;
  }

  Future<void> refreshToken() async {}
}
