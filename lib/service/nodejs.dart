import 'package:http/http.dart' as http;

class NodeJs {
  Future<http.Response> loginWithEmail(String email, String password) {
    return APIService.post('/users/login-with-email', {'email': email, 'password': password});
  }

  Future<http.Response> createAccount(String email) {
    return APIService.post('/users/create-account', {'email': email});
  }

  Future<http.Response> forgotPassword(String email) {
    return APIService.post('/users/forgot-password', {'email': email});
  }

  Future<http.Response> verifyCode(String email, String verification) {
    return APIService.post('/users/verify-token', {'email': email, 'token': verification});
  }

  Future<http.Response> sendVerificationEmail(String email) {
    return APIService.post('/users/send-verification-email', {'email': email});
  }

  Future<http.Response> createNewPassword(String email, String password) {
    return APIService.post('/users/update-password', {'email': email, 'password': password});
  }

  Future<http.Response> loginWithToken(String token) {
    return APIService.post('/users/login-with-token', {'token': token});
  }

  Future<http.Response> logout(String token) {
    return APIService.post('/users/logout', {'token': token}, headers: {'Authorization': 'Bearer $token'});
  }

  Future<http.Response> createPost(String title, String tags, String image, String post, String token) {
    return APIService.post('/posts/create-post', {'title': title, 'tags': tags, 'image': image, 'post': post},
        headers: {'Authorization': 'Bearer $token'});
  }

  Future<http.Response> getPosts() {
    return APIService.get('/posts/get-posts');
  }

  Future<http.Response> refreshToken(String token) {
    return APIService.post('/users/refresh-token', {'token': token});
  }
}

class APIService {
  static var client = http.Client();
  static const _baseUrl = 'sangjishik.com';

  static Future<http.Response> post<T>(String path, Map<String, dynamic> body, {Map<String, String>? headers}) async {
    Uri url = Uri.https(_baseUrl, path);
    http.Response response = await client.post(url, body: body, headers: headers ?? {});
    return response;
  }

  static Future<http.Response> get<T>(String path) async {
    Uri url = Uri.https(_baseUrl, path);
    http.Response response = await client.get(url);

    return response;
  }
}
