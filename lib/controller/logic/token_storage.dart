import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sangjishik/controller/data/token.dart';

class TokenStorage {
  late Token token;

  Future<void> init() async {
    final p = (await SharedPreferences.getInstance()).getString('tokens.dat');

    if (p == null) {
      token = Token('', '');
      return;
    }

    token = Token.fromJson(Map<String, dynamic>.from(jsonDecode(p)));
  }

  Future<void> save(Map<String, dynamic> data) async {
    await (await SharedPreferences.getInstance()).setString('tokens.dat', jsonEncode(data));
  }

  void updateToken(Token newToken) async {
    token = Token.fromJson(newToken.toJson());

    await save(newToken.toJson());
  }
}
