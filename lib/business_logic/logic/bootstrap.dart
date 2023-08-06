import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/service/cloudinary.dart';

class Bootstrap {
  bool isBootstrapComplete = false;

  Future<void> init() async {
    await tokens.init();

    await Cloudinary.init();

    if (tokens.token.refreshToken.isNotEmpty) {
      //If refreshToken is not empty, attempt background login with token -- then set appModel as logged in.
    }

    isBootstrapComplete = true;
  }
}
