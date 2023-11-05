import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/controller/models/user.dart';

class AuthUser extends ChangeNotifier {
  User? user;
  bool isAdmin = false;

  void setUser(User user) {
    this.user = user;

    isAdmin = user.role == 'Admin';
    notifyListeners();
  }
}
