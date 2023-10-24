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
    * Pass
    * */

    isLoggedIn = false;
    return LoginVerification.WRONG;
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
