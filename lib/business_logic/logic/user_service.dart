import 'package:sangjishik/core_packages.dart';

class UserService {
  Future<void> loginWithTokens(String token) async {}

  Future<bool> loginWithEmail(String email, String password) async {
    return false;
  }

  Future<void> forgotPassword(String email) async {}

  Future<void> sendVerificationEmail(String email) async {}

  Future<void> resendVerificationEmail(String email) async {}

  Future<bool> createAccount(String email, String password) async {
    return false;
  }

  Future<void> createPost(String title, String post, List<String> tags, String image) async {}
}
