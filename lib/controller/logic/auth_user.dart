import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/controller/models/user.dart';
import 'package:sangjishik/controller/data/token.dart';
import 'package:sangjishik/service/nodejs.dart';

class AuthUser extends ChangeNotifier {
  User? user;
  bool isAdmin = false;

  NodeJs get nodejs => GetIt.I.get<NodeJs>();

  void setUser(User? user) {
    this.user = user;

    if (user != null) isAdmin = user.role == 'Admin';
    if (user == null) {
      isAdmin = false;
      tokens.updateToken(Token('', ''));
    }
    notifyListeners();
  }

  Future<bool> createPost(String title, String tags, XFile image, String post) async {
    CloudinaryResponse cloudinaryResponse = await cloudinary.uploadImage(image.path);

    Response response = await nodejs.createPost(title, tags, cloudinaryResponse.url, post, tokens.token.refreshToken);
    if (response.statusCode == 200) return true;

    return false;
  }
}
