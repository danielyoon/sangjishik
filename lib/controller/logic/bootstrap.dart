import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/service/cloudinary.dart';

class Bootstrap {
  bool isBootstrapComplete = false;

  Future<void> init() async {
    await tokens.init();
    await Cloudinary.init();
    // await userService.getPosts();

    String token = tokens.token.refreshToken;

    if (token.isNotEmpty) {
      await login.loginWithToken(token);
    }

    isBootstrapComplete = true;
  }
}
