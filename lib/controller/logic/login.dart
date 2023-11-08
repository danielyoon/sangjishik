import 'dart:convert';

import 'package:http/http.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/service/nodejs.dart';
import 'package:sangjishik/controller/models/enums.dart';

import 'package:sangjishik/controller/models/user.dart';
import 'package:sangjishik/controller/models/token.dart';

class Login extends ChangeNotifier {
  NodeJs get nodejs => GetIt.I.get<NodeJs>();

  Future<LoginVerification> loginWithEmail(String email, String password) async {
    try {
      Response response = await nodejs.loginWithEmail(email, password);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        Map<String, dynamic> userJson = data['user'];
        User user = User.fromJson(userJson);

        Token token = Token(data['jwtToken'], data['refreshToken']);
        tokens.updateToken(token);

        auth.setUser(user);

        return LoginVerification.PASS;
      }

      if (response.statusCode == 401) return LoginVerification.WRONG;

      return LoginVerification.NONEXISTENT;
    } catch (e) {
      return LoginVerification.NETWORK;
    }
  }

  Future<LoginVerification> createAccount(String email) async {
    try {
      Response response = await nodejs.createAccount(email);

      if (response.statusCode == 200) return LoginVerification.PASS;
      if (response.statusCode == 404) return LoginVerification.NONEXISTENT;

      return LoginVerification.WRONG;
    } catch (e) {
      return LoginVerification.NETWORK;
    }
  }

  Future<LoginVerification> forgotPassword(String email) async {
    try {
      Response response = await nodejs.forgotPassword(email);

      if (response.statusCode == 200) return LoginVerification.PASS;
      if (response.statusCode == 404) return LoginVerification.NONEXISTENT;

      return LoginVerification.NETWORK;
    } catch (e) {
      return LoginVerification.NETWORK;
    }
  }

  Future<LoginVerification> verifyCode(String email, String verification) async {
    try {
      Response response = await nodejs.verifyCode(email, verification);

      if (response.statusCode == 200) return LoginVerification.PASS;

      return LoginVerification.WRONG;
    } catch (e) {
      return LoginVerification.NETWORK;
    }
  }

  Future<LoginVerification> sendVerificationEmail(String email) async {
    try {
      Response response = await nodejs.sendVerificationEmail(email);

      if (response.statusCode == 200) return LoginVerification.PASS;

      return LoginVerification.NETWORK;
    } catch (e) {
      return LoginVerification.NETWORK;
    }
  }

  Future<LoginVerification> createNewPassword(String email, String password) async {
    try {
      Response response = await nodejs.createNewPassword(email, password);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        Map<String, dynamic> userJson = data['user'];
        User user = User.fromJson(userJson);

        Token token = Token(data['jwtToken'], data['refreshToken']);
        tokens.updateToken(token);

        auth.setUser(user);

        return LoginVerification.PASS;
      }

      return LoginVerification.WRONG;
    } catch (e) {
      return LoginVerification.NETWORK;
    }
  }

  Future<LoginVerification> loginWithToken(String token) async {
    Response response = await nodejs.loginWithToken(token);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      Map<String, dynamic> userJson = data['user'];
      User user = User.fromJson(userJson);

      Token token = Token(data['jwtToken'], data['refreshToken']);
      tokens.updateToken(token);

      auth.setUser(user);

      return LoginVerification.PASS;
    }
    return LoginVerification.WRONG;
  }

  Future<bool> logout(String token) async {
    Response response = await nodejs.logout(token);

    if (response.statusCode == 200) return true;
    return false;
  }
}
