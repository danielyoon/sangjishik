import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/controller/models/user.dart';
import 'package:sangjishik/controller/data/token.dart';

class AuthUser extends ChangeNotifier {
  User? user;
  bool isAdmin = false;

  void setUser(User? user) {
    this.user = user;

    if (user != null) isAdmin = user.role == 'Admin';
    if (user == null) {
      isAdmin = false;
      tokens.updateToken(Token('', ''));
    }
    notifyListeners();
  }
}
