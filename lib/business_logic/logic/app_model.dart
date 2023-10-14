import 'package:sangjishik/business_logic/models/post.dart';
import 'package:sangjishik/business_logic/models/user.dart';
import 'package:sangjishik/business_logic/utils/easy_notifier.dart';

abstract class AbstractModel extends EasyNotifier {}

class AppModel extends AbstractModel {
  User? _currentUser;
  User? get currentUser => _currentUser;
  set currentUser(User? currentUser) =>
      notify(() => _currentUser = currentUser);

  bool? get isLoggedIn => currentUser != null
      ? currentUser!.id.isNotEmpty
      : false;
  bool? get isAdmin => currentUser != null
      ? currentUser!.role == 'Admin'
      : false;

  final List<Post> _posts = [];
  List<Post> get posts => _posts;

  List<String> _tags = [];
  List<String> get tags => _tags;
  set tags(List<String> tag) => notify(() => _tags = tag);

  void addPosts(List<Post> newPosts) {
    for (int i = 0; i < newPosts.length; i++) {
      _posts.add(newPosts[i]);
    }
  }
}
