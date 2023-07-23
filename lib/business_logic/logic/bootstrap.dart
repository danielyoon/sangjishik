import 'package:sangjishik/core_packages.dart';

class Bootstrap {
  bool isBootstrapComplete = false;

  Future<void> init() async {
    await tokens.init();

    if (tokens.token.refreshToken.isNotEmpty) {
      //If refreshToken is not empty, attempt background login with token -- then set appModel as logged in.
    }

    isBootstrapComplete = true;
  }
}
