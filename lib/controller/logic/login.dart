import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/service/nodejs.dart';
import 'package:sangjishik/controller/models/enums.dart';

class Login extends ChangeNotifier {
  bool isLoggedIn = false;
  late String email;

  NodeJs get nodejs => GetIt.I.get<NodeJs>();

  Future<LoginVerification> loginWithEmail(String email, String password) async {
    /*  What outcomes are there?
    * Wrong password
    * Email does not exist
    * Network error
    * Pass
    * */

    isLoggedIn = false;
    return LoginVerification.WRONG;
  }

  Future<bool> createAccount(String email, String password) async {
    return true;
  }

  Future<bool> verifyEmailAddress() async {
    return false;
  }

  Future<bool> forgotPassword() async {
    return false;
  }

  Future<bool> sendVerificationEmail() async {
    return false;
  }
}
