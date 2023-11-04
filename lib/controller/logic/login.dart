import 'dart:convert';

import 'package:http/http.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/service/nodejs.dart';
import 'package:sangjishik/controller/models/enums.dart';

import 'package:sangjishik/controller/models/user.dart';
import 'package:sangjishik/controller/data/token.dart';

class Login extends ChangeNotifier {
  NodeJs get nodejs => GetIt.I.get<NodeJs>();

  Future<LoginVerification> loginWithEmail(String email, String password) async {
    /*  What outcomes are there?
    * Wrong password
    * Email does not exist
    * Pass
    * */
    try {
      Response response = await nodejs.loginWithEmail(email, password);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        User user = User.fromJson(data);

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

  Future<bool> createAccount(String email, String password) async {
    /*  What outcomes are there?
    * Email already exists
    * Pass
    * */
    return false;
  }

  Future<bool> forgotPassword(String email) async {
    /*  What outcomes are there?
    * Email doesn't exist
    * Pass
    * */
    return true;
  }

  Future<bool> verifyCode(String verification) async {
    /*  What outcomes are there?
    * Wrong
    * Pass
    * */
    return false;
  }

  Future<void> sendVerificationEmail(String email) async {
    /*  What outcomes are there?
    * Pass
    * */
  }

  Future<bool> createNewPassword(String password) async {
    /*  What outcomes are there?
    * Too short
    * Pass
    * */
    return false;
  }
}
